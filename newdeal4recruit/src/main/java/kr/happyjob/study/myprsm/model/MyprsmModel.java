package kr.happyjob.study.myprsm.model;

import java.sql.Date;

public class MyprsmModel {

	//유저정보
	
	private String loginID;
	
	private String user_type;
	
	private String name;
	
	private String user_hp;
	
	private String user_birthday;
	
	
	// 이력서 정보 테이블
	
	private int resume_no;
	
	
	private String skill1;
	
	private String skill2;
	
	private String skill3;
	
	
	private String resume_name;
	
	
	private String resume_openunopen;
	
	
	private String resume_regdate;
	
	//링크 테아블
	
	private int link_no;
	
	private String link_name;
	
	private String link_address;
	
	// 경력테이블
	
	private String career_code;
	
	private String career_joinYear;
	
	private String career_joinMonth;
	
	private String career_outYear;
	
	private String career_outMonth;
	
	private String career_company;
	
	private String career_development;
	
	private String career_introduction;
	
	private String career_department;
	
	private String career_position;
	
	private String career_skill1;
	
	private String career_skill2;
	
	private String career_skill3;
	
	private String career_inoffice;
	
	// 학력 테이블 
	
	private int degree_code;
	
	private String degree_division;
	
	private String degree_school;

	private String degree_major;

	private String degree_grade;
	
	private String degree_dropout;
	
	private double degree_credit;
	
	private int graduation_year;
	
	private int graduation_month;
	
	//프로젝트 테이블
	
	private int project_code;
	
	private int project_startYear;
	
	private int project_startMonth;
	
	private int project_endYear;
	
	private int project_endMonth;
	
	private String  project_progress;
	
	private String project_name;
	
	private String project_detail;
	
	private String project_link;
	
	private String project_skill1;
	
	private String project_skill2;
	
	private String project_skill3;
	
	//교육 테이블
	private int train_code;
	
	private int train_startYear;
	
	private int train_startMonth;
	
	private int train_endYear;
	
	private int train_endMonth;
	
	private String train_name;
	
	private String train_agency;
	
	private String train_detail;
	
	
	//자기소개서 테이블
	private int introduce_no;
	
	private String introduce_name;
	
	private String introduce_content;
	
	//지원정보
	private int appli_no;
	
	private int corecruit_no;
	
	private String applyCD;
	
	private Date vapplyCD;
	
	//첨부파일
	private int att_no;
	
	private String att_name;
	
	private String att_phypath;
	
	private String att_logpath;
	
	private String att_size;
	
	private String att_extname;
	
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_hp() {
		return user_hp;
	}
	public void setUser_hp(String user_hp) {
		this.user_hp = user_hp;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
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
	
	public int getLink_no() {
		return link_no;
	}
	public void setLink_no(int link_no) {
		this.link_no = link_no;
	}
	public String getLink_name() {
		return link_name;
	}
	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}
	public String getLink_address() {
		return link_address;
	}
	public void setLink_address(String link_address) {
		this.link_address = link_address;
	}
	
	public String getCareer_code() {
		return career_code;
	}
	public void setCareer_code(String career_code) {
		this.career_code = career_code;
	}
	public String getCareer_joinYear() {
		return career_joinYear;
	}
	public void setCareer_joinYear(String career_joinYear) {
		this.career_joinYear = career_joinYear;
	}
	public String getCareer_joinMonth() {
		return career_joinMonth;
	}
	public void setCareer_joinMonth(String career_joinMonth) {
		this.career_joinMonth = career_joinMonth;
	}
	public String getCareer_outYear() {
		return career_outYear;
	}
	public void setCareer_outYear(String career_outYear) {
		this.career_outYear = career_outYear;
	}
	public String getCareer_outMonth() {
		return career_outMonth;
	}
	public void setCareer_outMonth(String career_outMonth) {
		this.career_outMonth = career_outMonth;
	}
	public String getCareer_company() {
		return career_company;
	}
	public void setCareer_company(String career_company) {
		this.career_company = career_company;
	}
	public String getCareer_development() {
		return career_development;
	}
	public void setCareer_development(String career_development) {
		this.career_development = career_development;
	}
	public String getCareer_introduction() {
		return career_introduction;
	}
	public void setCareer_introduction(String career_introduction) {
		this.career_introduction = career_introduction;
	}
	public String getCareer_department() {
		return career_department;
	}
	public void setCareer_department(String career_department) {
		this.career_department = career_department;
	}
	public String getCareer_position() {
		return career_position;
	}
	public void setCareer_position(String career_position) {
		this.career_position = career_position;
	}
	public String getCareer_skill1() {
		return career_skill1;
	}
	public void setCareer_skill1(String career_skill1) {
		this.career_skill1 = career_skill1;
	}
	public String getCareer_skill2() {
		return career_skill2;
	}
	public void setCareer_skill2(String career_skill2) {
		this.career_skill2 = career_skill2;
	}
	public String getCareer_skill3() {
		return career_skill3;
	}
	public void setCareer_skill3(String career_skill3) {
		this.career_skill3 = career_skill3;
	}

	public String getCareer_inoffice() {
		return career_inoffice;
	}
	public void setCareer_inoffice(String career_inoffice) {
		this.career_inoffice = career_inoffice;
	}
	public int getDegree_code() {
		return degree_code;
	}
	public void setDegree_code(int degree_code) {
		this.degree_code = degree_code;
	}
	public String getDegree_division() {
		return degree_division;
	}
	public void setDegree_division(String degree_division) {
		this.degree_division = degree_division;
	}
	public String getDegree_school() {
		return degree_school;
	}
	public void setDegree_school(String degree_school) {
		this.degree_school = degree_school;
	}
	public String getDegree_major() {
		return degree_major;
	}
	public void setDegree_major(String degree_major) {
		this.degree_major = degree_major;
	}
	public String getDegree_grade() {
		return degree_grade;
	}
	public void setDegree_grade(String degree_grade) {
		this.degree_grade = degree_grade;
	}
	public String getDegree_dropout() {
		return degree_dropout;
	}
	public void setDegree_dropout(String degree_dropout) {
		this.degree_dropout = degree_dropout;
	}
	public double getDegree_credit() {
		return degree_credit;
	}
	public void setDegree_credit(double degree_credit) {
		this.degree_credit = degree_credit;
	}
	public int getGraduation_year() {
		return graduation_year;
	}
	public void setGraduation_year(int graduation_year) {
		this.graduation_year = graduation_year;
	}
	public int getGraduation_month() {
		return graduation_month;
	}
	public void setGraduation_month(int graduation_month) {
		this.graduation_month = graduation_month;
	}

	public int getProject_code() {
		return project_code;
	}
	public void setProject_code(int project_code) {
		this.project_code = project_code;
	}
	public int getProject_startYear() {
		return project_startYear;
	}
	public void setProject_startYear(int project_startYear) {
		this.project_startYear = project_startYear;
	}
	public int getProject_startMonth() {
		return project_startMonth;
	}
	public void setProject_startMonth(int project_startMonth) {
		this.project_startMonth = project_startMonth;
	}
	public int getProject_endYear() {
		return project_endYear;
	}
	public void setProject_endYear(int project_endYear) {
		this.project_endYear = project_endYear;
	}
	public int getProject_endMonth() {
		return project_endMonth;
	}
	public void setProject_endMonth(int project_endMonth) {
		this.project_endMonth = project_endMonth;
	}
	public String getProject_progress() {
		return project_progress;
	}
	public void setProject_progress(String project_progress) {
		this.project_progress = project_progress;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_detail() {
		return project_detail;
	}
	public void setProject_detail(String project_detail) {
		this.project_detail = project_detail;
	}
	public String getProject_link() {
		return project_link;
	}
	public void setProject_link(String project_link) {
		this.project_link = project_link;
	}
	public String getProject_skill1() {
		return project_skill1;
	}
	public void setProject_skill1(String project_skill1) {
		this.project_skill1 = project_skill1;
	}
	public String getProject_skill2() {
		return project_skill2;
	}
	public void setProject_skill2(String project_skill2) {
		this.project_skill2 = project_skill2;
	}
	public String getProject_skill3() {
		return project_skill3;
	}
	public void setProject_skill3(String project_skill3) {
		this.project_skill3 = project_skill3;
	}
	
	public int getTrain_code() {
		return train_code;
	}
	public void setTrain_code(int train_code) {
		this.train_code = train_code;
	}
	public int getTrain_startYear() {
		return train_startYear;
	}
	public void setTrain_startYear(int train_startYear) {
		this.train_startYear = train_startYear;
	}
	public int getTrain_startMonth() {
		return train_startMonth;
	}
	public void setTrain_startMonth(int train_startMonth) {
		this.train_startMonth = train_startMonth;
	}
	public int getTrain_endYear() {
		return train_endYear;
	}
	public void setTrain_endYear(int train_endYear) {
		this.train_endYear = train_endYear;
	}
	public int getTrain_endMonth() {
		return train_endMonth;
	}
	public void setTrain_endMonth(int train_endMonth) {
		this.train_endMonth = train_endMonth;
	}
	public String getTrain_name() {
		return train_name;
	}
	public void setTrain_name(String train_name) {
		this.train_name = train_name;
	}
	public String getTrain_agency() {
		return train_agency;
	}
	public void setTrain_agency(String train_agency) {
		this.train_agency = train_agency;
	}
	public String getTrain_detail() {
		return train_detail;
	}
	public void setTrain_detail(String train_detail) {
		this.train_detail = train_detail;
	}
	
	public int getIntroduce_no() {
		return introduce_no;
	}
	public void setIntroduce_no(int introduce_no) {
		this.introduce_no = introduce_no;
	}
	public String getIntroduce_name() {
		return introduce_name;
	}
	public void setIntroduce_name(String introduce_name) {
		this.introduce_name = introduce_name;
	}
	public String getIntroduce_content() {
		return introduce_content;
	}
	public void setIntroduce_content(String introduce_content) {
		this.introduce_content = introduce_content;
	}
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
	public String getApplyCD() {
		return applyCD;
	}
	public void setApplyCD(String applyCD) {
		this.applyCD = applyCD;
	}
	public Date getVapplyCD() {
		return vapplyCD;
	}
	public void setVapplyCD(Date vapplyCD) {
		this.vapplyCD = vapplyCD;
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
	public String getAtt_size() {
		return att_size;
	}
	public void setAtt_size(String att_size) {
		this.att_size = att_size;
	}
	public String getAtt_extname() {
		return att_extname;
	}
	public void setAtt_extname(String att_extname) {
		this.att_extname = att_extname;
	}

}
