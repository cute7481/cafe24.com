<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.util.*, yoon.questions.model.QuestionsDTO, yoon.questions.control.QuestionsControl" %>

<%
	QuestionsDTO dto = (QuestionsDTO)request.getAttribute("pic");
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>쉬어가기... 생각이 고이는 시간</title>
</head>

<body style="margin: 0px;" bgcolor="transparent">
	<div id="wrapper"> 
	<!-- top line-->
		<div class='roof' style="width:100%;height:100%;margin:0;padding:0;"></div>
		<!-- top line-->
		<!-- wrapper -->
		<div class='center-wrapper' style="width:100%;height:0%;margin: 0 auto;">
		<!-- header-->
		<%@include file="menu.jsp" %>
	
	<div id="tmain">
		<table>
		<tr>
			<td><span class="tmenu" style="color:white;font-size:25px;cursor:pointer">&#9776;</span><br><td>	
		</tr>
		</table>
		<br>
		<div align="center">
			<a id="piclink" href="main.do?rt=mobile&method=qinfo&num=<%=dto.getNum()%>">
			<table id="qimg" width="270px" height="270px" background="<%=dto.getPic()%>" style="background-size:100%">
			<tr align="center">
				<td>
				<font id="picSubj" name="<%=dto.getSubject()%>" 
				style="text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;
				font-family:Dokdo;font-size:25px;color:black;"><%=dto.getSubject()%></font></td>			
			</tr>
			</table></a>
			
			<table>
			<tr>
				<td align="center"><font style="font-size:20px;" id="photoby" name="<%=dto.getAuthor()%>">photo by. <%=dto.getAuthor()%></font></td>
			</tr>
			<tr>
				<td align="center"><input id="picnum" type="hidden" value="<%=dto.getNum()%>"><br><b id="next_pic">또 다른 질문</b></td>
			</tr>
			</table>
		</div>
	</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('#next_pic').mouseenter(function(){
		$(this).css('color','#777777');
	})
	$('#next_pic').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('#next_pic').mouseup(function(){
		$(this).css('color','#777777');
	})
	$('#next_pic').mouseleave(function(){
		$(this).css('color','white');
	})

	$('#next_pic').click(function(event){
		$.ajax({
			type:"GET",
			url:"main.do",
			data:{
				"method" : "asyncpic",
				"contentType": "application/x-www-form-urlencoded; charset=UTF-8",
				"num" : $("#picnum").attr("value"),
				"subj" : $("#picSubj").attr("name"),
				"auth" : $("#photoby").attr("name")
			},
			datatype: "JSON",
			success:function(obj){
				var n = JSON.parse(obj);
				var num = n.num;
				var psrc = n.pic;
				var subj = n.subj;
				var aut = n.auth;
				$("#qimg").attr("background", psrc);
				$("#picSubj").attr("name", subj);
				$("#picSubj").html(""+subj);
				$("#picnum").attr("value", num);
				$("#photoby").attr("name", aut);
				$("#photoby").html("photo by. "+aut);
				$("#piclink").attr("href","main.do?rt=mobile&method=qinfo&num="+num);
			}
		});
	});
});
</script>

</body>
</html>