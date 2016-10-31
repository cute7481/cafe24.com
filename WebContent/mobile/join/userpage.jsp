<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	String publicKeyModulus = (String)request.getAttribute("publicKeyModulus");
	String publicKeyExponent = (String)request.getAttribute("publicKeyExponent");
%>
<body style="margin: 0px;" bgcolor="transparent" onload="join_form.name.focus();">
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
	<table class="board1" style="border-bottom:none;">
	<tr class="board-normal">
		<td align="center">마이페이지</td>
	</tr>
	</table><br>
	
	<div align="center">
	<form id="picupload" method="post" action="member.do?rt=mobile&method=picupload&id=<%=mbdto.getId()%>" enctype="multipart/form-data">
		<div id="image_preview">
			<img id="user_img" src="<%=mbdto.getPic()%>" width='100px' height='100px'>
		</div>
		<font style="font-size:30px;font-family:Misaeng;color:white;"><%=mbdto.getNick()%></font><br>
		<font style="font-size:18px;font-family:Misaeng;color:white;"><%=mbdto.getEmail()%></font><br>
		<br><input type="file" class="jfilestyle" name="uploadFile" id="uploadFile" data-buttonText="파일 찾기">
		<br><a id="btn_upload"> 프로필 사진 등록</a>
	</form>
	</div>
	 
	<br>
	<table class="board1" style="border-bottom:none;"> 
	<tr>
	<td align="left"><a class="a_sok" id="btn_myinfo" href="member.do?rt=mobile&method=logout">&nbsp;로그아웃</a></td>
	<td align="right">
	<a class="a_sok" id="btn_myinfo" href="member.do?rt=mobile&method=mypage">회원 정보 수정&nbsp;</a></td>
	</tr>
	</table>
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

<script type="text/javascript">
$("#btn_upload").click(function(){
	var dc = confirm("프로필 사진을 변경하시겠습니까?");
	if(dc){
		$("#picupload").submit();
	}
	event.preventDefault();
	return ;
})
$('#uploadFile').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
        file = $('#uploadFile').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        $(this).slideUp(); //파일 양식 감춤
    }
});
/**
onclick event handler for the delete button.
It removes the image, clears and unhides the file input field.
*/
$('#image_preview a').bind('click', function() {
    resetFormElement($('#uploadFile')); //전달한 양식 초기화
    $('#uploadFile').slideDown(); //파일 양식 보여줌
    $(this).parent().slideUp(); //미리 보기 영역 감춤
    return false; //기본 이벤트 막음
});
/** 
* 폼요소 초기화 
* Reset form element
* 
* @param e jQuery object
*/
function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
    //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
    //DOM에서 제공하는 초기화 메서드 reset()을 호출
    e.unwrap(); //감싼 <form> 태그를 제거
}
</script>