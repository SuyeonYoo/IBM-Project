package com.bluewiki.board.vo;

import java.util.Date;

public class BoardVo {
	
	int no;
	String title;
	String content;
	int state;
	Date reg_date;
	Date reg_time;
	String sec_state;
	String writer;
	int cnt_like;
	String third_cate_id;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getReg_time() {
		return reg_time;
	}
	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}
	public String getSec_state() {
		return sec_state;
	}
	public void setSec_state(String sec_state) {
		this.sec_state = sec_state;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCnt_like() {
		return cnt_like;
	}
	public void setCnt_like(int cnt_like) {
		this.cnt_like = cnt_like;
	}
	public String getThird_cate_id() {
		return third_cate_id;
	}
	public void setThird_cate_id(String third_cate_id) {
		this.third_cate_id = third_cate_id;
	}

}
