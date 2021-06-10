package com.edu.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 Admin관리자단을 접근하는 클래스
 * 변수 Object를 만들어서 jsp로 전송 <-> jsp 폼값을 받아서 Object로 처리
 * @author 김일국
 *
 */
@Controller
public class AdminController {
	//컨트롤러수정하면 자동로딩(auto컴파일)
	//디버그용 로그객체 생성(아래)
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	//이 메서드는 회원목록을 출력하는 jsp와 매핑이 됩니다.
	@Inject
	private IF_MemberService memberService;
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String selectMember(PageVO pageVO) throws Exception {
		//jsp의 검색버튼클릭시 search_type, search_keyword 내용이 PageVO클래스에 Set됩니다.
		
		//위에서 검색어를 받아서 역방향 검색한결과를 만들어서 jsp 보내줍니다.(아래)
		if(pageVO.getPage() == null) {//jsp에서 전송값이 없을때만 초기값 입력
			pageVO.setPage(1);
		}
		//pageVO의 calcPage메서드를 실행하려면, 필수 변수값입력(아래)
		pageVO.setQueryPerPageNum(10);
		pageVO.setPerPageNum(10);//하단UI에 보여줄 페이지번호 개수
		//totalCount를 구하는 메서드는 위 변수 2개값이 필수 -> prev, next값을 구할 수 있습니다.
		pageVO.setTotalCount(memberService.countMember(pageVO));
		//위 검색된 결과의 전체카운트값(단, 페이징 관련없개수)
		List<MemberVO> listMember = memberService.selectMember(pageVO);
		//100명의 회원에서는 하단 페이징 개수가 1...10 까지면 next가 false가 정상 입니다.
		logger.info("디버그" + pageVO.toString());//지금까지 jsp->컨트롤러 일방향 자료 이동.
		//컨트롤러에서 jsp로 역방향으로 보내는 자료를 Model에 담아서 보내게 됩니다.
		return "admin/member/member_list";//jsp파일 상대경로
	}
	//URL요청 경로는 @RequestMapping 반드시 절대경로로 표시
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin(Model model) throws Exception {//에러발생시 Exception클래스의 정보를 스프링으로 보내게 됩니다.		
		//아래 상대경로에서 /WEB-INF/views/폴더가 루트(생략prefix접두어) 입니다.
		//아래 상대경로 home.jsp에서 .jsp (생략suffix접미어) 입니다.
		return "admin/home";//리턴 경로=접근경로는 반드시 상대경로로 표시
	}
}
