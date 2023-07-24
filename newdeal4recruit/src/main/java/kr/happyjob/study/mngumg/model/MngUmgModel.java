package kr.happyjob.study.mngumg.model;

import java.util.Date;

public class MngUmgModel {
	
	
	public int getBlacklist_number() {
		return blacklist_number;
	}
	public void setBlacklist_number(int blacklist_number) {
		this.blacklist_number = blacklist_number;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getBlacklist_date() {
		return blacklist_date;
	}
	public void setBlacklist_date(String blacklist_date) {
		this.blacklist_date = blacklist_date;
	}
	public String getBlacklist_usertype() {
		return blacklist_usertype;
	}
	public void setBlacklist_usertype(String blacklist_usertype) {
		this.blacklist_usertype = blacklist_usertype;
	}
	private String loginID;
	private String blacklist_date;
	private String blacklist_usertype;
	private int blacklist_number;
		
}
