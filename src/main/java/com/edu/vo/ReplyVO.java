package com.edu.vo;

import java.util.Date;

/**
 * 이 클래스는 댓글 입출력 처리시 임시저장에 사용되는 변수와 메서드를 포함.
 * @author 김일국
 *
 */
public class ReplyVO {
	Integer rno;//자동증가 고유번호
	String reply_text;
	String replyer;//로그인한 ID가 자동으로 들어갈 예정
	Date reg_date;
	Date update_date;
	Integer bno;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
}
