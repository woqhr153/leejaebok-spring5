package com.edu.dao;

import java.util.List;

import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

/**
 * 이 인터페이스는 댓글 쿼리에 입출력하는 메서드명만 존재합니다.
 * @author 김일국
 *
 */
public interface IF_ReplyDAO {
	public void deleteReplyAll(Integer bno) throws Exception;
	public void deleteReply(Integer rno) throws Exception;
	public void updateReply(ReplyVO replyVO) throws Exception;
	public void replyCountUpdate(Integer bno, int count) throws Exception;
	public void insertReply(ReplyVO replyVO) throws Exception;//replyVO jsp폼에서
	public int countReply(Integer bno) throws Exception;
	public List<ReplyVO> selectReply(PageVO pageVO) throws Exception;
}
