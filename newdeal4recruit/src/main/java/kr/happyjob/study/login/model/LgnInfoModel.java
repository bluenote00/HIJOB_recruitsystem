package kr.happyjob.study.login.model;


public class LgnInfoModel {

	
	//로그인 ID
	private String loginID;
	
	//비밀번호
	private String password;
	
	//승인 코드
	private String user_status;
	
	// 사용자 로그인 ID
	private String lgn_id;
	
	// 사용자 로그인 PW
	private String pwd;
	
	// 사용자 시스템 ID
	private String usr_sst_id;
	
	// 사용자 성명
	private String usr_nm;
	
	// 로그린 사용자 권란       mng: 관리자       gnr: 일반
	private String mem_author;
	
	private String  user_businesstype;
	
	private String user_coname;

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getLgn_id() {
		return lgn_id;
	}

	public void setLgn_id(String lgn_id) {
		this.lgn_id = lgn_id;
	}
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getUsr_sst_id() {
		return usr_sst_id;
	}

	public void setUsr_sst_id(String usr_sst_id) {
		this.usr_sst_id = usr_sst_id;
	}

	public String getUsr_nm() {
		return usr_nm;
	}

	public void setUsr_nm(String usr_nm) {
		this.usr_nm = usr_nm;
	}

	public String getMem_author() {
		return mem_author;
	}

	public void setMem_author(String mem_author) {
		this.mem_author = mem_author;
	}

	public String getUser_businesstype() {
		return user_businesstype;
	}

	public void setUser_businesstype(String user_businesstype) {
		this.user_businesstype = user_businesstype;
	}

	public String getUser_coname() {
		return user_coname;
	}

	public void setUser_coname(String user_coname) {
		this.user_coname = user_coname;
	}

}


