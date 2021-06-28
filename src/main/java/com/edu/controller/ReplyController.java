package com.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edu.service.IF_ReplyService;
import com.edu.vo.PageVO;

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
	
	@RequestMapping(value="/reply/reply_list/{bno}/{page}", method=RequestMethod.POST)//POST로 만든목적은 현재 도메인에서만 사용가능하도록 하기 위해서
	public ResponseEntity<Map<String,Object>> reply_list(@PathVariable("bno")Integer bno,@PathVariable("page")Integer page) {
		//ResponseEntity는 일반 Controller클래스에서 사용했던 ResponseBody와 같은 역할.
		//URL주소가 아니고, Json데이터형으로 자료를 반환.
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
		
		ResponseEntity<Map<String,Object>> result = null;
		try {
		//====================================================
		//아래 resultMap을 만든 목적은: 위 List객체를 ResponseEntity객체의 매개변수로 사용.
		Map<String,Object> resultMap = new HashMap<String,Object>();
		//아래의 Json데이터형태는 일반컨트롤러에서 사용했던 model사용해서 ("변수명",객체내용) 전송한 방식과 동일
		resultMap.put("replyList", dummyMapList);
		//객체를 2개 이상 보내게 되는 상황일때, Json데이터형태(key:value)로 만들어서 보냅니다. 
		//--------------------------------------------------------
		
		//result객체를 만든목적:RestApi클라이언트(jsp쪽)으로 resultMap객체를 보낼때 상태값을 보내기위해서
		result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);
		//======================================================
		} catch(Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
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
