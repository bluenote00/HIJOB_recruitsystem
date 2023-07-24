package kr.happyjob.study.stteck.model;



public class SessionCompanyDTO {


	private String user_coname;
	public String getUser_coname() {
		return user_coname;
	}
	public void setUser_coname(String user_coname) {
		this.user_coname = user_coname;
	}
	public int getTotal_cntcop() {
		return total_cntcop;
	}
	public void setTotal_cntcop(int total_cntcop) {
		this.total_cntcop = total_cntcop;
	}
	private int total_cntcop;
	
	
	
	
	
	
	public SessionCompanyDTO(SessionCompanyVO vo) {
		this.total_cntcop=vo.getTotal_cntcop();
//		this.session_code=vo.getSession_code();
		this.user_coname=vo.getUser_coname();
		
		

		
		
	}
}
