package com.edu.dao;

import java.util.List;

import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * 이 인터페이스는 boardMapper.xml을 접근하기 위한 DataAccessObject 입니다.
 * DAO 와 서비스를 나눈 이유 확인.
 * @author 김일국
 *
 */
public interface IF_BoardDAO {
	//페이징 없는 검색된(board_type포함된) 게시물 개수
	public int countBoard(PageVO pageVO) throws Exception;
	//기본 CRUD 아래
	public void deleteBoard(int bno) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int bno) throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
}
