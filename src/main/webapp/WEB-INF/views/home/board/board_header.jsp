<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">
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