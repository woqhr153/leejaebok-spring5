package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.dao.IF_ReplyDAO;
import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

/**
 * 이 클래스는 댓글 DAO의 CRUD를 실행하는 서비스 클래스 입니다.
 * @author 이재복
 *
 */
@Service
public class ReplyServiceImpl implements IF_ReplyService {
	@Inject
	private IF_ReplyDAO replyDAO;
	
	@Transactional
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO 2개의 DAO를 호출(실행)
		replyDAO.deleteReply(replyVO);
		// 현재 게시물 고유번호 bno가 필요.
		replyDAO.replyCountUpdate(replyVO.getBno(), -1);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO 
		replyDAO.updateReply(replyVO);
	}

	@Transactional // ALL or NotALL 모 아니면 도
	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		// TODO 2개의 DAO를 호출(실행)
		replyDAO.insertReply(replyVO);
		replyDAO.replyCountUpdate(replyVO.getBno(), 1);
	}

	@Override
	public int countReply(Integer bno) throws Exception {
		// TODO 1개 레코드를 출력, 해당 게시물의 댓글의 수
		return replyDAO.countReply(bno);
	}

	@Override
	public List<ReplyVO> selectReply(Integer bno, PageVO pageVO) throws Exception {
		// TODO DAO객체 사용
		return replyDAO.selectReply(bno, pageVO);
	}

}
