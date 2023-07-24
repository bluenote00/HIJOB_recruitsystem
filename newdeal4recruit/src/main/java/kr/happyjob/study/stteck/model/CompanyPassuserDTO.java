package kr.happyjob.study.stteck.model;




public class CompanyPassuserDTO {

	
	public int getAppli_no() {
		return appli_no;
	}
	public void setAppli_no(int appli_no) {
		this.appli_no = appli_no;
	}
	public int getCorecruit_no() {
		return corecruit_no;
	}
	public void setCorecruit_no(int corecruit_no) {
		this.corecruit_no = corecruit_no;
	}

	
	public String getUser_coname() {
		return user_coname;
	}
	public void setUser_coname(String user_coname) {
		this.user_coname = user_coname;
	}

	
	private int appli_no;
	private int corecruit_no;
	private String user_coname;
	
	public CompanyPassuserDTO(CompanyPassuserVO vo){
		this.appli_no = vo.getAppli_no();
		this.corecruit_no = vo.getCorecruit_no();
		this.user_coname = vo.getUser_coname();
				
		
	}
	
	
	
	
	
}
