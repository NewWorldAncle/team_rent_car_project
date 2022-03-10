package org.vision.rentcar.serviceBoard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.BoardDAO;
import org.vision.rentcar.model.RentBoard;
import org.vision.rentcar.serviceMember.Constant;

public class BoardModifyViewService implements ServiceBoard {
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int num = Integer.parseInt(request.getParameter("num"));
		RentBoard dto = dao.boardView(num);
		model.addAttribute("modifyView",dto);
	}

}
