<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.*, yoon.board.model.BoardDTO"%>

<body style="margin: 0px;" bgcolor="transparent">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%; height:0px; margin:0; padding:0;"></div>
		<!-- top line-->
		<!-- wrapper -->
		<div class='center-wrapper' style="width:100%; margin:0 auto;">
		<!-- header-->
		<%@include file="../menu.jsp" %>

    <%
   		ArrayList<BoardDTO> list = (ArrayList<BoardDTO>)request.getAttribute("list");
   		String t = (String)request.getAttribute("tok");
   		String kw = (String)request.getAttribute("keyword");
    %>
	
	<div id="tmain">
	<table>
	<tr>
		<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>
	</tr>
	</table>
	
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center">소소한 일상 공유</td>
	</tr>
	</table>
	
	<table class="board1" style="table-layout:fixed;word-break:break-all;border-bottom:none;">
	<%
		if(list != null){
			for(BoardDTO dto : list){
	%>
		<tr class="board-normal" style="border-bottom:none;">
			<td width="100%"class="b-title">
			<a class="padding" href="board.do?rt=mobile&method=content&num=<%=dto.getNum()%>">
			<font size="5"><%=dto.getSubject()%></font>
     <%
     		if(dto.getReplycnt() != 0 ){
     %>
     		<font size="4">[ <font style="color:#F6CEF5"><%=dto.getReplycnt()%></font> ]</font>
     <%
     		}
     %>
            </a></td>
        </tr>
        <tr class="board-normal" style="border-top:none;">
        	<td align="right" height="10"><font size="4"><%= dto.getNick()%>&nbsp;|&nbsp;
        	<%=dto.getRdate()%>&nbsp;|&nbsp;조회 <%= dto.getReadnum()%>&nbsp;</font></td>
		</tr>
	<%
			}
		}
	%>
	</table>
	<p>	
	<div align="center">
 <%
	int total = (int)request.getAttribute("total");	
 	int currentPg = (int)request.getAttribute("pg");
 	if(currentPg>1){
 %>
		<a class="paging" href="board.do?rt=mobile&method=list&pg=1&stoken=<%=t%>&search=<%=kw%>">
        	< < </a>&nbsp;&nbsp;
        <a class="paging" href="board.do?rt=mobile&method=list&pg=<%=currentPg-1%>&stoken=<%=t%>&search=<%=kw%>">
			<&nbsp; 이전</a>
 <%
 	}
 	int tempNum=1;
 	if(currentPg>4){
 		tempNum=currentPg-4;
 	}
 	for(int i=tempNum;i<=currentPg+4;i++){
 		if(i>total)break;
 		if(i == currentPg){
%>
 			<b class="paging" style="color: #CEE3F6"><%= i %></b>
<%
 		}else{
%>
 			<a class="paging" href="board.do?rt=mobile&method=list&pg=<%=i %>&stoken=<%=t%>&search=<%=kw%>"><%=i %></a>
<%	
 		}
 	}
	if(currentPg < total) {
%>
		<a class="paging" href="board.do?rt=mobile&method=list&pg=<%=currentPg+1%>&stoken=<%=t%>&search=<%=kw%>">
 			다음&nbsp;></a>&nbsp;&nbsp;
 		<a class="paging" href="board.do?rt=mobile&method=list&pg=<%=total%>&stoken=<%=t%>&search=<%=kw%>">> ></a>
<%		
	} 
%>
	</div>
	
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal" style="border-bottom:none;">
		<td align="left"><a class="padding" style="cursor:pointer" id="board_search">&nbsp;검색</a></td>
	<%
		if(mbdto != null){
	%>
			<td align="right"><a class="padding" id="board_write" 
			href="board.do?rt=mobile&method=write&id=<%=mbdto.getId()%>">글쓰기&nbsp;</a></td>
	<%
		}
	%>
	</tr>
	</table>
	<div id="b_search" style="visibility:hidden">
	<table id="search_write" style="table-layout:fixed">
	<form action="board.do?rt=mobile&method=list" method="get">
	<tr class="board-normal" style="border-bottom:none;">
	    <td width="100%">
	    <input type="hidden" name="rt" value="mobile"/>
	    <select name="stoken" style="font-size:16px;width:52px">
			<option value="sub">제목</option>
			<option value="con">내용</option>
			<option value="consub">제목+내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="search" id="input_search" size="17">
		<input style="cursor:pointer" type="submit" value="검색"></td>
	</tr>
	</form>
	</table>
	</div>
</div>
</div>
</body>	

<script type="text/javascript">
$(document).ready(function(){
	$('.padding').mouseenter(function(){
		$(this).css('color','#707070');
	})
	$('.padding').mouseleave(function(){
		$(this).css('color','white');
	})
	$('.padding').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('.padding').mouseup(function(){
		$(this).css('color','#777777');
	})
	$("#board_search").click(function(event){
		$("#b_search").css('visibility','visible');
	});
});
</script>