package org.vision.rentcar.serviceMember;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

@Service
public class loginService implements ServiceMember {
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpSession session = (HttpSession) map.get("session");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		String returnURL = "";
		
		//이미 로그인 되어있는 세션이라면 세션 제거하기
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		//기입한 정보 담기
		RentMember dto = new RentMember();
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		//기입한 정보 활용
		RentMember login = dao.getMember(dto);
		if(login != null) {	//로그인 성공!
			session.setAttribute("login", login);	//login을 login이라는 이름으로 세션에 세팅
			//콘솔창 알림 방법1
			System.out.println(dto.getId()+"로그인 성공.");
//			//콘솔창 알림 방법2
//			session.setAttribute("id", dto.getId()); //dto에 있는 id를 id라는 이름으로 세션에 세팅
//			System.out.println("$id 로그인성공");
			
			returnURL = "redirect:home";
		} else {	//로그인 실패!
			System.out.println("로그인 실패.");
			returnURL = "redirect:loginForm";
		}
	}

}
