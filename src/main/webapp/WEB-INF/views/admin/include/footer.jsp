<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이후 footer.jsp영역 -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div>
  </footer>

  <!-- Control Sidebar 오른쪽 바둑판베뉴클릭시 나오는 내용 -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- demo.js에서 출력할 내용이 존재, demo.js사용않함. -->
    <div class="text-center mt-4">
    <h5>로그아웃</h5><hr class="mb-2"/>
    <button type="button" class="btn btn-primary" id="btn_logout">로그아웃</button>
    </div>
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery 제이쿼리 코어 -->
<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 제이쿼리 UI코어 -->
<script src="/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 부트스트랩4 코어 -->
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Summernote 섬머노트웹에디터 코어 -->
<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars 왼쪽스크롤메뉴 코어 -->
<script src="/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App AdminLTE코어 -->
<script src="/resources/admin/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes 오른쪽메뉴-로그아웃사용 코어: 사용안함. -->
<!-- <script src="/resources/admin/dist/js/demo.js"></script> -->
</body>
</html>
<style>
/* CSS를 재정의(오버라이드) */
.sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active 
{
background-color:#fff;
color:#000;
}
[class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active, [class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active:focus, [class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active:hover 
{
background-color:#fff;
color:#000;
}
</style>
<script>
//로그아웃 버튼 액션
$("#btn_logout").click(function(){
	location.replace('/logout');//security-context에 있는 /logout호출
});
//왼쪽메뉴선택시 active 부트스트랩 클래스를 동적으로 추가하는 코드(아래)
$(document).ready(function(){
	//현재 선택한 url값을 기준으로 지정
	var current = location.pathname;//현재 URL경로를 추출.
	//alert(current);//url값을 확인 파싱(분해) 0/admin/member/member_list
	var current2 = current.split("/")[2];//위 current변수값을 /로 분해해서 배열로 만든후 3번째
	// 3번째 배열값 추출
	//alert(current2);//member,bbs_type,board,undefined
	//제이쿼리의 반복문 each: 영역.each(구현내용)
	$(".nav-treeview li a").each(function(){//indexOf는 배열로서 0부터 시작합니다.
		if($(this).attr('href').indexOf(current2) != -1) {//URL에서 current2와 같은 값 O
			if(current2 != "board") {//게시물관리 메뉴만 제외하고, 다른메뉴에 적용 코드
				$(this).addClass("active");
			}			
		}else{
			$(this).removeClass("active");
		}
	});
});
</script>   