package org.visoin.rentcar.dao;

import java.util.List;

import org.visoin.rentcar.model.RentReserve;

public interface ReserveDAO {
	
	public int insert(RentReserve dto);
	public RentReserve select(int rentno);
	public List<RentReserve> selectAll();
	public int update(RentReserve dto);
	public int delete(int rentno);
	
}
