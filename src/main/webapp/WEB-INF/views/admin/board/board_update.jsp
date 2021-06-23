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
            <h1 class="m-0">{게시판변수명} 글쓰기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">{게시판변수명}</li>
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
          <form name="form_write" action="board_write.html" enctype="multipart/form-data">
            <div class="card-body">
              <div class="form-group">
                <label for="board_type">게시판타입</label>
                <select name="board_type" class="form-control">
                  <option>선택</option>
                  <option>공지사항</option>
                  <option>겔러리</option>
                </select>
              </div>
              <div class="form-group">
                <label for="title">글제목</label>
                <input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력해 주세요" required>
              </div>
              <div class="form-group">
                <label for="content">글내용</label>
                <textarea name="content" id="content" class="form-control" placeholder="내용을 입력해주세요." required></textarea>
              </div>
              <div class="form-group">
                <label for="writer">작성자</label>
                <input name="writer" type="text" class="form-control" id="writer" placeholder="작성자를 입력해 주세요" required>
              </div>
              <div class="form-group">
                <label for="exampleInputFile">첨부파일</label>
                <div class="input-group">
                  <div class="custom-file">
                    <input name="file" type="file" class="custom-file-input" id="file0">
                    <label class="custom-file-label" for="file0">파일선택</label>
                  </div>
                </div>
                <div class="mb-2"></div>
                <div class="input-group">
                  <div class="custom-file">
                    <input name="file" type="file" class="custom-file-input" id="file1">
                    <label class="custom-file-label" for="file1">파일선택</label>
                  </div>
                </div>
              </div>
              
            </div>
            <!-- /.card-body -->

            <div class="card-footer text-right">
              <button type="submit" class="btn btn-primary">등록</button>
              <a href="board_list.html" class="btn btn-default">목록</a>
            </div>
          </form>
        </div>
        <!-- //콘텐츠 내용 -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>