package kr.happyjob.study.mypqnal.model;

import java.sql.Date;


public class mypqnalModel {

	
	
	public String getQna_no() {
		return qna_no;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
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

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getLogic_path() {
		return logic_path;
	}

	public void setLogic_path(String logic_path) {
		this.logic_path = logic_path;
	}

	public String getPhysic_path() {
		return physic_path;
	}

	public void setPhysic_path(String physic_path) {
		this.physic_path = physic_path;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getExten() {
		return exten;
	}

	public void setExten(String exten) {
		this.exten = exten;
	}

	public String getUser_Type() {
		return user_Type;
	}

	public void setUser_Type(String user_Type) {
		this.user_Type = user_Type;
	}

	private String qna_no;
	private int user_no;
	private String loginID;		
	private String qna_content;
	private Date qna_uploaddate;
	private String qna_uploader;
	private String qna_title;
	
	
	
	private int file_no;
	private String file_name;
	private String logic_path;
	private String physic_path;
	private int file_size;
	private String exten;

	private String user_Type;
	
	
}
