package kr.happyjob.study.mngbmg.model;

import java.util.Date;

public class MngBmgModel {

	
	/** Q&A 테이블 */
	
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_uploaddate() {
		return qna_uploaddate;
	}
	public void setQna_uploaddate(Date qna_uploaddate) {
		this.qna_uploaddate = qna_uploaddate;
	}
	public String getQna_uploader() {
		return qna_uploader;
	}
	public void setQna_uploader(String qna_uploader) {
		this.qna_uploader = qna_uploader;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	private int qna_no;
	private int user_no;
	private String qna_title;
	private String qna_content;
	private Date qna_uploaddate;
	private String qna_uploader;
	private String qna_status;

	private String loginID;
	private String name;
	
}