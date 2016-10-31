<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<body style="margin: 0px;" bgcolor="transparent" >
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
	<br>
<%
 	String id = (String)request.getAttribute("id");
 	if(id == null){
 		session.removeAttribute("__rsaPrivateKey__");
%>
<script>
$(document).ready(function(){
	$(document).on("mouseenter",".a_sok",function(){
		$(this).css('color', '#777777');	
	});
	$(document).on("mousedown",".a_sok",function(){
		$(this).css('color','#505050');
	});
	$(document).on("mouseleave",".a_sok",function(){
		$(this).css('color','white');
	});
	$(document).on("mouseup",".a_sok",function(){
		$(this).css('color','#777777');
	});
});
</script>
		<br>
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal">
			<td align="center"><font style="font-size:30px;font-family:Dokdo;">비밀번호 찾기 실패</font><br>&nbsp;</td>
		</tr>
		<tr class="board-normal">
			<td align="center">해당하는 아이디가 없습니다.</td>
		</tr>
		</table><br><br><br>

		<table class="board1" style="border-bottom:none;">
		<tr>
		<td align="left"><a class="a_sok" href="search.do?rt=mobile&method=spw_form">&nbsp;비밀번호 찾기</a>
		<td align="right"><a class="a_sok" href="member.do?rt=mobile&method=join">회원 가입&nbsp;</a>
		</tr>
		<tr>
		<td align="left"><a class="a_sok" href="search.do?rt=mobile&method=sid_form">&nbsp;아이디 찾기</a>
		</td>
		</table>
<%
 	}else{
 		String publicKeyModulus = (String)request.getAttribute("publicKeyModulus");
 		String publicKeyExponent = (String)request.getAttribute("publicKeyExponent");
%>
<script type="text/javascript">
$(document).ready(function(){
	$(document).ready(function(){
		$(document).on("mouseenter",".a_sok",function(){
			$(this).css('color', '#777777');	
		});
		$(document).on("mousedown",".a_sok",function(){
			$(this).css('color','#505050');
		});
		$(document).on("mouseleave",".a_sok",function(){
			$(this).css('color','white');
		});
		$(document).on("mouseup",".a_sok",function(){
			$(this).css('color','#777777');
		});
	});
	$("#update_pw_form_fake").validate({
		rules:{
			pwd:{
				required: true,
				minlength:6,
			},
			rpwd:{
				required: true,
				minlength:6,
				equalTo:pw_form
			}
		},
		messages:{
			rpwd:{
				equalTo: "비밀번호가 일치하지 않습니다."
			}
		}
	});
	$("#btn_uppw").click(function(event){
		if(!$("#update_pw_form_fake").valid()){
			alert("정보가 올바르지 않습니다.");
		}else{
			var chk = confirm("비밀번호를 변경 하시겠습니까?");
			if(chk){
 			var id = $("input[name=s_id]").val();
 			var pwd = $("#pw_form").val();
 			try{
 				var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
 				var rsaPublicKeyExponent = $("#rsaPublicKeyexponent").val();
 				submitEncryptedform(id,pwd,rsaPublicKeyModulus,rsaPublicKeyExponent);
 			}catch(err){
 				alert(err);
 			}
			}else{
				return ;
			}
		}
	});
	function submitEncryptedform(id, pwd, rsaPublicKeyModulus,rsaPublicKeyExponent){
		var rsa = new RSAKey();
		rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		
		var securedPwd = rsa.encrypt(pwd);
		$("#securedId").val(id);
		$("#securedPwd").val(securedPwd);
		$("#update_pw_form").submit();
	}
});
</script>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center"><font style="font-size:30px;font-family:Dokdo;">비밀번호 변경</font><br>&nbsp;</td>
	</tr>
	<tr class="board-normal">
		<td align="center">변경하실 비밀번호를 입력해주세요.</td>
	</tr>
	</table>

	<form id="update_pw_form_fake">
	<input type="hidden" name="s_id" value="<%=id%>">
    <table class="board1" style="border-bottom:none;">
    <tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>새 비밀번호</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="password" name="pwd" id="pw_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="pw_form-error" class="error" for="pw_form"></label></td>
	</tr>
    <tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>새 비밀번호(확인)</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="password" name="rpwd" id="rpw_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="rpw_form-error" class="error" for="rpw_form"></label></td>
	</tr>
	</table>	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="a_sok" id="btn_uppw"><br>변경</a>
	</td>
	</tr>
	</table>
	</form>
	
	<input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus %>"/>
	<input type="hidden" id="rsaPublicKeyexponent" value="<%=publicKeyExponent %>"/>
	<form id="update_pw_form"  action="search.do?rt=mobile&method=pwdUp" method="post" style="display: none;">
		<input type="hidden" name="securedId" id="securedId" value="" />
		<input type="hidden" name="securedPwd" id="securedPwd" value="" />
    </form>
<%
	}
%>
</div>
</div>
</div>
</body>