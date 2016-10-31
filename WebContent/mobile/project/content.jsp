<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.*, yoon.board.model.BoardDTO, yoon.reply.model.ReplyDTO"%>

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
	BoardDTO dto = (BoardDTO)request.getAttribute("contDto");
	ArrayList<ReplyDTO> relist = (ArrayList<ReplyDTO>)request.getAttribute("replylist");
	String cont = dto.getContent().replace("\r\n","<br>");
%>
	<div id="tmain">
	<table>
	<tr>
		<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>
	</tr>
	</table>
	
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="left">&nbsp;<b id="qt">번호.&nbsp;&nbsp;</b><font id="qdetail"><%=dto.getNum()%></font></td>
		<td align="right"><font id="qdetail"><%=dto.getRdate()%></font>&nbsp;</td>
	</tr>
	<tr class="board-normal">
		<td align="left"><b id="qt">&nbsp;작성자.&nbsp;&nbsp;</b><font id="qdetail"><%=dto.getNick()%></font>&nbsp;</td>
		<td align="right"><b id="qt">조회수.&nbsp;&nbsp;</b><font id="qdetail"><%=dto.getReadnum()%></font>&nbsp;</td>
	</tr>
	</table>
	
	<table class="board1" style="border-bottom:none;table-layout:fixed;word-break:break-all;">
	<tr class="board-normal">
		<td align="left" width="35px">&nbsp;<b id="qt">제목.</b></td>
		<td align="left" width="90%"><font id="qdetail"><%=dto.getSubject()%></font></td>
	</tr>
	<tr class="board-normal">
		<td colspan="4" style="padding-left:5%;height:250px"><%=cont%></td>
	</tr>
	</table>
	<%
	if(mbdto != null){
		if(mbdto.getId().equals(dto.getId())){
	%>
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal">
			<td height="30" colspan="3" align="center">
			<a class="adel" href="board.do?rt=mobile&method=list"><font size="4">목록</font></a><b>   |   </b> 
			<a class="adel" href="board.do?rt=mobile&method=edit&num=<%=dto.getNum()%>">
			<font size="4">편집</font></a><b>   |   </b> 
			<form id="del_cont" action="board.do?rt=mobile&method=del" method="post" style="display:inline;">
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<a class="adel" id="del_cont_btn"><font size="4">삭제</font></a>
			</form>
		</td>
		</tr>
		</table>
	<%
		}
	%>
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal">
			<td align="center" height='30'>댓글 작성</td>
		</tr>
		</table>
		
		<form id="reply_form" method="post" action="board.do?rt=mobile&method=reply">
		<table class="board1" style="border-bottom:none;">
		<tr class="board-normal" style="border-bottom:none;">
			<td align="left"><br>
			<input type="hidden" value="<%=mbdto.getId()%>" name="replyid">
			<input type="hidden" name="num" value="<%=dto.getNum() %>">
			<textarea name="reply" id="reply_area"></textarea>&nbsp;
			<input type="button" id="btn_reply" value="작성"><br></td>
		</tr>
		</table>
		</form>
	<%
		}		
	%>
		<table class="board1" style="border-bottom:none">
		<tr class= "board-normal">
	<%
		if(mbdto != null){//로그인 했을 경우
	%>
		     <td align="center" colspan="3" height="30">댓   글</td>
	<%
		}else{
	%>
		     <td align="center" colspan="3" height="30">댓   글 (회원)</td>
	<%
		}
	%>
		</tr>
		</table>
		<table class="board1" id="reply_board" style="border-bottom:none;table-layout:fixed;word-break:break-all;">
	<%
		if(relist != null){
			for(ReplyDTO rdto : relist){
				String rcont = rdto.getReply().replace("\r\n","<br>");
				if(rdto.getPic()==null)rdto.setPic("../img/default_profile.png");	
	%>
		<form action="board.do?rt=mobile&method=redel" method="post" id="reply<%=rdto.getNum()%>">
		<tr class="board-normal">
			<input type="hidden" name="bnum" value="<%=dto.getNum()%>">
			<td width="25%" align="center"><img align="center" 
			width="35px" height="35px" src="<%=rdto.getPic()%>"><br>
			<font size="3px"><%=rdto.getNick()%></font></td>
			<td width="75%"><br><font size="3px"><%= rdto.getCtime()%></font>&nbsp;
		<%
			if(mbdto != null){//로그인 했을 경우
				if(rdto.getId().equals(mbdto.getId())){//세션아이디랑 리플아이디 같을 경우
		%>
			<input type="hidden" name="num" value="<%=rdto.getNum()%>">
			<a class="adel" name="del_reply_btn" value="<%=rdto.getNum()%>">삭제</a>
		<%
				}
			}
		%>
			<br><%=rcont%><br>&nbsp;</td>
			<td width="5%"></td>
			</tr>
			</form>
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

$(document).ready(function(){
	$(".adel").css('font-size','16px');
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
	
	$("a[name=del_reply_btn]").click(function(event){
		var str = "#reply" + $(this).attr("value");
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result){
			$(str).submit();
		}
	});
	$("#del_cont_btn").click(function(event){
		var str = "#del_cont";
		var result =confirm("정말로 삭제하시겠습니까?");
		if(result){
			$("#del_cont").submit();
		}
		
	});
	$('#btn_reply').click(function(event){
		if($("#reply_area").val()==""){
			alert("댓글을 입력하셔야 합니다.");
			return;
		}
		$("#reply_form").submit();	
	});					
});
</script>