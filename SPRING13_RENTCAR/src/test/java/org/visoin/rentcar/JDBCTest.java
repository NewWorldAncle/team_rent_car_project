package org.visoin.rentcar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.vision.rentcar.dao.CarDAO;
import org.vision.rentcar.model.RentCar;

//spring-test 사용

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

public class JDBCTest {
	@Autowired
	private SqlSession sqlSession;
	private CarDAO dao;

	@Before
	public void init() {
		System.out.println("start test...");
		dao = sqlSession.getMapper(CarDAO.class);
	}

	@Test
	public void connectionTest(){
		List<RentCar> list = dao.list();
		System.out.println(list);
	}

	@After
	public void tearDown() {
		System.out.println("bye~~~~~~~~");
	}
}