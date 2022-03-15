package org.vision.rentcar.serviceBoard;

import java.util.List;

import org.vision.rentcar.model.RentBoard;
import org.vision.rentcar.model.SearchCriteria;

public interface ServicePage {
	public List<RentBoard> listPage(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
