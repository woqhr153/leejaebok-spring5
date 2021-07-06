package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

/**
 * 이클래스는 sqlSession템플릿을 이용해서 쿼리를 실행하는 클래스입니다.
 * @author 김일국
 *
 */
@Repository
public class ReplyDAOImpl implements IF_ReplyDAO{
	@Inject //자바8부터 지원됨, 이전에는 @Autowired, @Resource 스프링빈을 주입
	private SqlSession sqlSession;
	
	@Override
	public void deleteReplyAll(Integer bno) throws Exception {
		// TODO 여러개 레코드 지우기
		sqlSession.delete("replyMapper.deleteReplyAll", bno);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO 1게 레코드 지우기
		sqlSession.delete("replyMapper.deleteReply", replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO 
		sqlSession.update("replyMapper.updateReply", replyVO);
	}

	@Override
	public void replyCountUpdate(Integer bno, int count) throws Exception {
		// TODO 매개변수가 2개일때 처리 1개 오브젝트인 Map테이터형태로 담아보냄
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bno", bno);
		paramMap.put("count", count);
		sqlSession.update("replyMapper.replyCountUpdate", paramMap);
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		// TODO 아래와 동일
		sqlSession.insert("replyMapper.insertReply", replyVO);
	}

	@Override
	public int countReply(Integer bno) throws Exception {
		// TODO 아래와 동일
		return sqlSession.selectOne("replyMapper.countReply", bno);
	}

	@Override
	public List<ReplyVO> selectReply(Integer bno, PageVO pageVO) throws Exception {
		// TODO sqlSession템플릿사용("매퍼쿼리명","매개변수명")
		Map<String,Object> paramMap = new HashMap<String,Object>();
		//paramMap.put("pageVO", pageVO);
		paramMap.put("queryStartNo", pageVO.getQueryStartNo());
		paramMap.put("queryPerPageNum", pageVO.getQueryPerPageNum());
		paramMap.put("bno", bno);
		//paramMap = ["pageVO",{"queryStartNo":"값","queryPerPageNum":"값"}]
		return sqlSession.selectList("replyMapper.selectReply", paramMap);
	}

}
