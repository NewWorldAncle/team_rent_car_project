package org.vision.rentcar.serviceMember;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.vision.rentcar.dao.MemberDAO;
import org.vision.rentcar.model.RentMember;

public class FindPwService implements ServiceCheck {
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute2(HttpServletResponse response, RentMember dto) throws Exception {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//아이디 없을 때
		if(dao.idCheck(dto.getId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		//가입에 사용한 이메일이 아닐 때
		else if(!dto.getEmail().equals(dao.idCheck(dto.getId()).getEmail())) {
			out.print("등록되지 않거나 다른 이메일입니다.");
			out.close();
		} else {
			//임시 비밀번호 생성
			String pass = "";
			for(int i=0; i<12; i++) {
				pass += (char) ((Math.random()*26)+97);
			}
			dto.setPass(pass);
			//비밀번호 변경
			dao.findPw(dto);
			//비밀번호 변경 메일 발송
			send(dto,"findPw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	@Override
	public void send(RentMember dto, String div) throws Exception {
		/*
		 * 네이버 메일을 기준으로 작성하였으므로, 네이버 메일에서 작동하는것을 적극 권장함.
		 */
		
		//메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "(이메일을 기입해주세요)";	//보내는 사람 이메일 주소
		String hostSMTPpwd = "(비밀번호를 기입해주세요)";	//보내는 사람 이메일 비밀번호
		
		//보내는 사람 이메일, 제목, 내용
		String fromEmail = "(이메일을 기입해주세요)";	//보내는 사람 이메일 주소(받는 사람 이메일에 표시)
		String fromName = "Spring Homepage";	//받는 사람이 보는 이름
		String subject = "";
		String msg = "";
		
		if(div.equals("findPw")	) {
			//회원가입 메일 내용
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += dto.getId() + "님의 임시 비밀번호 입니다. 로그인 후 마이페이지에서 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : " +dto.getPass()+ "</p></div>";
		}
		
		String mail = dto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패 : "+ e);
		}
	}

//============================================================================
//								미	사	용	영	역
//============================================================================
	@Override
	public String execute(HttpServletResponse response, String email) throws Exception {
		return null;
	}

	@Override
	public RentMember check(String id) {
		return null;
	}

}
