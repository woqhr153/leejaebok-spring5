package com.edu.service;

import java.util.List;

import com.edu.vo.BoardTypeVO;

/**
 * 이 인터페이스는 DAO클래스를 접근하는 서비스 입니다.
 * 그러면, DAO와 똑같으나, 나중에 DAO 10개일때 -> 서비스는 5개로 처리가 가능하게 되는 경우가 있어서...
 * 스프링부트는 위 과정이 1개로 합쳐져 있어서 상대적으로 간단한 프로젝트에 부트를 사용. 
 * @author 김일국
 *
 */
public interface IF_BoardTypeService {
	// CRUD 메서드 명세만 생성(아래5개)
	public void deleteBoardType(String board_type) throws Exception;
	public void updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public BoardTypeVO readBoardType(String board_type) throws Exception;
	public void insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	//BoardTypeVO 1개의 레코드를 저장한 클래스를 다중레코드 List<제네릭타입>로 묶어서 받습니다.
	public List<BoardTypeVO> selectBoardType() throws Exception;
}
