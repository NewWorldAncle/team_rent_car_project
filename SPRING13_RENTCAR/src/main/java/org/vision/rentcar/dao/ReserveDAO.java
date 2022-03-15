package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentReserve;
import org.vision.rentcar.model.RentReserveView;
import org.vision.rentcar.model.SearchCriteria;

public interface ReserveDAO {
	
	public int insert(RentReserve dto) throws Exception;
	//차량 전체 목록
	public List<RentReserve> selectAll(SearchCriteria scri) throws Exception;
	//아이디 별 예약 결과 확인(유저용)
	public List<RentReserveView> selectViewData(String memid) throws Exception;
	//전체 예약 결과 확인(관리자용)
	public List<RentReserveView> selectAllViewData() throws Exception;
	//업데이트 시 정보 불러오기
	public RentReserveView selectEtc(int regno) throws Exception;
	public RentReserve select(int regno) throws Exception;
	public void update(RentReserve dto) throws Exception;
	public int delete(int regno) throws Exception;
	
}
