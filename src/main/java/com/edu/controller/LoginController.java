package com.edu.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 이 클래스는 스프링시큐리티의 /login처리한 결과를 받아서 /login_success
 * 를 처리하는 클래스 입니다. 
 * @author 김일국
 *
 */
@Controller
public class LoginController {
	
	@RequestMapping(value="/login_success", method=RequestMethod.GET)
	public String login_success(HttpServletRequest request, RedirectAttributes rdat) throws Exception {
		//request의 목적: 세션객체를 만들기 위해서(로그인정보를 화면이 이동하더라도 유지하기 위해서)
		//rdat의 목적: model객체로 값을 전송할 수 없는 상황일때, 값을 jsp로 전송하기 위해서  
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//싱글톤객체를 만들거나, 사용하는 목적: 메모리관리를 위해서 1개만 객체로 만들어서 사용하기 위해서(new로 객체를 생성하지 못함)
		String userid = "";//사용자ID
		String levels = "";//권한이 들어갈 변수
		Boolean enabled = false;//로그인체크가 들어가 들어가 변수(true=아이디/암호 비교성공)
		//principal객체는 UserDetails객체가 추출되고, enabled라는 인증결과가 존재합니다.
		Object principal = authentication.getPrincipal();//ID,암호 비교쿼리가 실행됩니다.
		if(principal instanceof UserDetails) {//위 결과 principal 객체에 UserDetails 있으면
			enabled = ((UserDetails) principal).isEnabled();//true,false
			//위 인증결과로 로그인 체크를 합니다. 
		}
		//로그인 인증이 true라면 내용 실행(세션값-로그인아이디,권한,회원이름 저장하는 목적)
		if(enabled) {
			HttpSession session = request.getSession();
			//자바8이상에서 지원되는 람다식 사용(아래)
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
			//authorities에는 초기값으로 존재 {"ROLE_ANONYMOUS","ROLE_USER","ROLE_ADMIN",..}
			
		}
		return "";
	}
}
