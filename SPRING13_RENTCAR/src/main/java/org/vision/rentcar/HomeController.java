package org.vision.rentcar;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.dao.BoardDAO;
import org.vision.rentcar.dao.CarDAO;
import org.vision.rentcar.dao.VisitorDAO;
import org.vision.rentcar.model.RentVisitor;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired	
	public SqlSession SqlSession; 
	
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String main(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		//BoardDAO dao = SqlSession.getMapper(BoardDAO.class);
		
		//model.addAttribute("serverTime", dao.list());
		
		return "home";
	}
	
	@RequestMapping(value = "/admin/pageAnalyze")
	public String adminInsite(Locale locale, Model model) {
		logger.info("pageAnalyze 실행", locale);
		
		VisitorDAO dao = SqlSession.getMapper(VisitorDAO.class);
		List<String> list = dao.selectVisitorDate();
		List<String> blist = dao.selectVisitorBrowser();
		List<String> sendList = new ArrayList<String>();
		List<String> bsendList = new ArrayList<String>();
		for(String x : list) {	
			sendList.add("'"+x+"'");
		}
		for(String x : blist) {
			bsendList.add("'"+x+"'");
		}
		System.out.println(dao.selectVisitorNum());
		model.addAttribute("visitorDate",sendList);
		model.addAttribute("visitorNum",dao.selectVisitorNum());
		model.addAttribute("visitorBrowser",bsendList);
		model.addAttribute("visitorNum",dao.selectVisitorBNum());
		System.out.println(bsendList.toString()+"브라우저");
		System.out.println(dao.selectVisitorBNum().toString()+"브라우저 횟수");
		return "/admin/pageAnalyze";
	}
	@RequestMapping("*/logout")
	public String logout(HttpSession session) {
		session.invalidate();	//세션 제거
		System.out.println("로그아웃 성공.");
		return "redirect:/";
	}
	
//	@RequestMapping("/carmain")
//	public String carTest(Model model){
//		
//		CarDAO dao = SqlSession.getMapper(CarDAO.class);
//		model.addAttribute("carDAO", dao.list());
//		System.out.println(dao.list().toString());
//		return "carmain";
//		
//	}
//	
//	@RequestMapping(value = {"/boardmain"})
//	public String boardTest(Locale locale, Model model) throws Exception {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		BoardDAO dao = SqlSession.getMapper(BoardDAO.class);
//		
////		model.addAttribute("serverTime", dao.list());
//		
//		return "boardmain";
//	}
}
