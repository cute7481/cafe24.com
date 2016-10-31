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
<%
     String userid = (String)request.getAttribute("userid");
     if(userid != ""){
%>
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal">
			<td align="center"><font style="font-size:30px;font-family:Dokdo;">아이디 찾기 성공</font><br>&nbsp;</td>
		</tr>
		<tr class="board-normal">
			<td align="center">아이디&nbsp;&nbsp;<font style="color:#F6CED8;"><%=userid%></font></td>
		</tr>
		</table><br><br><br>
		<table class="board1" style="border-bottom:none;">
		<tr>
		<td align="left"><a class="a_sok" href="search.do?rt=mobile&method=spw_form">&nbsp;비밀번호 찾기</a>
		<td align="right"><a class="a_sok" href="member.do?rt=mobile&method=loginform">로그인&nbsp;</a>
		</tr>
		</table>
<%
     }else{
%>
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal">
			<td align="center"><font style="font-size:30px;font-family:Dokdo;">아이디 찾기 실패</font><br>&nbsp;</td>
		</tr>
		<tr class="board-normal">
			<td align="center">해당하는 아이디가 없습니다.</td>
		</tr>
		</table><br><br><br>
		<table class="board1" style="border-bottom:none;">
		<tr>
		<td align="left"><a class="a_sok" href="search.do?rt=mobile&method=sid_form">&nbsp;아이디 찾기</a>
		<td align="right"><a class="a_sok" href="member.do?rt=mobile&method=join">회원가입&nbsp;</a>
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
