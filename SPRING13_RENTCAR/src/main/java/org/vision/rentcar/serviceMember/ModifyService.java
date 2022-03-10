package org.vision.rentcar.serviceMember;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

@Service
public class ModifyService implements ServiceMember{
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		RentMember dto = new RentMember();
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setAge(request.getParameter("age"));
		dto.setJob(request.getParameter("job"));
		dto.setHobby(request.getParameter("hobby"));
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.modify(dto);
	}
		
}
