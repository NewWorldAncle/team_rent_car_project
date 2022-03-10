package org.vision.rentcar.serviceMember;

import javax.servlet.http.HttpServletResponse;

import org.vision.rentcar.model.RentMember;

public interface ServiceCheck {
	//아이디 체크
	public RentMember check(String id);
	//아이디 찾기
	public String execute(HttpServletResponse response, String email) throws Exception;
	//이메일 전송
	public void send(RentMember dto, String div) throws Exception;
	//비밀번호 찾기
	public void execute2(HttpServletResponse response, RentMember dto) throws Exception;
}
