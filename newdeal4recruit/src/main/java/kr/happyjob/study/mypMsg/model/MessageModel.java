package kr.happyjob.study.mypMsg.model;

import java.sql.Date;

public class MessageModel {

	private String loginID;
	private int msg_no;
	private Date msg_date;
	private String msg_title;
	private String msg_content;
	private String msg_sendID;
	private String msg_receiveID;
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_sendID() {
		return msg_sendID;
	}
	public void setMsg_sendID(String msg_sendID) {
		this.msg_sendID = msg_sendID;
	}
	public String getMsg_receiveID() {
		return msg_receiveID;
	}
	public void setMsg_receiveID(String msg_receiveID) {
		this.msg_receiveID = msg_receiveID;
	}

	
}
