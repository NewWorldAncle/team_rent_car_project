package org.vision.rentcar.serviceReserve;

import java.util.List;

import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.SearchCriteria;


public interface SearchService  {
	
	public List<RentReserve> selectAll(SearchCriteria scri) throws Exception;
}
