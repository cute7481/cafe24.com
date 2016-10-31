<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


	<style type="text/css">
	   table{text-align: center} 
	</style>

 <body style="margin: 0px;" bgcolor="transparent" onload="pw_search_form.id.focus();">
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
		<td align="center">비밀번호 찾기</td>
	</tr>
	</table><br>

	<form id="pw_search_form" action="search.do?rt=mobile&method=s_pwd" method="post">
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
		<td align="center"><br>이름</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="name" id="name_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="name_form-error" class="error" for="name_form"></label></td>
	</tr>
    <tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>이메일</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="email" id="email_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="email_form-error" class="error" for="email_form"></label></td>
	</tr>
	</table>
	</form>
	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="adel" id="btn_spw"><br>찾기</a>
	</td>
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
 	
 	$("#pw_search_form").validate({
 		rules:{
 			id:{
 				required: true,
 				minlength:6,
 			},
 			name:{
 				required: true,
 				minlength:3,
 			},
 			email:{
 				required: true,
 				minlength:3,
 				email:true
 			}
 		}
 	});		
	$("#btn_spw").click(function(event){
		if(!$("#pw_search_form").valid()){
			alert("정보가 올바르지 않습니다.");
		}else{
			$("#pw_search_form").submit();
		}
	});
});
</script>