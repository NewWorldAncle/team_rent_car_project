package org.vision.rentcar;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.vision.rentcar.dao.BoardDAO;
import org.vision.rentcar.model.Criteria;
import org.vision.rentcar.model.PageMaker;
import org.vision.rentcar.model.RentBoard;
import org.vision.rentcar.serviceBoard.BoardModifyService;
import org.vision.rentcar.serviceBoard.BoardModifyViewService;
import org.vision.rentcar.serviceBoard.BoardPageService;
import org.vision.rentcar.serviceBoard.BoardViewService;
import org.vision.rentcar.serviceBoard.BoardWriteService;
import org.vision.rentcar.serviceBoard.ServiceBoard;
import org.vision.rentcar.serviceBoard.ServicePage;
import org.vision.rentcar.serviceMember.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private SqlSession sqlSession;
	private ServiceBoard service;
	private ServicePage service2;

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
		logger.info("BoardController 진입. The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping("/list")
	public String boardList(Model model) {
//		RentBoardDAO dao = sqlSession.getMapper(RentBoardDAO.class);
//		model.addAttribute("boardList", dao.list());
		logger.info("boardList 실행.");
		return "/board/list";	//boardList.jsp 실행 
	}

	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception {
		logger.info("boardListPage 실행.");
		service2 = new BoardPageService();
		List<RentBoard> list = service2.listPage(cri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service2.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping("/view")
	public String boardView(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("request", request);
		service = new BoardViewService();
		service.execute(model);
		logger.info("boardView 실행.");
		return "/board/view";
	}
	
	@RequestMapping("/write")
	public String boardWriteForm() {
		logger.info("boardWrite 실행.");
		return "/board/writeForm";
	}
	
	@RequestMapping("/writeOk")
	public String boardWriteOk(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("request", request);
		service = new BoardWriteService();
		service.execute(model);
		logger.info("boardWriteOk 실행.");
		return "redirect:listPage";
	}
	
	@RequestMapping("/delete")
	public String boardDelete(HttpServletRequest request) throws NumberFormatException, Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.delete(Integer.parseInt(request.getParameter("num")));
		logger.info("boardDelete 실행.");
		return "redirect:listPage";
	}
	
	@RequestMapping("/modify")
	public String boardModify(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("request", request);
		service = new BoardModifyViewService();
		service.execute(model);
		logger.info("boardModify 실행.");
		return "/board/modifyForm";
	}
	
	@RequestMapping("/modifyOk")
	public String boardModifyOk(HttpServletRequest request,Model model,RentBoard dto) throws Exception {
		model.addAttribute("request", request);
		service = new BoardModifyService();
		service.execute(model);
		logger.info("boardModifyOk 실행.");
		return "redirect:/board/view?num="+dto.getNum();
	}

}
