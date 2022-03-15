package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.RentMember;

public interface MemberDAO {
	public void join(RentMember dto);	//회원가입
	public List<RentMember> memList();	//회원명단(관리자용)
	public RentMember myList(String id);	//회원정보(회원용)
	public RentMember getMember(RentMember dto);	//로그인 세션활용
	//회원삭제(관리자용은 회원명단에서, 회원은 회원정보에서)
	public void delete(String id);
	//회원 정보 수정(관리자용은 회원명단에서, 회원용은 회원정보에서)
	public void modify(RentMember dto);
	public RentMember idCheck(String id); //아이디 중복체크
	public int batch(List<RentMember> list);	//아이디 배치(다수의 아이디 가입)처리
	//찾기 기능
	public String findId(String email);	//아이디
	public int findPw(RentMember dto);	//임시 비밀번호 발급
}
