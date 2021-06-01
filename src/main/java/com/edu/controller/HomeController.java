package com.edu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//외부 라이브러리(모듈) 사용 = import
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 이 클래스는 MVC웹프로젝트를 최초로 생성시 자동으로 생성되는 클래스
 * 웹브라우저의 요청사항을 view단(jsp)에 연결시켜주는 클래스 @Controller.
 * 스프링에서 관리하는 클래스를 스프링빈(콩) = 스프링빈을 명시 @Controller 애노테이션
 * Beans(콩들) 그래프로 이 프로젝트의 규모를 확인가능.
 * 스프링이 관리하는 클래스=스프링빈은 파일아이콘에 S가 붙습니다. 
 */

@Controller
public class HomeController {
	//스프링빈(클래스) 에서는 로거로 디버그를 합니다.=로거객체를 만듭니다.
	// 로그중 slf4j(Spring Log For Java)
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 사용자요청(웹브라우저)을 받아서=@RequestMapping인테페이스를 사용해서 메서드명을 스프링이 구현합니다.
	 *  ,router(루트rootX)
	 * return 값으로 view(jsp)를 선택해서 작업한 결과를 변수로 담아서 화면에 전송 후 결과를 표시(렌더링) 합니다.
	 * 폼(자료)전송시 post(자료숨김), get(자료노출-URL쿼리스트링?있는자료전송)
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homepage(Model model) { //콜백메스드,자동실행됨.
		String jspVar = "@서비스(DB)에서 처리한 결과";
		model.addAttribute("jspObject", jspVar);
		logger.info("디버그 스프링로고사용: " + jspVar);//System.out 대신 logger 객체를 사용
		//home.jsp파일로 자료를 전송(스프링)하는 기능= model인터페이스 객체(스프링이처리)에 내용만 채우면됨
		return "home/index";//확장자가 생략 .jsp가 생략되어 있음.
	}
	
}
