<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.*, yoon.qget.model.QgetDTO"%>

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
		
<%
	int total = 0;
	total = (int)request.getAttribute("total");
	ArrayList<QgetDTO> list = (ArrayList<QgetDTO>)request.getAttribute("list");
	ArrayList<QgetDTO> best = (ArrayList<QgetDTO>)request.getAttribute("best");

%>		
	<table class="qg_table">
		<tr class="board-normal">
			<td align="center">당신만의 질문을 만들어주세요</td>
		</tr>
		<tr class="board-normal">
			<td align="center" height="30">질문 등록 (<font color="#F6CED8"><%=total%></font>)</td>
		</tr>	
		<tr class="board-normal">
			<td><br>
			<form id="question_form" method="post" action="qget.do?rt=mobile&method=insert">
<%
			if(mbdto != null){//로그인했으면
%>			
			<input type="hidden" name="userid" value="<%=mbdto.getId() %>">
			<textarea id="question_area" name="qcontent"></textarea>
<%
			}else{			
%>
			<input type="hidden" name="userid" value="">
			<textarea id="question_area" name="notlogin" readonly="readonly"></textarea>
<%
			}
%>
			&nbsp;<input class="qg_btn" type="button" name="qsend" value="등록">
			</form>
			</td>
		</tr>
	</table>
	
<div id="qContainer" >
	<ul class="tabs">
	<table class="qg_table">
		<tr class="board-normal">
		<td class="active" align="center" height='30' rel="tab2_qGBestList" id="tab2">베스트 질문</td>
		<td align="center" style="border-left: 1px solid #707070;" rel="tab1_qgList" id="tab1">전체 질문</td>
		</tr>
	</table>
	</ul>
	
	<div class="tab_qContainer">	
	<div id="tab2_qGBestList" class="tab_qContent">
	
<%
	if(best != null){
		for(QgetDTO dto : best){
			String rcont = dto.getContent().replaceAll("\r\n","<br>");
%>
		<table class="qg_table">
		<tr class="board-normal" style="border-bottom:none;">
			<td width="100%">&nbsp;<font size="5"><%=dto.getNick()%></font>
			&nbsp;&nbsp;<font size="3"><%=dto.getCtime()%></font>&nbsp;&nbsp;
<%
			if(mbdto !=null ){//로그인한 경우
				if(mbdto.getId().equals(dto.getId())){//질문의 아이디와 세션이 같은 경우
%>
				<a class="a_qg" name="del_question_btn" value="<%=dto.getNum()%>">삭제</a>
<%
				}
			}
%>				
			<br>&nbsp;<font class="twinkle">BEST</font>&nbsp;&nbsp;<font size="4"><%=rcont%></font>&nbsp;
			</td>
		</tr>
		<tr class="board-normal" align="right" style="border-top:none;">
			<td><a class="a_qg" name="like_btn" value="<%=dto.getNum()%>"><font size="3">GOOD</font></a>
			<font style="color:#F6CED8;"> <%=dto.getGood()%></font>&nbsp;&nbsp;
			<a class="a_qg" name="hate_btn" value="<%=dto.getNum()%>"><font size="3">BAD</font></a>
			<font style="color:#CEE3F6;"> <%=dto.getBad()%></font>&nbsp;</td>
		</tr>
		</table>
<%
		}
	}else{
		%>
		<table class="qg_table">
		<tr class="board-normal" style="border-bottom:none;">
			<td width="100%">&nbsp;<font size="5">아직 베스트 질문이 없습니다. 베스트 질문을 만들어주세요!</font></td>
		</tr>
		</table>
		<%
	}

%>	
	</div>
	<div id="tab1_qgList" class="tab_qContent">
<%
	if(list != null){
		System.out.println(list.size() + "size");
		for(QgetDTO dto : list){
			String rcont = dto.getContent().replaceAll("\r\n","<br>");
%>
		<table class="qg_table">
		<tr class="board-normal" style="border-bottom:none;">
			<td width="100%">&nbsp;<font size="5"><%=dto.getNick()%></font>
			&nbsp;&nbsp;<font size="3"><%=dto.getCtime()%></font>&nbsp;&nbsp;
<%
				if(mbdto != null){ //로그인한 경우
					if( mbdto.getId().equals(dto.getId())){//질문의 아이디와 세션이 같은경우				
%>
				<a class="a_qg" name="del_question_btn" value="<%=dto.getNum()%>">삭제</a>
<%
					}
				}
%>
			<br><font size="4"><%=rcont%></font></td>
		</tr>
		<tr class="board-normal" align="right" style="border-top:none;">
			<td><a class="a_qg" name="like_btn" value="<%=dto.getNum()%>"><font size="3">GOOD</font></a>
			<font style="color :#F6CED8;"> <%=dto.getGood()%></font>&nbsp;&nbsp;
			<a class="a_qg" name="hate_btn" value="<%=dto.getNum()%>"><font size="3">BAD</font></a>
			<font style="color :#CEE3F6;"> <%=dto.getBad()%></font>&nbsp;</td>
		</tr>
		</table>
<%
		}
	}
%>
	<div class="paging" align="center">
	<p>
<%
	int totalPg = (int)total/10 + 1;
	if(total%10 == 0 && total!=0){
		totalPg -= 1;
	}
	Integer currentPg = (Integer)request.getAttribute("pg");
	if(currentPg == null) {
		currentPg = 1;
	}
	
	if (totalPg <= 10) {		
		for(int pg_num = 1; pg_num <= totalPg; pg_num++) {
			if(currentPg.equals(pg_num)){
%>
				<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList">
				<b style="font-size:18px;color: #CEE3F6"><%=pg_num%></b></a>&nbsp;&nbsp;
<%
			}else{
%>
				<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList"><%=pg_num%></a>&nbsp;&nbsp;
<%
			}
		}
	}else{
		if(currentPg <= 10){
			for(int pg_num=1;pg_num<=10;pg_num++){
				if(currentPg.equals(pg_num)){
%>
				<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList">
				<b style="font-size:18px;color: #CEE3F6"><%=pg_num%></b></a>&nbsp;&nbsp;
<%
				}else{
%>
				<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList"><%=pg_num%></a>&nbsp;&nbsp;
<%
				}
			}
%>			
			<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=11#tab1_qgList">다음</a>
<%
		}else{
			int next_pg = (int)((currentPg+1)/10);
			next_pg = next_pg*10;
%>
			<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=next_pg%>#tab1_qgList"> 이전 </a>&nbsp;&nbsp;
<%
			if(totalPg>next_pg+11){
				for(int pg_num=(next_pg+1);pg_num<=(next_pg+10);pg_num++){
					if(currentPg.equals(pg_num)){
%>
					<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList">
					<b style="font-size:18px;color: #CEE3F6"><%=pg_num%></b></a>&nbsp;&nbsp;
<%
					}else{
%>
					<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList"><%=pg_num%></a>&nbsp;&nbsp;
<%				
					}
				}	
			}else{
				for(int pg_num=(next_pg+1);pg_num<=totalPg;pg_num++){
					if(currentPg.equals(pg_num)){
%>
					<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList">
					<b style="font-size:18px;color: #CEE3F6"><%=pg_num%></b></a>&nbsp;&nbsp;
<%
					}else{
%>
					<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=pg_num%>#tab1_qgList"><%=pg_num%></a>&nbsp;&nbsp;
<%				
					}					
				}				
			}
			if((int)(totalPg/10)>next_pg/10){
				int next = next_pg+10;
%>
				<a class="a_qg" href="qget.do?rt=mobile&method=list&pg=<%=next%>#tab1_qgList">다음</a>
<%
			}
		}
	}
%>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>

<script type="text/javascript"> 

$(document).ready(function(){
	
	$('.a_qg').css('font-size', '18px');
	$('.a_qg').css('cursor', 'pointer');
	$('.a_qg').mouseenter(function(){
		$(this).css('color','#707070');
	})
	$('.a_qg').mouseleave(function(){
		$(this).css('color','white');
	})
	$('.a_qg').mousedown(function(){
		$(this).css('color','#505050');
	})
	$('.a_qg').mouseup(function(){
		$(this).css('color','#777777');
	})
	$('textarea[name=notlogin]').mousedown(function(){
	
		var ls = confirm("로그인이 되어있지 않습니다. 로그인 하시겠습니까?");
		if(ls){
			$(location).attr("href","member.do?rt=mobile&method=loginform");
		}return ;
	})
	$("a[name=del_question_btn]").click(function(){
		//android.setDelchk("qdel");
		
		var thisnum =  $(this).attr("value");

		var dc = confirm("정말로 삭제하시겠습니까?");
		if(dc){
			$.ajax({
				type:"POST",
				url:"qget.do?rt=mobile",
				data:{
					"method" : "delete",
					"num" : thisnum
				},
				datatype: "JSON",
				success:function(obj){
					var val = JSON.parse(obj);
					if(val.value=="suc"){
						alert("삭제 성공");
					}else{
						alert("서버 에러! 다시 시도해 주세요");	
					}
					location.reload();
				},
				error:function(error){
					alert("서버 에러 : " + error);
					location.reload();
				}
			});	
		}
		return ;
		
	})
	$("a[name=like_btn]").click(function(){
		var thisnum =$(this).attr("value");
		if($("input[name=userid]").val()==""){

			var lc = confirm("로그인이 되어있지 않습니다. 로그인 하시겠습니까?");
			if(lc){
				//TODO
				$(location).attr("href","member.do?rt=mobile&method=loginform");
			}
			return ;
		}else{
	
			$.ajax({
				type:"GET",
				url:"qget.do?rt=mobile",
				data:{
					"method" : "goodbad",
					"num" : thisnum,
					"userid" : $("input[name=userid]").val(),
					"what" : "1"
				},
				datatype: "JSON",
				success:function(obj){

					var val = JSON.parse(obj);
					
					if(val.value=="suc"){

						alert("이 질문을 좋아합니다");
						location.reload();
					}else if(val.value=="f1"){
	
						alert("이미 좋아요를 누르셨습니다.");	
					}else if(val.value=="f2"){
			
						alert("이미 싫어요를 누르셨습니다.");
					}else{
						alert("서버 에러!")
					}
					return ;
				},
				error:function(error){
					alert("서버 에러 : " + error);
					location.reload();
				}
			});	
		}
	})
	$("a[name=hate_btn]").click(function(){
		var thisnum =$(this).attr("value");
		if($("input[name=userid]").val()==""){
			var lc = confirm("로그인이 되어있지 않습니다. 로그인 하시겠습니까?")
			if(lc){
				//TODO
				$(location).attr("href","member.do?rt=mobile&method=loginform");
			}
			return ;
		}else{
			$.ajax({
				type:"GET",
				url:"qget.do?rt=mobile",
				data:{
					"method" : "goodbad",
					"num" : thisnum,
					"userid" : $("input[name=userid]").val(),
					"what" : "2"
				},
				datatype: "JSON",
				success:function(obj){
					var val = JSON.parse(obj);
					if(val.value=="suc"){
						alert("이 질문을 싫어합니다");
						location.reload();
					}else if(val.value=="f1"){

						alert("이미 좋아요를 누르셨습니다.");	
					}else if(val.value=="f2"){
				
						alert("이미 싫어요를 누르셨습니다.")
					}else{
						alert("서버 에러!")
					}
					return ;
				},
				error:function(error){
					alert("서버 에러 : " + error);
					location.reload();
				}
			});		
		}
	})
	$("input[name=qsend]").click(function(){
		if($("input[name=userid]").val()==""){ //로그인 안되있을경우

			var lc = confirm("로그인이 되어있지 않습니다. 로그인 하시겠습니까?");
			if(lc){
				//TODO
				$(location).attr("href","member.do?rt=mobile&method=loginform");
			}
			return ;
		}else{
			$("#question_form").submit();
		}
	
	});
	$(".tab_qContent").hide();
	//$(".tab_qContent:first").show();

	if(location.hash=="#tab1_qgList"){
		$(".tab_qContent").eq(1).show();
		$("#tab1").addClass("active").css("font-weight","500");
		$("#tab2").removeClass("active").css("font-weight","normal");
	}else{
		$(".tab_qContent:first").show();

		$("#tab2").addClass("active").css("font-weight","500");
		$("#tab1").removeClass("active").css("font-weight","normal");
		$(".tab_qContent:first").show();
	}
	
	$("ul.tabs td").click(function () {
		$("ul.tabs td").removeClass("active").css("font-weight", "normal");
	      
	    $(this).addClass("active").css("font-weight", "500");
	    $(".tab_qContent").hide();
	    var activeTab = $(this).attr("rel");

	    $("#" + activeTab).show();
	    location.href= "#"+activeTab;
	});
});
</script>