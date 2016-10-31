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
			<td align="center"><font style="font-size:30px;font-family:Dokdo;">로그인 실패</font><br>&nbsp;</td>
		</tr>
		<tr class="board-normal">
			<td align="center">해당하는 아이디/비밀번호가 없습니다.</td>
		</tr>
		</table><br><br><br><br>
		<table class="board1" style="border-bottom:none;">
		<tr>
		<td align="left"><a class="a_sok" href="member.do?rt=mobile&method=loginform">&nbsp;로그인</a>
		<td align="right"><a class="a_sok" href="search.do?rt=mobile&method=sid_form">아이디 찾기&nbsp;</a>
		</tr>
		<tr>
		<td align="left"><a class="a_sok" href="member.do?rt=mobile&method=joinform"><br>&nbsp;회원가입</a>
		<td align="right"><a class="a_sok" href="search.do?rt=mobile&method=spw_form"><br>비밀번호 찾기&nbsp;</a>
		</td>
		</table>	
</div>
</div>
</div>
</body>

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