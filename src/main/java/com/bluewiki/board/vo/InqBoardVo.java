package com.bluewiki.board.vo;

import java.sql.Date;
import java.sql.Time;

public class InqBoardVo {

	private int inqNo;
	private String inqContent;
	private Date inqDate;
	private Time inqTime;
	private String reqMemId; // 수정요청자
	private String title;
	private int brdNo;

	public int getInqNo() {
		return inqNo;
	}
	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}
	public String getInqContent() {
		return inqContent;
	}
	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}
	public Date getInqDate() {
		return inqDate;
	}
	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}
	public Time getInqTime() {
		return inqTime;
	}
	public void setInqTime(Time inqTime) {
		this.inqTime = inqTime;
	}
	public String getReqMemId() {
		return reqMemId;
	}
	public void setReqMemId(String reqMemId) {
		this.reqMemId = reqMemId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBrdNo() {
		return brdNo;
	}
	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

}
