package com.edu.vo;
/**
 * 이 클래스는 공통(회원관리,게시물관리)으로 사용하는 페이징처리+검색기능의 클래스.
 * @author 김일국
 * 이 클래스는 오라클이든, MySql(마리아DB) 어디서든 공통으로사용 Get/Set. 
 * 페이징에 사용되는 변수(쿼리변수+VO변수) 아래
 * queryStartNo, queryPerPageNum, page, perPageNum, startPage, endPage
  * 검색에 사용되는 변수(쿼리변수만): 검색어(search_keyword), 검색조건(search_type)
 */
public class PageVO {
	private int queryStartNo;//쿼리전용 변수
	private int queryPerPageNum;//쿼리전용
	private Integer page;//jsp에서발생 자바전용.int인데 Null값을 허용.
	private int perPageNum;//UI 하단에 보여줄 페이징 개수 계산에 필요
	private int totalCount;//계산식의 기초값으로 이 전체개수가 구해진 이후 페이징등의 계산식이 진행됩니다.
	private int startPage;//위 perPageNum으로 구하는 UI하단페이지시작번호
	private int endPage;//위 perPageNum으로 구하는 UI하단 페이지끝번호
	private boolean prev;//UI하단 이전 페이지로 이동이 가능한지 판별하는 변수
	private boolean next;//UI하단 다음 페이지로 이동이 가능한지 판별하는 변수
	private String search_keyword;//jsp에서 받은 검색어 쿼리전용 변수
	private String search_type;//검색조건에 해당 쿼리전용 변수
	
	public int getQueryStartNo() {
		//this.page-1하는 이유는 jsp에서는 1,2,3...받지만,
		//쿼리에서는 0,1,2...으로 사용되기 때문에. page*페이지당보여줄개수
		queryStartNo = (this.page-1)*queryPerPageNum;
		return queryStartNo;
	}
	public void setQueryStartNo(int queryStartNo) {
		this.queryStartNo = queryStartNo;
	}
	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}
	public void setQueryPerPageNum(int queryPerPageNum) {
		this.queryPerPageNum = queryPerPageNum;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//전체개수 값을 지정한 이후 계산식 실행
		calcPage();
	}
	private void calcPage() {
		// 이 메서드는 totalCount변수값을 기반으로 prev,next,startPage,endPage 등등을 구현하게 됩니다.
		//2 1.9 1.8 ... 1.2 1.1 => 2
		//ceil(11/10)*10 => 20페이지 == tempEnd 1-10페이지 에서 11페이지값이 존재하면, 끝페이지에 임시로 20이라는 숫자를 줍니다.
		int tempEnd = (int) Math.ceil(page/(double)this.perPageNum)*this.perPageNum;
		//jsp에서 클릭한 페이지번호 예로 1 부터 10까지는 클릭하면, 임시 끝페이지가 10.
		//만약에 11페이지를 클릭하면, 임시 끝페이지가 20.확인 위 tempEnd변수값으로 아래내용에 이용 시작페이지를 계산하게 됩니다.
		this.startPage = (tempEnd - this.perPageNum) + 1;//UI페이지하단에 페이지번호가 출력되도록 하는 반복의 시작 변수.
		//예, 1-10까지는 page를jsp에 클릭했을때, 시작페이지가 항상 1페이지, 하지만, 11부터20까지 시작페이지 위 계산식을 이용하면 항상 11페이지로 됩니다.
		
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	
}
