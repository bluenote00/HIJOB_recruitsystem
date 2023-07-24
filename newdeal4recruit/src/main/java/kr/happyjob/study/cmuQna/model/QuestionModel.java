package kr.happyjob.study.cmuQna.model;

public class QuestionModel {
	   
	private int qna_no;
	private int user_no;
	private String loginID;
	private String qna_content;
	private String qna_uploaddate;
	private String qna_uploader;
	private String qna_title;
	private String name;
	private String user_coname;

	

	
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
	public String getQna_uploaddate() {
		return qna_uploaddate;
	}
	public void setQna_uploaddate(String qna_uploaddate) {
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
	public String getUser_coname() {
		return user_coname;
	}
	public void setUser_coname(String user_coname) {
		this.user_coname = user_coname;
	}
	
}
