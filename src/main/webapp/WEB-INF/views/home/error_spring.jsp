<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">

<!-- 메인콘텐츠영역 만 변경됩니다. -->
<div id="container">
    <!-- 메인상단위치표시영역 -->
    <div class="location_area customer">
        <div class="box_inner">
            <h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
            <p class="location">고객센터 <span class="path">/</span> 에러페이지</p>
            <ul class="page_menu clear">
                <li style="text-align:left"><div>에러페이지</div>
                	{변수로 간단한 에러제목을 표시}
                </li>
            </ul>
        </div>
    </div>	
    <!-- //메인상단위치표시영역 -->

    <!-- 메인본문영역 -->
    <div class="bodytext_area box_inner">
    	{자세한 에러 메세지 표시}
    </div>
    <!-- //메인본문영역 -->
    
</div>
<!-- //메인콘텐츠영역 -->
<%@ include file="./include/footer.jsp" %>