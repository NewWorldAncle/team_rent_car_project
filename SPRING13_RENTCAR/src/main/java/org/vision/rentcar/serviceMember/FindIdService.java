package org.vision.rentcar.serviceMember;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

public class FindIdService implements ServiceCheck {
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public String execute(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		PrintWriter out = response.getWriter();
		String id = dao.findId(email);
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
//============================================================================
//								미	사	용	영	역
//============================================================================
	@Override
	public RentMember check(String id) {
		return null;
	}

	@Override
	public void execute2(HttpServletResponse response, RentMember dto) throws Exception {}

	@Override
	public void send(RentMember dto, String div) throws Exception {}
}
