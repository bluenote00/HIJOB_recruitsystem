package kr.happyjob.study.dashboard.model;

import java.util.Date;
import java.util.List;

public class DashboardModel {

	private String loginID;
	private String user_type;
	private String pro_no;
	private String reg_date;
	
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	/** 기업 공고 리스트 추가 - 조아라 **/

	// 기업공고 테이블
	private int corecruit_no;
	private int user_no;
	private int session_code;
	private String corecruit_title;
	private String corecruit_strdate;
	private String corecruit_enddate;
	private String corecruit_zipcode;
	private String corecruit_address1;
	private String corecruit_address2;
	private String corecruit_mapapi;
	private String corecruit_mainjob;
	private String corecruit_requirement;
	private String corecruit_preference;
	private String corecruit_etc;
	private String corecruit_merit;
	private String corecruit_introduce;
	private String like_yn;

	// 유저 정보
	private String name;
	private String user_businesstype;
	private String user_coname;
	private String user_rpname;
	private String user_regdate;	

	//공고 기술 스택 테이블
	private String dtlcodeCD;
	private String detail_name;

	// 지역 대분류 테이블
	private int city1_no;
	private String city1_name;

	// 지역 중분류 테이블
	private int city2_no;
	private String city2_name;

	// 첨부파일 테이블
	private int att_no;
	private String att_name;
	private String att_phypath;
	private String att_logpath;
	private int att_size;
	private String att_extname;

	// 댓글 테이블
	private int comm_no;
	private int org_no;
	private String comm_divider;
	private String comm_content;

	// 이력서정보 테이블
	private int resume_no;
	private String resume_devjob;
	private String stackCD;

	// 지원정보 테이블
	private int appli_no;
	private String applyCD;
	private Date appli_procdate;
	List<DashboardModel> skillist;
	
	// 쪽지 테이블
	private String msg_title;
	private String msg_content;
	private String msg_receiveID;
	
	// 이력서 정보 테이블
	

		
		
		private String skill1;
		



		private String skill2;
		
		private String skill3;
		
		
		private String resume_name;
		
		
		private String resume_openunopen;
		
		
		private String resume_regdate;
		
		private String skill1name;
		
		private String skill2name;
		
		private String skill3name;
		
		public String getSkill1name() {
			return skill1name;
		}
		public void setSkill1name(String skill1name) {
			this.skill1name = skill1name;
		}
		public String getSkill2name() {
			return skill2name;
		}
		public void setSkill2name(String skill2name) {
			this.skill2name = skill2name;
		}
		public String getSkill3name() {
			return skill3name;
		}
		public void setSkill3name(String skill3name) {
			this.skill3name = skill3name;
		}
		public String getSkill1() {
			return skill1;
		}
		public void setSkill1(String skill1) {
			this.skill1 = skill1;
		}
		public String getSkill2() {
			return skill2;
		}
		public void setSkill2(String skill2) {
			this.skill2 = skill2;
		}
		public String getSkill3() {
			return skill3;
		}
		public void setSkill3(String skill3) {
			this.skill3 = skill3;
		}
		public String getResume_name() {
			return resume_name;
		}
		public void setResume_name(String resume_name) {
			this.resume_name = resume_name;
		}
		public String getResume_openunopen() {
			return resume_openunopen;
		}
		public void setResume_openunopen(String resume_openunopen) {
			this.resume_openunopen = resume_openunopen;
		}
		public String getResume_regdate() {
			return resume_regdate;
		}
		public void setResume_regdate(String resume_regdate) {
			this.resume_regdate = resume_regdate;
		}
	
	public int getCorecruit_no() {
		return corecruit_no;
	}
	public void setCorecruit_no(int corecruit_no) {
		this.corecruit_no = corecruit_no;
	}

	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getSession_code() {
		return session_code;
	}
	public void setSession_code(int session_code) {
		this.session_code = session_code;
	}
	public String getCorecruit_title() {
		return corecruit_title;
	}
	public void setCorecruit_title(String corecruit_title) {
		this.corecruit_title = corecruit_title;
	}
	public String getCorecruit_strdate() {
		return corecruit_strdate;
	}
	public void setCorecruit_strdate(String corecruit_strdate) {
		this.corecruit_strdate = corecruit_strdate;
	}
	public String getCorecruit_enddate() {
		return corecruit_enddate;
	}
	public void setCorecruit_enddate(String corecruit_enddate) {
		this.corecruit_enddate = corecruit_enddate;
	}
	public String getCorecruit_zipcode() {
		return corecruit_zipcode;
	}
	public void setCorecruit_zipcode(String corecruit_zipcode) {
		this.corecruit_zipcode = corecruit_zipcode;
	}
	public String getCorecruit_address1() {
		return corecruit_address1;
	}
	public void setCorecruit_address1(String corecruit_address1) {
		this.corecruit_address1 = corecruit_address1;
	}
	public String getCorecruit_address2() {
		return corecruit_address2;
	}
	public void setCorecruit_address2(String corecruit_address2) {
		this.corecruit_address2 = corecruit_address2;
	}
	public String getCorecruit_mapapi() {
		return corecruit_mapapi;
	}
	public void setCorecruit_mapapi(String corecruit_mapapi) {
		this.corecruit_mapapi = corecruit_mapapi;
	}
	public String getCorecruit_mainjob() {
		return corecruit_mainjob;
	}
	public void setCorecruit_mainjob(String corecruit_mainjob) {
		this.corecruit_mainjob = corecruit_mainjob;
	}
	public String getCorecruit_requirement() {
		return corecruit_requirement;
	}
	public void setCorecruit_requirement(String corecruit_requirement) {
		this.corecruit_requirement = corecruit_requirement;
	}
	public String getCorecruit_preference() {
		return corecruit_preference;
	}
	public void setCorecruit_preference(String corecruit_preference) {
		this.corecruit_preference = corecruit_preference;
	}
	public String getCorecruit_etc() {
		return corecruit_etc;
	}
	public void setCorecruit_etc(String corecruit_etc) {
		this.corecruit_etc = corecruit_etc;
	}
	public String getCorecruit_merit() {
		return corecruit_merit;
	}
	public void setCorecruit_merit(String corecruit_merit) {
		this.corecruit_merit = corecruit_merit;
	}
	public String getCorecruit_introduce() {
		return corecruit_introduce;
	}
	public void setCorecruit_introduce(String corecruit_introduce) {
		this.corecruit_introduce = corecruit_introduce;
	}
	public String getLike_yn() {
		return like_yn;
	}
	public void setLike_yn(String like_yn) {
		this.like_yn = like_yn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getUser_rpname() {
		return user_rpname;
	}
	public void setUser_rpname(String user_rpname) {
		this.user_rpname = user_rpname;
	}
	public String getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getDtlcodeCD() {
		return dtlcodeCD;
	}
	public void setDtlcodeCD(String dtlcodeCD) {
		this.dtlcodeCD = dtlcodeCD;
	}
	public int getCity1_no() {
		return city1_no;
	}
	public void setCity1_no(int city1_no) {
		this.city1_no = city1_no;
	}
	public String getCity1_name() {
		return city1_name;
	}
	public void setCity1_name(String city1_name) {
		this.city1_name = city1_name;
	}
	public int getCity2_no() {
		return city2_no;
	}
	public void setCity2_no(int city2_no) {
		this.city2_no = city2_no;
	}
	public String getCity2_name() {
		return city2_name;
	}
	public void setCity2_name(String city2_name) {
		this.city2_name = city2_name;
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
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public int getOrg_no() {
		return org_no;
	}
	public void setOrg_no(int org_no) {
		this.org_no = org_no;
	}
	public String getComm_divider() {
		return comm_divider;
	}
	public void setComm_divider(String comm_divider) {
		this.comm_divider = comm_divider;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getResume_devjob() {
		return resume_devjob;
	}
	public void setResume_devjob(String resume_devjob) {
		this.resume_devjob = resume_devjob;
	}
	public String getStackCD() {
		return stackCD;
	}
	public void setStackCD(String stackCD) {
		this.stackCD = stackCD;
	}
	public int getAppli_no() {
		return appli_no;
	}
	public void setAppli_no(int appli_no) {
		this.appli_no = appli_no;
	}
	public String getApplyCD() {
		return applyCD;
	}
	public void setApplyCD(String applyCD) {
		this.applyCD = applyCD;
	}
	public Date getAppli_procdate() {
		return appli_procdate;
	}
	public void setAppli_procdate(Date appli_procdate) {
		this.appli_procdate = appli_procdate;
	}
	public String getDetail_name() {
		return detail_name;
	}
	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}

	public List<DashboardModel> getSkillist() {
		return skillist;
	}
	public void setSkillist(List<DashboardModel> skillist) {
		this.skillist = skillist;
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
	public String getMsg_receiveID() {
		return msg_receiveID;
	}
	public void setMsg_receiveID(String msg_receiveID) {
		this.msg_receiveID = msg_receiveID;
	}

	


	
}
