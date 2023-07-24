package kr.happyjob.study.expnmg.model;

import java.util.Date;

public class ExpNmgModel {
	


	public String getNotice_del_yn() {
		return notice_del_yn;
	}
	public void setNotice_del_yn(String notice_del_yn) {
		this.notice_del_yn = notice_del_yn;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_uploaddate() {
		return notice_uploaddate;
	}
	public void setNotice_uploaddate(Date notice_uploaddate) {
		this.notice_uploaddate = notice_uploaddate;
	}
	public String getNotice_uploader() {
		return notice_uploader;
	}
	public void setNotice_uploader(String notice_uploader) {
		this.notice_uploader = notice_uploader;
	}
	public int getAtt_no() {
		return att_no;
	}
	public void setAtt_no(int att_no) {
		this.att_no = att_no;
	}
	public String getAtt_name() {
		return att_name;
	}
	public void setAtt_name(String att_name) {
		this.att_name = att_name;
	}
	public String getAtt_phypath() {
		return att_phypath;
	}
	public void setAtt_phypath(String att_phypath) {
		this.att_phypath = att_phypath;
	}
	public String getAtt_logpath() {
		return att_logpath;
	}
	public void setAtt_logpath(String att_logpath) {
		this.att_logpath = att_logpath;
	}
	public int getAtt_size() {
		return att_size;
	}
	public void setAtt_size(int att_size) {
		this.att_size = att_size;
	}
	public String getAtt_extname() {
		return att_extname;
	}
	public void setAtt_extname(String att_extname) {
		this.att_extname = att_extname;
	}
	private String notice_del_yn;
	private String loginID;
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_uploaddate;
	private String notice_uploader;
	
	//첨부파일
	private int att_no;
	private String att_name;
	private String att_phypath;
	private String att_logpath;
	private int att_size;
	private String att_extname;
	
	
	
	
}