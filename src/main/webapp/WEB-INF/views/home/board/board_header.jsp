<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 폰트어썸 CSS 임포트 -->
<link rel="stylesheet" href="/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- 부트스트랩CSS코어 임포트 -->
<link rel="stylesheet" href="/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- 부트스트랩JS코어 임포트 -->
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE전용CSS코어 임포트 -->
<link rel="stylesheet" href="/resources/admin/dist/css/adminlte.min.css">
<!-- 첨부파일명을 input태그디자인 안쪽에 집어넣는 확장프로그램 -->
<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 위 첨부파일 확장프로그램 실행(아래-개발자가 처리) -->
<script>
	$(document).ready(function(){
		bsCustomFileInput.init();
	});
</script>
<!-- 서머노트 웹에디터CSS 임포트 -->
<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote.css">
<!-- 서머노트 웹에디터JS 임포트 -->
<script src="/resources/admin/plugins/summernote/summernote.min.js"></script>
<!-- 서머노트 웹에디터 실행(아래-개발자가 처리) -->
<script>
	$(document).ready(function(){
		//$('#content_lbl').summernote();//기본실행. 이기본실을 개발자 커스터마이징 합니다.
		$('#content_lbl').summernote({
			height:150,
			lang:'ko-KR',
			placeholder:'글 내용을 입력해 주세요',
			toolbar: [
				['fontname',['fontname']],
				['fontsize',['fontsize']],
				['style',['bold','italic','underline']],
				['color',['forecolor','color']],
				['table',['table']],
				['para',['ul','ol','paragraph']],
				['height',['height']],
				['insert',['link','video']],//'picture',
				['view',['fullscreen','help']]
			],
			fontNames: ['Arial','Arial Black','맑은 고딕','궁서','Nanum Gothic'],
			fontSizes: ['8','10','12','14','16','18','20','22','24','26','28','30'],
			fontNamesIgnoreCheck: ['Nanum Gothic']
		});
	});
</script>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">
<style>
/* 모바일용 댓글 스타일 */
.row { margin:0px; }
.timeline, .card-default {
	text-align: left;
	margin: 0px 5px;
}
.bs-stepper-content {
	padding: 20px 10px;
}
</style>
<!-- 메인상단위치표시영역 -->
<div class="location_area customer">
	<div class="box_inner">
		<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
		<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
		<ul class="page_menu clear">
			<c:forEach var="boardTypeVO" items="${listBoardTypeVO}">
				<li><a href="/home/board/board_list?board_type=${boardTypeVO.board_type}&search_keyword=" class="${boardTypeVO.board_type==session_board_type?'on':''}">${boardTypeVO.board_name}</a></li>
			</c:forEach>					
		</ul>
	</div>
</div>	
<!-- //메인상단위치표시영역 -->