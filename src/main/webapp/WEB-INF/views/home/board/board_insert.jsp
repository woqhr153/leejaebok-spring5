<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- 메인콘텐츠영역 -->
<div id="container">
	<!-- 메인상단위치표시영역 -->
	<%@ include file="./board_header.jsp" %>
	<!-- //메인상단위치표시영역 -->

	<!-- 메인본문영역 -->
	<div class="bodytext_area box_inner">
		<!-- 폼영역 -->
		<form method="POST" name="board_write" action="/home/board/board_insert" class="appForm" enctype="multipart/form-data">
			<fieldset>
				<legend>상담문의 입력 양식</legend>
				<p class="info_pilsoo pilsoo_item">필수입력</p>
				<ul class="app_list">
					<li class="clear">
						<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
						<div class="app_content"><input type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/></div>
					</li>
					<li class="clear">
						<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
						<div class="app_content">
							<textarea name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required></textarea></div>
					</li>
					<li class="clear">
						<label for="name_lbl" class="tit_lbl pilsoo_item">작성자명</label>
						<div class="app_content"><input readonly value="${session_userid}" type="text" name="writer" class="w100p" id="name_lbl" placeholder="이름을 입력해주세요" required/></div>
					</li>
					<li class="clear">
						<label for="file_lbl" class="tit_lbl">첨부파일</label>
						<c:forEach begin="0" end="1" step="1" var="idx">
						<div class="custom-file" style="width:96%;margin:0 2%;">
							<input type="file" name="file" class="custom-file-input" id="customFile_${idx}">
							<label class="custom-file-label" for="customFile" style="color:#999;">파일첨부${idx}</label>
						</div>
						<div style="height:10px;"></div>
						</c:forEach>					
					</li>
				</ul>
				<p class="btn_line">
				<button type="submit" class="btn_baseColor">등록</button>
				<a href="/home/board/board_list" class="btn_baseColor">목록</a>
				</p>	
			</fieldset>
			<input name="board_type" value="${session_board_type}" type="hidden" >
		</form>
		<!-- //폼영역 -->
	</div>
	<!-- //메인본문영역 -->
</div>
<!-- //메인콘텐츠영역 -->

<%@ include file="../include/footer.jsp" %>