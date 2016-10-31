<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
 import="java.util.*, yoon.board.model.BoardDTO"%>
<body style="margin: 0px;" bgcolor="transparent">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%; height:0px;  margin:0; padding:0;"></div>
		<!-- top line-->
		<!-- wrapper -->
		<div class='center-wrapper' style="width:100%; margin:0 auto;">
		<!-- header-->
		<%@include file="../menu.jsp" %>
<%
	if(mbdto != null){
		String userid = (String)request.getAttribute("userid");
		if(mbdto.getId().equals(userid)){
%>

<script type="text/javascript">
function checkValue(){
	if(document.input.subject.value == ""){
		alert("제목을 입력해주세요");
		return false;
}
if(document.input.content.value == ""){
	alert("내용을 입력해주세요");
	return false;
}
if(document.input.id.value == ""){
	alert("이름을 입력해주세요");
	return false;
}
document.input.submit();
}
</script>

	<div id="tmain">
	<table>
	<tr>
		<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>
	</tr>
	</table>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center">게시글 작성</td>
	</tr>
	</table>
	
	<form name="input" action="board.do?rt=mobile&method=insert" method="post">
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
	    <td align="center">작성자&nbsp;&nbsp;
	    <input type="hidden" name="id"  value="<%=mbdto.getId()%>">
		<font id="r_writer"><%= mbdto.getNick() %></font></td>
	</tr>	  
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>제목</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="subject" id="r_subject"></td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>내용</td>
	</tr>
	<tr id="r_content">
		<td align="center" width="80%">
		<textarea name="content" rows="5" id="r_textarea"></textarea></td>
	</tr>
	</table>
	<br>
	<table class="board1" style="border-bottom:none;">
	<tr>
		<td align="left"><a class="adel" href="board.do?rt=mobile&method=list" id="b_list">&nbsp;목록으로</a></td>
		<td align="right"><a class="adel" onclick="checkValue()" id="btn_write">작성하기&nbsp;</a></td>
	</tr>
	</table>
	</form>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$(".adel").css('cursor', 'pointer');
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
<%
		}else{
%>
	<script type="text/javascript">
			$(document).ready(function(){
				alert("잘못된 접근입니다.");
				history.back();
			});
	</script>

<%			
		}
}else{
%>
<script type="text/javascript">
$(document).ready(function(){
	alert("잘못된 접근입니다.");
	history.back();
});
</script>
<%
}
%>