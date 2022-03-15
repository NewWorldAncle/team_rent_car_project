package org.vision.rentcar.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.RentReserveView;
import org.vision.rentcar.model.SearchCriteria;
import org.vision.rentcar.serviceMember.Constant;

public class ReserveDAOimpl implements ReserveDAO {

	@Inject
	private SqlSession sqlSession = Constant.sqlSession;
	private static String namespace = "org.vision.rentcar.dao.ReserveDAO";
	
	@Override
	public List<RentReserve> selectAll(SearchCriteria scri) throws Exception {
		return sqlSession.selectList(namespace+".selectAll", scri);
	}

	@Override
	public int insert(RentReserve dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RentReserveView> selectViewData(String memid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RentReserveView> selectAllViewData() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RentReserveView selectEtc(int regno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RentReserve select(int regno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(RentReserve dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delete(int regno) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
