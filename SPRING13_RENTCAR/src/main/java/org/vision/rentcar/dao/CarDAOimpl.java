package org.vision.rentcar.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.model.RentCar;
import org.vision.rentcar.model.SearchCriteria;
import org.vision.rentcar.serviceMember.Constant;

public class CarDAOimpl implements CarDAO {
	@Inject
	private SqlSession sqlSession = Constant.sqlSession;
	private static String namespace = "org.vision.rentcar.dao.CarDAO";
	
	@Override
	public void insert(RentCar dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RentCar selectByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RentCar> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList(namespace+".list", scri);
	}

	@Override
	public void modify(RentCar dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub
		
	}

}
