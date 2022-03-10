package org.vision.rentcar.serviceMember;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

@Service
public class JoinService implements ServiceMember{
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		RentMember dto = new RentMember();
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setAge(request.getParameter("age"));
		dto.setJob(request.getParameter("job"));
		dto.setHobby(request.getParameter("hobby"));
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.join(dto);
		
		//알림창 띄우기
		System.out.println("회원가입 성공!");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(
					"<script>"
							+ "alert('회원가입 성공하였습니다.');"
							+ "location.href='loginForm';"	//빼고 redirect로 하면 어떨지 확인해보기
							+ "</script>"
			);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
