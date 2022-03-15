package org.vision.rentcar.serviceBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.dao.BoardDAO;
import org.vision.rentcar.model.RentBoard;
import org.vision.rentcar.model.SearchCriteria;
import org.vision.rentcar.serviceMember.Constant;

public class BoardPageService implements ServicePage {
	private SqlSession sqlSession = Constant.sqlSession;
	
	@Override
	public List<RentBoard> listPage(SearchCriteria scri) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.listPage(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.listCount(scri);
	}

}
