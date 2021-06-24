<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">${session_board_type} 글쓰기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">${session_board_type} 게시물관리</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 콘텐츠 내용 -->
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">등록</h3>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <!-- 첨부파일을 전송할때 enctype=필수 없으면, 첨부파일이 전송X -->
          <form name="form_write" method="post" action="/admin/board/board_insert" enctype="multipart/form-data">
            <div class="card-body">
              <div class="form-group" style="display:none">
                <label for="board_type">게시판타입</label>
                <select name="board_type" class="form-control">
                <!-- 세션값을 비교값으로 사용하는 이유는 신규등록이기때문에 기존게시물정보가 없습니다. -->
                <c:forEach var="boardTypeVO" items="${listBoardTypeVO}">
                  <option ${session_board_type==boardTypeVO.board_type?'selected':''} value="${boardTypeVO.board_type}">${boardTypeVO.board_name}</option>
                </c:forEach>
                  
                </select>
              </div>
              <div class="form-group">
                <label for="title">글제목</label>
                <input value="" name="title" type="text" class="form-control" id="title" placeholder="제목을 입력해 주세요" required>
              </div>
              <div class="form-group">
                <label for="content">글내용</label>
                <textarea name="content" id="content" class="form-control" placeholder="내용을 입력해주세요."></textarea>
              </div>
              <div class="form-group">
                <label for="writer">작성자</label>
                <input value="" name="writer" type="text" class="form-control" id="writer" placeholder="작성자를 입력해 주세요" required>
              </div>
              <div class="form-group">
                <label for="exampleInputFile">첨부파일</label>
                <c:forEach var="idx" begin="0" end="1">
                <div class="input-group div_file_delete">
                <!-- 위 div_file_delete 영역이름은 첨부파일을 개별 Ajax 삭제할때 필요 -->
                  <div class="custom-file">
                    <input name="file" type="file" class="custom-file-input" id="file_${idx}"><!-- id는 식별자0,1,2,3... -->
                    <label class="custom-file-label" for="file_${idx}">파일선택</label>
                  </div>
                  
                </div>
                <div class="mb-2"></div>
                
                </c:forEach>
                

              </div>
              
            </div>
            <!-- /.card-body -->

            <div class="card-footer text-right">
              <button type="submit" class="btn btn-primary">등록</button>
              <a href="/admin/board/board_list?page=${pageVO.page}&search_type=${pageVO.search_type}" class="btn btn-info">목록</a>
            </div>
            <input name="page" value="${pageVO.page}" type="hidden">
            <input name="search_type" value="${pageVO.search_type}" type="hidden">
          </form>
        </div>
        <!-- //콘텐츠 내용 -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<!-- 첨부파일명을 input태그디자인 안쪽에 집어넣는 확장프로그램 -->
<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 위 첨부파일 확장프로그램 실행(아래-개발자가 처리) -->
<script>
	$(document).ready(function(){
		bsCustomFileInput.init();
	});
</script>
<!-- 서머노트 웹에디터 실행(아래-개발자가 처리) -->
<script>
	$(document).ready(function(){
		//$('#content_lbl').summernote();//기본실행. 이기본실을 개발자 커스터마이징 합니다.
		$('#content').summernote({
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
		//서머노트에서 html5의 required 속성 작동이 않되기 때문에 아래코드 추가
		$("form[name='form_write']").on('submit',function(event){
			if($('#content').summernote('isEmpty')){
				alert('내용은 반드시 입력해 주세요');
				event.preventDefault();//submit전송기능 사용금지.
			}
		});
	});
</script>