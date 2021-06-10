package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 IF_memberDAO 인터페이스를 구현하는 클래스 입니다.
 * implements 키워드로 상속을 받습니다.
 * 단, DAO기능의 구현클래스는 스프링빈으로 등록이 필요. 그래서, @Repository
 * @author User
 *
 */
@Repository
public class MemberDAOImpl implements IF_MemberDAO{
	@Inject //SqlSession 의존성을 주입합니다.= 고전에서 객체를 생성
	private SqlSession sqlSession;
	
	@Override //부모 인터페이스의 메서드를 상속해서 재정의 합니다.
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// SqlSession의 메서드 이용해서 매퍼 쿼리를 사용
		List<MemberVO> listMember = sqlSession.selectList("memberMapper.selectMember", pageVO);
		return listMember;
	}

	@Override
	public int countMember(PageVO pageVO) throws Exception {
		// SqlSession빈의 메서드를 이용해서 매퍼 쿼리를 실행(아래)
		int totalCount = sqlSession.selectOne("memberMapper.countMember", pageVO);
		return totalCount;
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// sqlSession빈의 메서드를 이용해서 매퍼 쿼리를 실행(아래)
		sqlSession.insert("memberMapper.insertMember", memberVO);
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// sqlSession스프링빈의 메서드를 이용해서 매퍼 쿼리를 실행(아래)
		sqlSession.delete("memberMapper.deleteMember", user_id);
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// 데이터베이스 마이바티스 쿼리를 호출(실행)
		return sqlSession.selectOne("memberMapper.readMember", user_id);
	}

	@Override
	public void updateMember(MemberVO memberOne) throws Exception {
		// DB 마이바티스 쿼리 호출(아래)
		sqlSession.update("memberMapper.updateMember", memberOne);
	}

}
