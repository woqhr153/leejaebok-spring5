package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.dao.IF_MemberDAO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 회원관리 서비스 인터페이스를 구현하는 클래스.
 * 상속 extends, 구현 implements 키워드를 사용
 * 스프링빈으로 등록하려면, @Service 애너테이션을 명시.
 * @author 김일국
 *
 */
@Service
public class MemberServiceImpl implements IF_MemberService {
	@Inject //IF_MemberDAO를 주입해서 객체로 사용(아래)
	private IF_MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// 인터페이스에서 상속받은 메서드를 구현(아래)
		return memberDAO.selectMember(pageVO);
	}

	@Override
	public int countMember(PageVO pageVO) throws Exception {
		// 인젝션으로 주입받은 DAO객체를 사용(아래)
		return memberDAO.countMember(pageVO);
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// 클래스 상단에서 인젝션으로 주입받느 DAO객체를 사용(아래)
		memberDAO.insertMember(memberVO);
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// 클래스 상단에서 인젝션으로 주입받은 DAO객체를 사용(아래)
		memberDAO.deleteMember(user_id);
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// DAO를 호출(실행)
		return memberDAO.readMember(user_id);
	}

	@Override
	public void updateMember(MemberVO memberOne) throws Exception {
		// DAO 호출(아래)
		memberDAO.updateMember(memberOne);
	}

}
