package org.visoin.rentcar;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.visoin.rentcar.dao.BoardDAO;
import org.visoin.rentcar.dao.CarDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired	
	public SqlSession SqlSession; 
	
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		BoardDAO dao = SqlSession.getMapper(BoardDAO.class);
		
		model.addAttribute("serverTime", dao.list());
		
		return "home";
	}
	
	@RequestMapping("/carmain")
	public String carTest(Model model){
		
		CarDAO dao = SqlSession.getMapper(CarDAO.class);
		model.addAttribute("carDAO", dao.list());
		System.out.println(dao.list().toString());
		return "carmain";
		
	}
	
	@RequestMapping(value = {"/boardmain"})
	public String boardTest(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		BoardDAO dao = SqlSession.getMapper(BoardDAO.class);
		
		model.addAttribute("serverTime", dao.list());
		
		return "boardmain";
	}
}
