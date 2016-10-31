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
		BoardDTO dto = (BoardDTO)request.getAttribute("upDto");

		if(mbdto.getId().equals(dto.getId())){
%>
<script language="javascript">
  function checkValue()
  {
	if(document.input.subject.value == "")
	{
	  alert("제목을 입력해주세요");
	  return false;
	}
	if(document.input.content.value == "")
	{
	  alert("내용을 입력해주세요");
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
		<td align="center">게시글 편집</td>
	</tr>
	</table>
	
	
	<form name="input" action="board.do?rt=mobile&method=update" method="post">
	<input type="hidden" name="num" value=<%=dto.getNum()%>>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
	    <td align="center">작성자&nbsp;&nbsp;
		<font id="r_writer"><%=dto.getNick()%></font></td>
	</tr>	  
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>제목</td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><input type="text" name="subject" id="r_subject" value=<%=dto.getSubject()%>></td>
	</tr>
	<tr class="board-normal" style="border-bottom:none">
		<td align="center"><br>내용</td>
	</tr>
	<tr id="r_content">
		<td align="center" width="80%">
		<textarea name="content" rows="5" id="r_textarea"><%=dto.getContent()%></textarea></td>
	</tr>
	</table>
	<br>
	<table class="board1" style="border-bottom:none;">
	<tr>
		<td align="center"><a class="adel" onclick="checkValue()" id="btn_edit">편집하기</a></td>
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

</body>
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