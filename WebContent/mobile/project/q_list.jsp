<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
 import="yoon.questions.model.QuestionsDTO, java.util.ArrayList" %>

<body style="margin: 0px;" bgcolor="transparent">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%;height:0%; margin:0; padding:0;"></div>
		<!-- top line-->
		<!-- wrapper -->
		<div class='center-wrapper' style="width:100%;height:0%; margin:0 auto;">
		<!-- header-->
		<%@include file="../menu.jsp" %>

	<div id="tmain">
	<table>
	<tr>
		<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>
	</tr>
	</table>
	<table class="board1" style="border-top: none;border-bottom:none;">
<%
	ArrayList<QuestionsDTO> qlist = (ArrayList<QuestionsDTO>)request.getAttribute("qlist");
	if(qlist != null){
		for(QuestionsDTO dto : qlist){
%>
		<tr class="board-normal" style="border-bottom: 1px solid #707070;">
			<td><img width="50px" height="50px" src ="<%=dto.getPic()%>">&nbsp;</td>
			<td style="table-layout:fixed;word-break:break-all;">
			<a class="astyle" href="main.do?rt=mobile&method=qinfo&num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
<%
			if(dto.getPrnum()>0){
%>			
				&nbsp;[<font style="color :#F6CED8;"><%=dto.getPrnum()%></font>]
<%
			}
%>							
			</td>
		</tr>
<%
		}
	}
%>
	</table>
	</div>
</div>
</div>
</body>

<script type="text/javascript">
$('.astyle').mouseenter(function(){
	$(this).css('color','#707070');
})
$('.astyle').mouseleave(function(){
	$(this).css('color','white');
})
$('.astyle').mousedown(function(){
	$(this).css('color','#505050');
})
$('.astyle').mouseup(function(){
	$(this).css('color','#777777');
})
</script>