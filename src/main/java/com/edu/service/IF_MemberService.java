package com.edu.service;

import java.util.List;

import com.edu.vo.MemberVO;

/**
 * 이 인터페이스는 회원관리에 관련된 Service의 명세를 모아놓은 파일.
 * {구현내용} 없음.
 * @author 김일국
 *
 */
public interface IF_MemberService {
	public List<MemberVO> selectMember() throws Exception;
	//이곳에 CRUD 메서드가 계속 추가됩니다.
	
}
