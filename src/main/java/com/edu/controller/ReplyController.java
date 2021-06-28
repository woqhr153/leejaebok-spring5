package com.edu.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RestController;

import com.edu.service.IF_ReplyService;

/**
 * 이 클래스는 RestFull 서비스의 Endpoint(게이트웨이,URL매핑)를 만드는 클래스임.
 * 간단하게 말하면, RestAPI서버 만드는 클래스 입니다.
 * @author 김일국
 *
 */
@RestController
public class ReplyController {
	@Inject
	private IF_ReplyService replyService;
	
	//@RequestMapping(value="/reply")
}
