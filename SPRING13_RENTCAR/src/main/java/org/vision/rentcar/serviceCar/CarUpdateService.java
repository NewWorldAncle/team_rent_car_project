package org.vision.rentcar.serviceCar;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.CarDAO;
import org.vision.rentcar.model.RentCar;
import org.vision.rentcar.serviceMember.Constant;

public class CarUpdateService implements ServiceCar {
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		RentCar dto = new RentCar();
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setName(request.getParameter("name"));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setUsepeople(Integer.parseInt(request.getParameter("usepeople")));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setCompany(request.getParameter("company"));
		dto.setImg(request.getParameter("img"));
		dto.setInfo(request.getParameter("info"));
		
		CarDAO dao = sqlSession.getMapper(CarDAO.class);
		dao.modify(dto);
	}

}
