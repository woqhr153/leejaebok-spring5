package com.edu.aop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.edu.service.IF_BoardService;
import com.edu.service.IF_BoardTypeService;
import com.edu.vo.BoardTypeVO;
import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 AOP기능 중 @Aspect 과 @ControllerAdvice 로 구현됩니다.
 * @author 김일국
 *
 */
@Aspect
@ControllerAdvice
public class AspectAdvice {
	private Logger logger = LoggerFactory.getLogger(AspectAdvice.class);
	@Inject
	private IF_BoardTypeService boardTypeService;
	@Inject
	private IF_BoardService boardService;
	
	//나중엑 게시물관리 기능 만들때 @Aspect로 AOP기능 추가 = 목적:board_type값을 항상 가져 가도록 처리(세션)
	//세션? 서버-PC 구조상에서 클라이언트가 서버에 접속할때 [서버에 발생되는 정보를 세션이라고 함(서버에 저장됨)]
	//쿠키? 서버-PC 구조상에서 클라이언트가 서버에 접속할때 클라이언트에 발생되는 정보를 쿠기라고함(PC에 저장됨)
	//옛날에는 쿠키로 로그인 체크를 했음.->보안상 PC에 로그인정보가 저장되기 때문에 위험(인터넷광고에만사용)->세션만사용
	//Aspect로 AOP를 구현할때는 포인트컷(Advice참견이 실행될 위치)이 필요합니다.
	//@Around=@Before+@After = @Around(포인트컷 전+후.*(...)모든 메서드)
	//@Around는 콜백함수 매개변수로 조인포인트객체(포인트컷에서 실해되는 메서드들) 를 필수로 받습니다.
	//아래 조인포인트(진입점)은 board_delete || board_update* 메서드를 실행할때, 
	//본인이 작성한글인지 확인하는 기능(단, ROLE_ADMIN 사용자는 제외)을 만듭니다.
	@Around("execution(* com.edu.controller.HomeController.board_delete(..)) || execution(* com.edu.controller.HomeController.board_update*(..))")
	public Object check_board_crud(ProceedingJoinPoint pjp) throws Throwable {
		//request객체는 이전페이지 URL+session_userid(세션값) 을 가져오기 위해서 필요.
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//사용할 변수 초기화(null)
		String user_id = null;//게시물작성자 ID변수
		BoardVO boardVO = null;//boardVO.getWriter()게시물의 작성자 ID를 구하려면 필요한 객체변수
		logger.info("디버그 호출된 메서드명은: " + pjp.getSignature().getName());
		//향상된 for문을 이용해서 매개변수 중 bno, boardVO 2가지를 체크해서 user_id를 구합니다.
		for(Object object:pjp.getArgs()) {
			//메서드의 매개변수가 BoardVO, bno일때만 로직을 실행하기 위해서
			if(object instanceof BoardVO) {//BoardVO 클래스형 테이터형 임.
				user_id = ((BoardVO) object).getWriter();//업데이트 처리시 매개변수로 받은 객체
			}
			//조인포인트의 메서드의 매개변수가 object인데, 이 값과 instanceof 데이터형을 비교
			if(object instanceof Integer) {//bno일때는 Integer 데이터형 임.
				boardVO = boardService.readBoard((int) object);
				user_id = boardVO.getWriter();
			}
		}
		if(request != null) {
			HttpSession session = request.getSession();
			//위 메서드의 매개변수를 이용해서 생성된 user_id와 세션user_id와 비교
			if(!user_id.equals(session.getAttribute("session_userid"))) {
				//메세지를 redirect로 
				return "redirect:" + request.getHeader("Referer");
			}
		}
		Object result = pjp.proceed();//실제 조인포인트 실행 여기서됨.
		return result;
	}
	
	//아래 조인포인트(진입점)은 검색어와 게시판타입의 값을 세션으로 유지시키는 기능
	@Around("execution(* com.edu.controller.*Controller.*(..))")
	public Object sessionManager(ProceedingJoinPoint pjp) throws Throwable {
		//board_type변수값을 세션에 저장하려고 함. 클라이언트별 세션이 발생됨.
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//일반적인 컨트롤러에서는 매개변수 HttpServletRequest를 사용가능함. 위처럼 복잡하게 구하지 않음.
		//컨트롤러 클래스에서 매개변수로 받을값(board_type) < pageVO
		PageVO pageVO = null;
		String board_type = null;//jsp에서 전송되는 값을 임시로 저장,목적은 세션변수 발생조건으로사용
		String search_keyword = null;//한글검색시 IE에서 400에러발생때문에 추가
		//조인포인트리스트의 객체의 메서드의 Arguments(매개변수)를 뽑아냄 
		for(Object object:pjp.getArgs()) {
			if(object instanceof PageVO) {//AOP실행메서드중 매개변수 PageVO pageVO객체 판단
				//결과는 게시판이나 멤버 서비스에 PageVO사용하는 서비스에만 적용됨. 게시판생성관리에는 적용X
				pageVO = (PageVO) object;
				board_type = pageVO.getBoard_type();
				search_keyword = pageVO.getSearch_keyword();
			}
		}
		if(request != null) {//jsp에서 Get,Post 있을때,
			//세션값을 pageVO.board_type 값으로 저장 로직(아래)
			HttpSession session = request.getSession();//PC가 스프링프로젝트 접근시 세션객체
			//검색폼이 있는 jsp에서 발생됨. 결과는 검색폼이 없는 입력/수정/삭제에서는 실행않됨.
			if(search_keyword != null) {//검색어가 발생하면 최초로 세션를 만듭니다.
				session.setAttribute("session_search_keyword", search_keyword);
			}
			if(session.getAttribute("session_search_keyword") != null) {
				//세션값이 있다면, 실행
				search_keyword = (String) session.getAttribute("session_search_keyword");
				if(pageVO !=null) {//겟,셋중에 Set할때 pageVO널이면 에러발생하기 때문에 추가한 코드
					pageVO.setSearch_keyword(search_keyword);
				}
			}
			if(board_type != null) {//최초로 세션변수가 발생
				session.setAttribute("session_board_type", board_type);
			}
			if(session.getAttribute("session_board_type") != null) {
				board_type = (String) session.getAttribute("session_board_type");
				if(pageVO != null) {//Set은 pageVO가 null아닐 경우만 실행되도록
					pageVO.setBoard_type(board_type);//검색목표달성:여기서 항상 값을 가져가도록 구현됩니다.
				}
			}
			logger.info("디버그19: "+(String) session.getAttribute("session_board_type"));
		}		//Aspect > 포인트컷(Around) > 조인포인트(메서드) > 매개변수로 구현한 결과를 리턴
		
		Object result = pjp.proceed();//여기서 조인포인트가 실행됩니다.
		return result;
	}
	
	//이 메서드는 컨트롤러에서 Exception이 발생했을때 여기서 인터셉터(가로채기)해서 
	//에러 메세지를 개발자가 작성한 jsp화면에 뿌려주는 기능을 추가 prevPage 변수1, exception 변수2 전송함.
	@ExceptionHandler(Exception.class)
	public ModelAndView errorModelAndView(Exception ex, HttpServletRequest request) {
		//Model(jsp로 Data담아서 보내주는 객체) + View(페이지 이동할 주소)
		ModelAndView modelAndView = new ModelAndView();
		//이전페이지로 돌아가기용 데이터 생성
		String referer = request.getHeader("Referer");//크롬>네트워크>파일>Referer>이전페이지 URL이 존재
		request.getSession().setAttribute("session_prevPage", referer);//prevPage세션변수만듭니다.
		//---------------------------------------------
		//컨트롤러에서 받은 Exception을 ModelAndView로 전달(아래)
		modelAndView.addObject("exception", ex);
		modelAndView.setViewName("home/error/error_spring");//return String .jsp생략
		return modelAndView;
	}
	//이 메서드는 컨트롤러의 메서드가 실행 전에 값을 생성해서 model객체에 담아서 jsp로 자료를 전송
	//위 @컨트롤러어드바이스 를 이용해서 컨트롤러의 모든 메서드가 실행되기 호출만되면 아래 메서드가 자동실행(콜백함수) 
	@ModelAttribute("listBoardTypeVO")
	public List<BoardTypeVO> listBoardTypeVO() throws Exception {
		
		return boardTypeService.selectBoardType();
	}
}
