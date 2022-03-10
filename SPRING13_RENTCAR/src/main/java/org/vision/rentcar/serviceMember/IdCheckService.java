package org.vision.rentcar.serviceMember;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

@Service
public class IdCheckService implements ServiceCheck {
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public RentMember check(String id) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.idCheck(id);
	}

//============================================================================
//							미	사	용	영	역
//============================================================================
	@Override
	public String execute(HttpServletResponse response, String email) throws Exception {
		return null;
	}

	@Override
	public void execute2(HttpServletResponse response, RentMember dto) throws Exception {}

	@Override
	public void send(RentMember dto, String div) throws Exception {}

}
