package org.vision.rentcar.dao;

import java.util.List;

import org.vision.rentcar.model.Criteria;
import org.vision.rentcar.model.RentBoard;

public interface BoardDAO {
	public RentBoard boardView(final int num) throws Exception;	//게시글 보기
	//게시글 작성(글번호 자동기입,작성자, 작성자이메일, 제목, 비밀번호, 내용)
	public void write(final String writer,final String email,final String subject,final String password,final String content) throws Exception;
	public List<RentBoard> list() throws Exception;	//게시판 불러오기
	//게시글 수정(글번호, 작성자, 작성자메일, 제목, 비밀번호, 내용)
	public void modify(final int num,final String email,final String subject,final String password,final String content) throws Exception;
	public void delete(final int num) throws Exception;	//게시글 삭제
	//댓글달기(게시글 목록에 표시되는 댓글)
	public void reply(final int num,final String writer,final String email,final String subject,final String password,final int ref,final int re_step,final int re_level,final String content) throws Exception;
	public void replyView(final int num) throws Exception;	//게시글의 댓글보기
	public void upHit(final int num) throws Exception;	//조회수 증가
	
	/*
	 * 오라클DB 페이징 처리
	 */
	public List<RentBoard> listPage(Criteria cri) throws Exception;
	public int listCount() throws Exception;

	/*
	 * 테스트용
	 */
	public int whatNum();	//시퀀스 현재 값 읽기
}
