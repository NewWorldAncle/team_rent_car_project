package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentMember;

public interface MemberDAO {

	public int insert(RentMember dto);
	public RentMember select(String id);
	public List<RentMember> selectAll();
	public int update(RentMember dto);
	public int delete(String id);
}
