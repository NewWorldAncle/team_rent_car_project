package org.vision.rentcar;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.dao.CarDAO;
import org.vision.rentcar.serviceCar.CarRegisterService;
import org.vision.rentcar.serviceCar.CarUpdateService;
import org.vision.rentcar.serviceCar.ServiceCar;
import org.vision.rentcar.serviceMember.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/car/*")
public class CarController {
	
	private static final Logger logger = LoggerFactory.getLogger(CarController.class);
	private SqlSession sqlSession;
	private ServiceCar service;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("CarController 진입. The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/carList")
	public String carList(Model model) {	//전체 명단
		CarDAO dao = sqlSession.getMapper(CarDAO.class);
		model.addAttribute("carList", dao.list());
		logger.info("carList 실행.");
		return "/car/carList";	//catalog.jsp 실행
	}
	
	@RequestMapping("/delete")
	public String carDelete(HttpServletRequest request) {
		CarDAO dao = sqlSession.getMapper(CarDAO.class);
		dao.delete(Integer.parseInt(request.getParameter("no")));
		logger.info("carDelete 실행.");
		return "redirect:carList";
	}
	
	@RequestMapping("/updateView")
	public String carUpdateView(Model model,HttpServletRequest request) {
		CarDAO dao = sqlSession.getMapper(CarDAO.class);
		model.addAttribute("carInfo", dao.selectByNo(Integer.parseInt(request.getParameter("no"))));
		logger.info("carUpdateView 실행.");
		return "/car/carUpdate";
	}
	
	@RequestMapping("/update")
	public String carUpdate(Model model,HttpServletRequest request) {
		model.addAttribute("request", request);
		service = new CarUpdateService();
		service.execute(model);
		logger.info("carUpdate 실행.");
		return "redirect:carList";
	}
	
	@RequestMapping("/register")
	public String register() {
		logger.info("register 실행.");
		return "/car/register";	//register.jsp 실행
	}
	
	@RequestMapping("/registerOk")
	public String registerOk(Model model,HttpServletRequest request,HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		service = new CarRegisterService();
		service.execute(model);
		logger.info("registerOk 실행.");
		return "redirect:carList";
	}
	
}
