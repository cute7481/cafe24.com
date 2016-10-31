<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<style type="text/css">
	   table{text-align: center} 
	</style>
 <body style="margin: 0px;" bgcolor="transparent" onload="id_search_form.name.focus();">
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
		<td align="center">아이디 찾기</td>
	</tr>
	</table><br>
	
	<form id="id_search_form" action="search.do?rt=mobile&method=s_id" method="post">
    <table class="board1" style="border-bottom:none;">
    <tr class="board-normal" style="border-bottom:none">
		<td align="center">이름</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="name" id="name_form"></td>
	</tr>
	<tr>
		<td align="center"><label style="color:#F6CED8;" id="name_form-error" class="error" for="name_form"></label></td>
	</tr>
    <tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>닉네임</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="nick" id="nick_form"></td>
	</tr>
	<tr>
	<td align="center"><label style="color:#F6CED8;" id="nick_form-error" class="error" for="nick_form"></label></td>
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
	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="adel" id="btn_sid"><br>찾기</a>
	</td>
	</tr>
	</table>
	</form>
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

 	$("#id_search_form").validate({
 		rules:{
 			name:{
 				required: true,
 				minlength:3,
 			},
 			nick:{
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
	$("#btn_sid").click(function(event){
 		if(!$("#id_search_form").valid()){
 			alert("정보가 올바르지 않습니다.");
 		}else{
 			$("#id_search_form").submit();
 		}
		});
	});
</script>