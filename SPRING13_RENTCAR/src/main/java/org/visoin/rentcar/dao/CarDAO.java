package org.visoin.rentcar.dao;

import java.util.List;

import org.visoin.rentcar.model.RentCar;

public interface CarDAO {
	public void insert(RentCar dto);
	public RentCar selectByNo(int no);
	public List<RentCar> list();
	public void modify(RentCar dto);
	public void delete(int no);
}
