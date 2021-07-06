package com.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edu.service.IF_ReplyService;
import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

/**
 * 이 클래스는 RestFull 서비스의 Endpoint(게이트웨이,URL매핑)를 만드는 클래스임.
 * 간단하게 말하면, RestAPI서버 만드는 클래스 입니다.
 * @author 김일국
 *
 */
@RestController
public class ReplyController {
	private Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Inject
	private IF_ReplyService replyService;
	
	//댓글 삭제를 RestFul로 처리
	@RequestMapping(value="/reply/reply_delete/{bno}/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reply_delete(@PathVariable("bno")Integer bno,@PathVariable("rno")Integer rno) {
		ResponseEntity<String> result = null;
		ReplyVO replyVO = new ReplyVO();
		replyVO.setBno(bno);
		replyVO.setRno(rno);
		try {
			replyService.deleteReply(replyVO);
			result = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	//댓글은 Read가 필요없음. 왜냐하면, Select로 가져온 값을 Ajax로 처리하기 때문에 쿼리를 날릴 필요가 없습니다.
	//그래서, 바로 Update를 처리합니다.-간단하게 update시 Read쿼리가 없고, Ajax처리함.
	@RequestMapping(value="/reply/reply_update", method=RequestMethod.PATCH)
	public ResponseEntity<String> reply_update(@RequestBody ReplyVO replyVO) {
		//@RequestBody jsp에서 $.ajax를 이용해서 보내는 데이터값 <-> @ResponseBody 응답return값
		ResponseEntity<String> result = null;
		try {
			replyService.updateReply(replyVO);
			result = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;//Restful방식은 항상 반환값이(Body:String, Hasmap-json부분) 존재합니다.
	}
	//댓글 등록 @RequestBody는 jsp에서 Ajax메서드로 보내온 값을 받을때 사용하는 애노테이션 입니다.
	@RequestMapping(value="/reply/reply_insert", method=RequestMethod.POST)
	public ResponseEntity<String> reply_insert(@RequestBody ReplyVO replyVO) {
		//ResponseEntity == ResponsBody
		ResponseEntity<String> result = null;
		//개발자가 스프링에 예외를 throws하지않고, 직접처리 try~catch하는 목적:
		//Rest상태값(200,204,500등의 상황들)을 개발자가 보내줘야 하기 때문에...
		try {
			replyService.insertReply(replyVO);
			result = new ResponseEntity<String>("success",HttpStatus.OK);//객체 생성시 매개변수로 상태값 + 입력성공시 success라는 문자열도 보냄
			
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	@RequestMapping(value="/reply/reply_list/{bno}/{page}", method=RequestMethod.POST)//POST로 만든목적은 현재 도메인에서만 사용가능하도록 하기 위해서
	public ResponseEntity<Map<String,Object>> reply_list(@PathVariable("bno")Integer bno,@PathVariable("page")Integer page) {
		ResponseEntity<Map<String,Object>> result = null;
		//ResponseEntity는 일반 Controller클래스에서 사용했던 ResponseBody와 같은 역할.
		//URL주소가 아니고, Json데이터형으로 자료를 반환.
		/*
		Map<String,Object> dummyMap1 = new HashMap<String,Object>();
		Map<String,Object> dummyMap2 = new HashMap<String,Object>();
		Map<String,Object> dummyMap3 = new HashMap<String,Object>();
		dummyMap1.put("rno", 1);
		dummyMap1.put("reply_text", "댓글테스트1");
		dummyMap1.put("replyer", "admin");
		dummyMap1.put("bno", bno);
		
		dummyMap2.put("rno", 2);
		dummyMap2.put("reply_text", "댓글테스트2");
		dummyMap2.put("replyer", "admin");
		dummyMap2.put("bno", bno);
		
		dummyMap3.put("rno", 3);
		dummyMap3.put("reply_text", "댓글테스트3");
		dummyMap3.put("replyer", "admin");
		dummyMap3.put("bno", bno);
		//위 Map형 레코드3개를 1개의 List객체로 묶었습니다.(아래)
		List<Object> dummyMapList = new ArrayList<Object>();
		dummyMapList.add(0, dummyMap1);
		dummyMapList.add(1, dummyMap2);
		dummyMapList.add(2, dummyMap3);
		*/
		
		try {
		PageVO pageVO = new PageVO();
		pageVO.setPage(page);
		//댓글 페이징 처리(아래 3개는 필수)
		pageVO.setPerPageNum(5);
		pageVO.setQueryPerPageNum(5);
		pageVO.setTotalCount(replyService.countReply(bno));
		//더미데이터 대신에 DB데이터를 가져와서 사용
		//====================================================
		
		//아래의 Json데이터형태는 일반컨트롤러에서 사용했던 model사용해서 ("변수명",객체내용) 전송한 방식과 동일
		if(pageVO.getTotalCount() > 0) {
			//아래 resultMap을 만든 목적은: 위 List객체를 ResponseEntity객체의 매개변수로 사용.
			Map<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("replyList", replyService.selectReply(bno, pageVO));
			resultMap.put("pageVO", pageVO);
			logger.info("여기까지");
			//객체를 2개 이상 보내게 되는 상황일때, Json데이터형태(key:value)로 만들어서 보냅니다. 
			//--------------------------------------------------------
			//result객체를 만든목적:RestApi클라이언트(jsp쪽)으로 resultMap객체를 보낼때 상태값을 위해서
			result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);
		} else {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.NO_CONTENT);
		}
		//======================================================
		} catch(Exception e) {
			Map<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("errorMsg", e.getMessage());
			result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
		/* Json데이터 출력 예 
		resultMap =
		[ //ResponseEntity형태는 대괄호로 자료를 묶어서[배열로] 반환합니다.
		{"rno":1,"reply_text":"댓글테스트1","replyer":"admin","bno":59},//<= Map<String,Object>1개레코드
		{"rno":2,"reply_text":"댓글테스트2","replyer":"admin","bno":59},
		{"rno":3,"reply_text":"댓글테스트3","replyer":"admin","bno":59}
		];
		*/
		
	}
}
