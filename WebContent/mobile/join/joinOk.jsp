<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<body style="margin: 0px;" bgcolor="transparent">
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
	<br><br>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center"><font style="font-size:30px;font-family:Dokdo;">회원가입 완료</font><br>&nbsp;</td>
	</tr>
	<tr class="board-normal">
		<td align="center">쉬어가기의 회원이 되신 것을 환영합니다.</td>
	</tr>
	</table><br><br><br>
	
	<div align="center">
	<a class="adel" href="member.do?rt=mobile&method=loginform" id="go_login" 
	style="font-family:Dokdo;font-size:30px;">로그인하기</a>
	</div>
	
</div>
</div>
</div>
</body>

<script>
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
});
</script>