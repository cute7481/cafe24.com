<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="yoon.questions.model.QuestionsDTO, yoon.qreply.model.QreplyDTO, java.util.*"%>

<body style="margin: 0px;" bgcolor="transparent">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%; height:0px;  margin:0; padding:0;"></div>
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
<%
	QuestionsDTO dto = (QuestionsDTO)request.getAttribute("qdto");
%>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="left" width="15%">&nbsp;<b id="qt">No. </b></td>
		<td align="left" width="35%"><font id="qdetail"><%=dto.getNum()%></font></td>
		<td align="right" width="15%"><b id="qt">Date. </b></td>
		<td align="right" width="35%"><font id="qdetail"><%=dto.getRdate()%></font>&nbsp;</td>
	</tr>
	</table>
	<br>
	<div align="center">
	<table id="qimg" max-width="500px" height="200px" background="<%=dto.getPic()%>" style="background-size:100%;">
	<tr align="center">
		<td><font id="picSubj" name="<%=dto.getSubject()%>" 
		style="text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;
		font-family:Dokdo;font-size:20px;color:black;"><%=dto.getSubject()%></font></td>			
	</tr>
	</table>
	</div>
	<br>
	<table class="board1" style="border-bottom:none;word-break:break-all;">
	<tr class="board-normal">
		<td width="50%" align="center" height="35"><b id="qt">Photo by.</b>&nbsp;
		<font id="qdetail"><%=dto.getAuthor()%></font></td>
	</tr>
	</table>
	<br>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center" height="35">댓글 작성</td>
	</tr>
	</table>
<%
	if(mbdto == null){//비회원일때
%>
	<form action="qreply.do?rt=mobile&method=reply" method="post" id="n_qreply">
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal" style="border-bottom:none;">
		<td align="left"><br>
		<input type="hidden" name="mcheck" value="none">
		<input type="hidden" name="num" value="<%=dto.getNum()%>">
		<textarea name="reply" id="reply_area"></textarea>&nbsp;
		<input type="button" id="btn_reply_n" value="작성"></td>
	</tr>
	</table>
	<table class="board1" style="table-layout:fixed;border-bottom:none;">
	<tr	class="board-normal" style="border-bottom:none;">
	<td align="center" width="50%">ID</td>
	<td align="center" width="50%">PW</td>
	</tr>
	<tr	class="board-normal" style="border-bottom:none;">
		<td align="center" width="45%">
		<input type="text" name="name" size="10%" id="reply_name" style="height:25px">&nbsp;&nbsp;</td>
		<td align="center" width="45%" style="position: absolute;">
		<input type="password" name="pwd" size="10%" id="reply_pwd" style="height:25px"></td>
	</tr>
	</table>
	</form><p>
<%
	}else{//회원일때
%>
	<form action="qreply.do?rt=mobile&method=reply" method="post" id="m_qreply">
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal" style="border-bottom:none;">
		<td align="left">
		<input type="hidden" name="mcheck" value="member">
		<input type="hidden" name="num" value="<%=dto.getNum() %>">
		<input type="hidden" name="nick" value="<%= mbdto.getNick() %>">
		<input type="hidden" name="replyid" value="<%=mbdto.getId() %>"><br>
		<textarea name="reply" id="reply_area"></textarea>&nbsp;
		<input type="hidden" name="id" id="reply_name" value="<%=mbdto.getId()%>">
		<input type="button" id="btn_reply_m" value="작성"><br></td>
	</tr>
	</table>
	</form>	
<%		
	}
	ArrayList<QreplyDTO> qrlist = (ArrayList<QreplyDTO>)request.getAttribute("qrlist");
%> 
	<table class="board1" style="border-bottom:none;">
	<tr class= "board-normal">
		<td align="center" height="35">댓    글
<%
			if(dto.getPrnum()>0){
%>			
				(<font style="color :#F6CED8;"><%=dto.getPrnum()%></font>)
<%
			}else{
%>			
				(<font style="color :#F6CED8;">0</font>)
<%				
			}
%>		
		</td>
	</tr>
	</table>
	<table class="board1" id="reply_board" style="border-bottom:none;table-layout:fixed;word-break:break-all;"> 
<%
	if(qrlist != null){
		for(QreplyDTO rdto : qrlist){
			String rcont = rdto.getReply().replace("\r\n", "<br>");
			if(rdto.getPic()==null)rdto.setPic("img/default_profile.png");
%>
			<form action="qreply.do?rt=mobile&method=delete" method="post" id="qr_form<%=rdto.getNum()%>">
			<tr class="board-normal" id="qreply<%=rdto.getNum() %>">
				<input type="hidden" name="num" value="<%=rdto.getNum()%>">
				<input type="hidden" name="pnum" value="<%=dto.getNum()%>">
				<td width="25%" align="center"><img align="center" 
				width="35px" height="35px" src="<%=rdto.getPic()%>"><br>
			<%
				if(rdto.getUserid() == null){//비회원 댓글일경우
					String n = rdto.getName()+"(-)";
			%>
					<font size="3px"><%=n%></font>
			<%
				}else{
			%>
					<font size="3px"><%=rdto.getName()%></font>
			<%
				}
			%>
				</td>
				<td width="75%"><br><font size="3px"><%= rdto.getRdate()%></font>&nbsp;
			<%
				if(mbdto == null){//비회원일경우
					if(rdto.getUserid() == null){//댓글도 비회원일 경우
			%>
					<input type="hidden" name="memchk" value="none">
					<a class="adel" name="btn_pw_chk" value="<%=rdto.getNum()%>">삭제</a>
					<input type="password" id="pw<%=rdto.getNum()%>" name="pwd" size="5%" 
					style="border-radius:5px;font-size:15px;visibility:hidden;height:16px;">
					<a class="adel" name="del_qreply_btn" id="del<%=rdto.getNum()%>" value="<%=rdto.getNum()%>" 
					style="visibility:hidden;position:absolute;">ok</a>
			<%
					}
				}else{//로그인했을 경우
					if(rdto.getUserid() != null){//회원 댓글일 경우
						if(rdto.getUserid().equals(mbdto.getId())){//댓글의 아이디와 로그인한 자신의 아이디가 같을 경우				
			%>
					<input type="hidden" name="memchk" value="member">
					<a class="adel" name="del_qreply_btn" value="<%=rdto.getNum()%>">삭제</a>
			<%
						}
					}
				}
			%>
			<br><%= rcont %><br>&nbsp;</td>
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
	$("a[name=btn_pw_chk]").click(function(event){
		var n = $(this).attr("value");
		var strpw = "#pw"+n;
		var strdel = "#del"+n;
		$(this).css("visibility","hidden");
		$(strpw).css("visibility","visible");
		$(strdel).css("visibility","visible");
	});
	$("a[name=del_qreply_btn]").click(function(event){
		var this_val = $(this).attr("value");
		var str = "#qr_form"+this_val;

		var result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			//var str = "#qr_form"+this_val;
			$(str).submit();
		}
	});
	$('#btn_reply_m').click(function(event){
		if($("#reply_area").val()==""){
	
			alert("댓글을 입력하셔야 합니다.");
			return;
		}
		$("#m_qreply").submit();
	});
	$("#btn_reply_n").click(function(event){
		if($("#reply_name").val()==""){
			alert("이름을 입력하셔야 합니다.");
			return;
		}
		if($("#reply_pwd").val()==""){
			alert("비밀번호를 입력하셔야 합니다.");
			return;
		}
		if($("#reply_area").val()==""){
			alert("댓글을 입력하셔야 합니다.");
			return;
		}
		$("#n_qreply").submit();
	});
});
</script>