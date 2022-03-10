package org.vision.rentcar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.vision.rentcar.model.RentMember;

public class MemberDAOimpl implements MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void join(RentMember dto) {

	}

	@Override
	public List<RentMember> memList() {
		return null;
	}

	@Override
	public RentMember myList(String id) {
		return null;
	}

	@Override
	public RentMember getMember(RentMember dto) {
		return sqlSession.selectOne("Member.getMember",dto);
	}

	@Override
	public void delete(String id) {

	}

	@Override
	public void modify(RentMember dto) {

	}

	@Override
	public RentMember idCheck(String id) {
		return sqlSession.selectOne("Member.idCheck",id);
	}

	@Override
	public int batch(List<RentMember> list) {
		return 0;
	}

	@Override
	public String findId(String email) {
		return sqlSession.selectOne("member.findId",email);
	}

	@Override
	public int findPw(RentMember dto) {
		return sqlSession.update("member.findPw",dto);
	}

}
