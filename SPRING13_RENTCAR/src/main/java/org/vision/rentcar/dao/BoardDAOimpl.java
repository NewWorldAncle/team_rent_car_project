package org.vision.rentcar.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.model.Criteria;
import org.vision.rentcar.model.RentBoard;
import org.vision.rentcar.serviceMember.Constant;

public class BoardDAOimpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession = Constant.sqlSession;
	private static String namespace = "org.vision.rentcar.dao.BoardDAO";

	@Override
	public List<RentBoard> list() throws Exception {
		return sqlSession.selectList(namespace+".list");
	}
	
	@Override
	public List<RentBoard> listPage(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".listPage",cri);
	}
	
	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne(namespace+".listCount");
	}
	
//==========================================================================
//							미	사	용	영	역
//==========================================================================	
	@Override
	public RentBoard boardView(int num) throws Exception {
		return null;
	}

	@Override
	public void write(String writer, String email, String subject, String password, String content) throws Exception {
	}

	@Override
	public void modify(int num, String email, String subject, String password, String content) throws Exception {
	}

	@Override
	public void delete(int num) throws Exception {
	}

	@Override
	public void reply(int num, String writer, String email, String subject, String password, int ref, int re_step,
			int re_level, String content) throws Exception {
	}

	@Override
	public void replyView(int num) throws Exception {
	}

	@Override
	public void upHit(int num) throws Exception {
	}

	@Override
	public int whatNum() {
		return 0;
	}

}
