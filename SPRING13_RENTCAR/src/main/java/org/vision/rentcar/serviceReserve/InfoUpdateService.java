package org.vision.rentcar.serviceReserve;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.vision.rentcar.dao.ReserveDAO;
import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.serviceMember.Constant;

public class InfoUpdateService implements ServiceReserve {
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public void execute(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReserveDAO dao = sqlSession.getMapper(ReserveDAO.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int dday = Integer.parseInt(request.getParameter("dday"));
		String rday = request.getParameter("rday");
		int insurance =Integer.parseInt(request.getParameter("insurance")); 
		int wifi = Integer.parseInt(request.getParameter("wifi"));
		int navigation = Integer.parseInt(request.getParameter("navigation"));
		int babyseat = Integer.parseInt(request.getParameter("babyseat"));
		String memid = request.getParameter("memid");
		
		RentReserve dto = new RentReserve();
		dto.setNo(no);
		dto.setQty(qty);
		dto.setDday(dday);
		dto.setRday(rday);
		dto.setInsurance(insurance);
		dto.setWifi(wifi);
		dto.setNavigation(navigation);
		dto.setBabyseat(babyseat);
		dto.setMemid(memid);
		
		// 예약결과 화면 및 계산시 사용
		String img = request.getParameter("img");
		int price = Integer.parseInt(request.getParameter("price"));
		int cost =(dday*price*qty)
				+(insurance*10000 * dday * qty)
				+(wifi*10000 * dday * qty)
				+(babyseat*5000 * qty);
	
		model.addAttribute("reserveDTO",dto);
		model.addAttribute("price",price);
		model.addAttribute("img",img);
		model.addAttribute("cost",cost);
		
		dao.update(dto);
	}

}
