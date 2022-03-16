package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentCar;
import org.vision.rentcar.model.SearchCriteria;

public interface CarDAO {
	public void insert(RentCar dto);
	public RentCar selectByNo(int no);
	public List<RentCar> list(SearchCriteria scri) throws Exception;
	public void modify(RentCar dto);
	public void delete(int no);
}
