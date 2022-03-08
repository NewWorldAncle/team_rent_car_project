package org.visoin.rentcar.dao;

import java.util.List;

import org.visoin.rentcar.model.RentMember;

public interface MemberDAO {

	public int insert(RentMember dto);
	public RentMember select(String id);
	public List<RentMember> selectAll();
	public int update(RentMember dto);
	public int delete(String id);
}
