package kr.happyjob.study.stteck.model;


public class SessionApplyuserDTO {

	public int session_code;
	public int getSession_code() {
		return session_code;
	}
	public void setSession_code(int session_code) {
		this.session_code = session_code;
	}
	public int getApplycnt() {
		return applycnt;
	}
	public void setApplycnt(int applycnt) {
		this.applycnt = applycnt;
	}
	public int applycnt;
	
	public SessionApplyuserDTO( SessionApplyuserVO vo){
		
		this.applycnt = vo.getApplycnt();
		this.session_code = vo.getSession_code();
		
		
	}
	
}
