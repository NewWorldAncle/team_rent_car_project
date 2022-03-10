package org.vision.rentcar.serviceBoard;

import java.util.List;

import org.vision.rentcar.model.Criteria;
import org.vision.rentcar.model.RentBoard;

public interface ServicePage {
	public List<RentBoard> list() throws Exception;
	public List<RentBoard> listPage(Criteria cri) throws Exception;
	public int listCount() throws Exception;
}
