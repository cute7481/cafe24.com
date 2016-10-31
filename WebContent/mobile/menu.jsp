<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	
	<link href='https://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>

	<%@include file="navbar.jsp"%>

<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn">&times;</a>
	<table class="board1">
	<tr class="board-normal" style="border-bottom:none;">
<%
	if(!isLogin){
%>
		<td align="left"><a href="member.do?rt=mobile&method=loginform">
		<img width="35px" height="35px" src="../img/default_profile.png" align="center">
		<font size="4">&nbsp;로그인을 해주세요.</font></a></td>
<%
	}else{
%>	
		<td align="left"><a href="member.do?rt=mobile&method=userpage">
		<img width="35px" height="35px" src="<%=mbdto.getPic()%>" align="center">
		<font size="4">&nbsp;<%=mbdto.getNick()%></font></a></td>
<%
	}
%>
	</tr>
	</table>
	<br>
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal" style="border-bottom:none;">
		<td align="left"><a href="main.do?rt=mobile">메인</a>
		<a href="main.do?rt=mobile&method=list">질문 리스트</a>
		<a href="qget.do?rt=mobile&method=list&pg=1">질문 제보</a>
		<a href="board.do?rt=mobile&method=list&pg=1">일상 게시판</a></td>
  	</tr>
  	</table>
</div>
<style>
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
	font-family:Misaeng;
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 12px;
    right: 15px;
    font-size: 36px;
    margin-left: 50px;
}
#tmain {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.tmenu').click(function(event){
		$('#mySidenav').css('width','75%');
	});
	$('.closebtn').click(function(event){
		$('#mySidenav').css('width','0%');
	});
});
</script>

<!--
<div class='center-header'>
<b id="r_title" style="font-size:65px;">쉬어가기. . .</b><br>
<b id="r_title" style="font-size:40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      생각이 고이는 시간</b>
				<br><br>
				<table width="1000" cellpadding="0" cellspacing="0">
					<tr>
						<td>
						<table id="menu-table" width='100%' >
						<tr>
							<td><a href="main.do" id="menu1" class="a_text">메인화면</a></td>
							<td><a href="board.do?method=list&pg=1" id="menu2" class="a_text">게시판</a></td>
							<td><a href="main.do?method=list" id="menu3" class="a_text">질문리스트</a></td>
							<td><a href="qget.do?method=list&pg=1" id="menu4" class="a_text">질문제보</a></td>
						</tr>
						</table>
						</td>
					</tr>
				</table>
				<hr width="90%" color="white" noshade>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#menu1').mouseenter(function(){
		$(this).css('color','#777777');
	})
	$('#menu1').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('#menu1').mouseleave(function(){
		$(this).css('color','white');
	})
	$('#menu1').mouseup(function(){
		$(this).css('color','#777777');
	})
	$('#menu2').mouseenter(function(){
		$(this).css('color','#777777');
	})
	$('#menu2').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('#menu2').mouseleave(function(){
		$(this).css('color','white');
	})	
	$('#menu2').mouseup(function(){
		$(this).css('color','#777777');
	})
	$('#menu3').mouseenter(function(){
		$(this).css('color','#777777');
	})
	$('#menu3').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('#menu3').mouseleave(function(){
		$(this).css('color','white');
	})
	$('#menu3').mouseup(function(){
		$(this).css('color','#777777');
	})
	$('#menu4').mouseenter(function(){
		$(this).css('color','#777777');
	})
	$('#menu4').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('#menu4').mouseleave(function(){
		$(this).css('color','white');
	})
	$('#menu4').mouseup(function(){
		$(this).css('color','#777777');
	})
		
});
</script>
-->