<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<body style="margin: 0px;" bgcolor="transparent" onload="f.name.focus();">
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
<%
	boolean state = (boolean)request.getAttribute("state");
 	if(state){
%>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center"><font style="font-size:30px;font-family:Dokdo;">비밀번호 변경 완료</font><br>&nbsp;</td>
	</tr>
	<tr class="board-normal">
		<td align="center">로그인이 가능합니다.</td>
	</tr>
	</table><br><br><br>
	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="a_sok" href="member.do?rt=mobile&method=loginform"><br>로그인</a>
	</td>
	</tr>
	</table>
<%
 	}else{
%>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center"><font style="font-size:30px;font-family:Dokdo;">비밀번호 변경 실패</font><br>&nbsp;</td>
	</tr>
	<tr class="board-normal">
		<td align="center">오류 발생. 다시 시도해주세요.</td>
	</tr>
	</table><br><br>
	
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="center">
	<a class="a_sok" href="search.do?rt=mobile&method=spw_form"><br>비밀번호 찾기</a>
	</td>
	</tr>
	</table>
<%
 	}
%>
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