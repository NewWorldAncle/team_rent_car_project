package org.vision.rentcar.serviceReserve;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.dao.ReserveDAO;
import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.SearchCriteria;
import org.vision.rentcar.serviceMember.Constant;

public class SearchServiceimpl implements SearchService{
	private SqlSession sqlSession = Constant.sqlSession;	
	
	@Override
	public List<RentReserve> selectAll(SearchCriteria scri) throws Exception {
		ReserveDAO dao = sqlSession.getMapper(ReserveDAO.class);	
	return dao.selectAll(scri);
}
}