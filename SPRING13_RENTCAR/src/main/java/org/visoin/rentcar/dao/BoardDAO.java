package org.visoin.rentcar.dao;

import java.util.List;

import org.visoin.rentcar.model.RentBoard;

public interface BoardDAO {
	public void write(RentBoard dto); // insert
	public RentBoard contentView(int num); //게시글 보기용
	public List<RentBoard> list(); //select all
	public void modify(RentBoard dto);
	public void delete(int num);
	public void reply(RentBoard dto);
	public RentBoard reply_view(int num); // 댓글보기
	public void upHit(int num); //히트수 증가 시키기
}
