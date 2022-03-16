package org.vision.rentcar;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.dao.CarDAO;
import org.vision.rentcar.dao.ReserveDAO;
import org.vision.rentcar.model.PageMaker;
import org.vision.rentcar.model.RentCar;
import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.RentReserveView;
import org.vision.rentcar.model.SearchCriteria;
import org.vision.rentcar.serviceMember.Constant;
import org.vision.rentcar.serviceReserve.InfoUpdateService;
import org.vision.rentcar.serviceReserve.RegisterService;
import org.vision.rentcar.serviceReserve.ServiceReserve;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/reserve/*")
public class ReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	private SqlSession sqlSession;
	private CarDAO cdao;
	private ReserveDAO dao;
	private ServiceReserve service;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
		cdao = sqlSession.getMapper(CarDAO.class);
		dao = sqlSession.getMapper(ReserveDAO.class);
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("ReserveController 진입. The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/catalog", method = RequestMethod.GET)
	public String catalog(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception  {	//전체 명단
		model.addAttribute("catalog", dao.selectAll(scri));
		logger.info("catalog 실행.");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/reserve/catalog";	//catalog.jsp 실행
	}
	
	@RequestMapping("allList")	//전체 예약 목룍
	public String allList(HttpServletRequest request,Model model) throws Exception {
		List<RentReserveView> list = dao.selectAllViewData();
		model.addAttribute("allViewData", list);
		logger.info("allList 실행.");
		return "/reserve/allList";
	}
	
	@RequestMapping("byMemList")	//유저별 예약 목록
	public String byMemList(HttpServletRequest request,Model model) throws Exception {
		HttpSession session = request.getSession();
		String memid = (String) session.getAttribute("id");
		List<RentReserveView> list = dao.selectViewData(memid);
		model.addAttribute("id", memid);
		model.addAttribute("viewData", list);
		logger.info("byMemList 실행.");
		return "/reserve/byMemList";
	}

	@RequestMapping("/delete1")
	public String reserveDelete1(HttpServletRequest request) throws Exception {
		dao.delete(Integer.parseInt(request.getParameter("regno")));
		logger.info("reseveDelete1 실행.");
		return "redirect:byMemList";
	}
	
	@RequestMapping("/delete2")
	public String reserveDelete2(HttpServletRequest request) throws Exception {
		dao.delete(Integer.parseInt(request.getParameter("regno")));
		logger.info("reseveDelete2 실행.");
		return "redirect:byMemList";
	}
	
	//예약 단계 1 - 예약준비
	@RequestMapping(value="/regAction",method=RequestMethod.GET)
	public String regAction(HttpServletRequest request,Model model) throws Exception {
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("id");
		int no = Integer.parseInt(request.getParameter("no"));
		RentCar dto = cdao.selectByNo(no);
		model.addAttribute("no",no);
		model.addAttribute("memid",memid);
		model.addAttribute("dto",dto);
		logger.info("regAction 실행.");
		return "/reserve/regForm";
	}
	
	//예약 단계 2 - DB등록
	@RequestMapping("regOk")
	public String regOk(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("request", request);
		service = new RegisterService();
		service.execute(model);
		logger.info("regOk 실행.");
		return "/reserve/result";
	}
	
	@RequestMapping("infoView")
	public String infoView(Model model, HttpServletRequest request) throws Exception {
		int regno = Integer.parseInt(request.getParameter("regno"));
		RentReserveView view = dao.selectEtc(regno);
		RentReserve dto = dao.select(regno);
		model.addAttribute("detailView", view);
		model.addAttribute("detailDto", dto);
		logger.info("infoView 실행.");
		return "/reserve/infoView";
	}
	
	@RequestMapping("/infoUp")
	public String infoUp(Model model, HttpServletRequest request,RentReserveView dto) throws Exception {
		model.addAttribute("request", request);
		service = new InfoUpdateService();
		service.execute(model);
		logger.info("infoUp 실행.");
		return "redirect:/reserve/byMemList?memid="+dto.getMemid();
	}

}
