<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">

	<!-- 메인콘텐츠영역 -->
    <div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 검색폼영역 -->
			<form id="search_form" name="search_form" action="/home/board/board_list" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input value="${session_search_keyword}" name="search_keyword" type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<button type="submit" class="btn_srch">검색</button>
				</fieldset>
				<input name="search_type" value="all" type="hidden">
			</form>
			<!-- //검색폼영역 -->
			
			<!-- 게시물리스트영역 -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="boardVO" items="${boardList}" varStatus="status">
					<tr>
						<td>
						<!-- 전체게시물개수-(현재페이지x1페이지당보여줄개수)+1페이지당보여줄개수-현재인덱스(위부터0) -->
						${pageVO.totalCount-(pageVO.page*pageVO.queryPerPageNum)+pageVO.queryPerPageNum-status.index}
						</td>
						<td class="tit_notice">
						<a href="/home/board/board_view?bno=${boardVO.bno}&page=${pageVO.page}&search_type=${pageVO.search_type}">
						${boardVO.title}
						</a> </td>
						<td>${boardVO.view_count}</td>
						<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.reg_date}"/> 
						</td>
					</tr>	
				</c:forEach>									
				</tbody>
			</table>
			<!-- //게시물리스트영역 -->
			<style>
				.disabled {
					pointer-events:none;
					cursor:default;
					opacity:0.5;
				}
			</style>
			<!-- 페이징처리영역 -->
			<div class="pagination">
				<c:set var="disabled" value="${pageVO.prev?'':'disabled'}" />
				<a href="/home/board/board_list?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}" class="prevpage pbtn ${disabled}">
				<img src="/resources/home/img/btn_prevpage.png" alt="이전 페이지로 이동">
				</a>
				
				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1" var="idx">
				<a href="/home/board/board_list?page=${idx}&search_type=${pageVO.search_type}"><span class="pagenum ${idx==pageVO.page?'currentpage':''}">${idx}</span></a>
				</c:forEach>
								
				<c:set var="disabled" value="${pageVO.next?'':'disabled'}" />
				<a href="/home/board/board_list?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}" class="nextpage pbtn ${disabled}">
				<img src="/resources/home/img/btn_nextpage.png" alt="다음 페이지로 이동">
				</a>
			</div>
			<!-- //페이징처리영역 -->
			<p class="btn_line">
				<a href="board_write.html" class="btn_baseColor">등록</a>
			</p>
		</div>
		<!-- //메인본문영역 -->
	</div>
    <!-- //메인콘텐츠영역 -->
	

<%@ include file="../include/footer.jsp" %>