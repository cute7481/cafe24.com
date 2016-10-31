<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	String publicKeyModulus = (String)request.getAttribute("publicKeyModulus");
	String publicKeyExponent = (String)request.getAttribute("publicKeyExponent");
%>
<body style="margin: 0px;" bgcolor="transparent" onload="login_form_fake.id.focus();">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%; height:0px; margin:0; padding:0;"></div>
		<!-- top line-->
		<!-- wrapper -->
		<div class='center-wrapper' style="width:100%; margin:0 auto;">
		<!-- header-->
		<%@include file="../menu.jsp" %>
		
	<div id="tmain">
	<table>
	<tr>
		<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>
	</tr>
	</table>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center">로그인</td>
	</tr>
	</table><br>
	
    <form id="login_form_fake">
    <table class="board1" style="border-bottom:none;">
    <tr class="board-normal" style="border-bottom:none">
		<td align="center">아이디</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="id" id="id_form"></td>
	</tr>
	<tr>
	<td align="center"><label style="color:#F6CED8;" id="id_form-error" class="error" for="id_form"></label></td>
	</tr>
    <tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>비밀번호</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="password" name="pwd" id="pw_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="pw_form-error" class="error" for="pw_form"></label></td>
	</tr>
	<tr>
		<td><input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus %>"/>
		<input type="hidden" id="rsaPublicKeyexponent" value="<%=publicKeyExponent %>"/></td>
	</tr>
	</table>
	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="adel" id="btn_login"><br> [ 로 그 인 ] </a>
	</td>
	</tr>
	</table>
	</form>
	
	<form id="login_form" name="securedLoginForm" action="member.do?rt=mobile&method=login" 
	method="post" style="display: none;">
		<input type="hidden" name="rpage" value="<%=(String)request.getAttribute("rpage")%>"/>
		<input type="hidden" name="securedId" id="securedId" value="" />
		<input type="hidden" name="securedPwd" id="securedPwd" value="" />
	</form>

	<br>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal" style="border-bottom:none;">
		<td>
		<a class="adel" href="search.do?rt=mobile&method=sid_form"> # <font style="color:#CEE3F6">아이디</font>를 잊어버리셨나요?</a><br>
		<a class="adel" href="search.do?rt=mobile&method=spw_form"> # <font style="color:#CEE3F6">비밀번호</font>를 잊어버리셨나요?</a><br>
		<a class="adel" href="member.do?rt=mobile&method=joinform"> # <font style="color:#CEE3F6">회원가입</font>을 하시겠습니까?</a></td>
	</tr>
	</table>
</div>
</div>
</div>
</body>
      
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("mouseenter",".adel",function(){
		$(this).css('color', '#777777');	
	});
	$(document).on("mousedown",".adel",function(){
		$(this).css('color','#505050');
	});
	$(document).on("mouseleave",".adel",function(){
		$(this).css('color','white');
	});
	$(document).on("mouseup",".adel",function(){
		$(this).css('color','#777777');
	});
 	
 	$("#login_form_fake").validate({
 		rules:{
 			id:{
 				required: true,
 				minlength:6,
 			},
 			pwd:{
 				required: true,
 				minlength:6,
 			}
 		}
 	});		
	$("#btn_login").click(function(event){
		if(!$("#login_form_fake").valid()){
			alert("정보가 올바르지 않습니다.");
		}else{
			var id = $("#id_form").val();
			var pwd = $("#pw_form").val();
			try{
				var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
				var rsaPublicKeyExponent = $("#rsaPublicKeyexponent").val();
				submitEncryptedform(id,pwd,rsaPublicKeyModulus,rsaPublicKeyExponent);
			}catch(err){
				alert(err);
			}
		}
	});
	function submitEncryptedform(id, pwd, rsaPublicKeyModulus,rsaPublicKeyExponent){
		var rsa = new RSAKey();
		rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		
		var securedPwd = rsa.encrypt(pwd);
		$("#securedId").val(id);
		$("#securedPwd").val(securedPwd);
		$("#login_form").submit();
	}
	$("#id_form").keydown(function(event){
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    	        || event.keyCode == 46 ) return;
    	        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
   	 	this.value = this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	})
});
</script>