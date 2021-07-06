<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 헤더,푸터가 필요없음. 페이지안쪽에 내용만 출력할 예정 -->
<div class="card">
  <div class="card-header border-transparent">
    <h3 class="card-title">최근 ${board_name}</h3>

    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse">
        <i class="fas fa-minus"></i>
      </button>
      <button type="button" class="btn btn-tool" data-card-widget="remove">
        <i class="fas fa-times"></i>
      </button>
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body p-0">
    <div class="table-responsive">
      <table class="table m-0">
        <thead>
        <tr>
          <th>제목[댓글수]</th>
          <th>작성자</th>
          <th>조회수</th>
          <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="boardVO" items="${latestBoard}">
        	<tr>
	          <td><a href="/admin/board/board_view?bno=${boardVO.bno}&page=1">
	          ${boardVO.title}[${boardVO.reply_count}]
	          </a></td>
	          <td>${boardVO.writer}</td>
	          <td><span class="badge badge-success">${boardVO.view_count}</span></td>
	          <td>
	            <div class="sparkbar" data-color="#00a65a" data-height="20">
	            <fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${boardVO.reg_date}"/> 
	            </div>
	          </td>
	        </tr>
        </c:forEach>       
        </tbody>
      </table>
    </div>
    <!-- /.table-responsive -->
  </div>
  <!-- /.card-body -->
  <div class="card-footer clearfix">
    <a href="/admin/board/board_list?board_type=${board_type}" class="btn btn-sm btn-info float-right">더보기</a>
  </div>
  <!-- /.card-footer -->
</div>