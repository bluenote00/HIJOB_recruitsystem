package kr.happyjob.study.myppage.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.myppage.dto.MyppageDto;
import kr.happyjob.study.myppage.service.MyppageService;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.myprsm.model.MyprsmModel;
 
@Controller
public class MyppageController {
	
	  @Autowired
	  MyppageService myppageService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();


	//  마이페이지 첫 화면 + 회원 등급별, 아이디별로 개인페이지 연결
	@RequestMapping("/myppage/myppage_main.do")
	public String myppagemain(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {	
		
	      logger.info("+ Start " + className + ".myppage");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("user_type", session.getAttribute("userType"));
	      
	      // Controller  Service  Dao  SQL
	      List<MyprsmModel> resumelist = myppageService.resumelist(paramMap);
	      
	      // 기업이 쓴 공고 조회
	      List<MyppageDto> adverlist_write = myppageService.adverlist_write(paramMap);
	         
	         for(MyppageDto item : adverlist_write) {
	        	 Map<String, Object> skillMap = new HashMap<String, Object>();
	        	 skillMap.put("corecruit_no",item.getCorecruit_no());
	        	 
	        	 List<MyppageDto> skillist = myppageService.skillist(skillMap);
	        	 item.setSkillist(skillist);
	         }
	      
	      /** 취준생_지원한 횟수 불러오기 */
	      int Papplycompanycount = myppageService.Papplycompanycount(paramMap); 

	      /** 기업_지원자 수 불러오기 */
	      int Capplicantcount = myppageService.Capplicantcount(paramMap); 
	      
	      /** 취준생_서류통과 횟수 불러오기 */
	      int Papplypaperpasscount = myppageService.Papplypaperpasscount(paramMap); 
	      
	      /** 기업_서류통과 지원자 수 불러오기 */
	      int Capplicantpappercount = myppageService.Capplicantpappercount(paramMap); 
	      
	      /** 취준생_합격 횟수 불러오기 */
	      int Papplypasscount = myppageService.Papplypasscount(paramMap); 

	      /** 기업_합격자 수 불러오기 */
	      int Capplicantpasscount = myppageService.Capplicantpasscount(paramMap); 
	      
	      /** 취준생_불합격 횟수 불러오기 */
	      int Papplyfailcount = myppageService.Papplyfailcount(paramMap); 
	      
	      /** 기업_불합격자 수 불러오기 */
	      int Capplicantfailcount = myppageService.Capplicantfailcount(paramMap); 
	      
	      logger.info("+ End " + className + ".myppage");

	     model.addAttribute("loginID", session.getAttribute("loginId"));
	     model.addAttribute("user_type", session.getAttribute("userType"));
	     
	     model.addAttribute("Papplycompanycount", Papplycompanycount);
	     model.addAttribute("Capplicantcount", Capplicantcount);
	     model.addAttribute("Papplypaperpasscount", Papplypaperpasscount);
	     model.addAttribute("Capplicantpappercount", Capplicantpappercount);
	     model.addAttribute("Papplypasscount", Papplypasscount);
	     model.addAttribute("Capplicantpasscount", Capplicantpasscount);
	     model.addAttribute("Papplyfailcount", Papplyfailcount);
	     model.addAttribute("Capplicantfailcount", Capplicantfailcount);
	     model.addAttribute("resumelist", resumelist);
	     model.addAttribute("adverlist_write", adverlist_write);
	     
	     String userType = (String) session.getAttribute("userType");

	      String returnType = "/myppage/myppage_main";
	      
	      if("P".equals(userType)) {
	         returnType = "/myppage/P_myppage_main";
	         
	      } else if("C".equals(userType)) {
	         returnType = "/myppage/C_myppage_main";
	      }
	      logger.info("+ end " + className + ".initDashboard");
	     
	      return returnType;
	      
	}
	
	//  마이페이지 채용현황 윗단 COUNT 화면
	@RequestMapping("/myppage/myppage_recruit.do")
	public String myppage_recruit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {	
		
	      logger.info("+ Start " + className + ".myppage_recruit");
	      logger.info("   - paramMap : " + paramMap);
	         
	
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("user_type", session.getAttribute("userType"));
	   
	      /** 취준생_지원한 회사 리스트 */
	      List<MyppageDto> Papplycompanylist = myppageService.Papplycompanylist(paramMap);
	      
	      /** 취준생_지원한 횟수 불러오기 */
	      int Papplycompanycount = myppageService.Papplycompanycount(paramMap); 

	      /** 기업_지원자 리스트 불러오기 */
	      List<MyppageDto> Capplicantlist  = myppageService.Capplicantlist(paramMap); 
	      
	      /** 기업_지원자 수 불러오기 */
	      int Capplicantcount = myppageService.Capplicantcount(paramMap); 
	      
	      /** 취준생_서류통과 횟수 불러오기 */
	      int Papplypaperpasscount = myppageService.Papplypaperpasscount(paramMap); 

	      /** 기업_서류통과 취준생 수 불러오기 */
	      int Capplicantpappercount = myppageService.Capplicantpappercount(paramMap); 
	      
	      /** 취준생_합격 횟수 불러오기 */
	      int Papplypasscount = myppageService.Papplypasscount(paramMap); 
	      
	      /** 기업_합격 취준생 수 불러오기 */
	      int Capplicantpasscount = myppageService.Capplicantpasscount(paramMap); 
	      
	      /** 취준생_불합격 횟수 불러오기 */
	      int Papplyfailcount = myppageService.Papplyfailcount(paramMap); 
	     
	      /** 기업_불합격자 수 불러오기 */
	      int Capplicantfailcount = myppageService.Capplicantfailcount(paramMap); 
	     
	      model.addAttribute("loginID", session.getAttribute("loginId"));
	      model.addAttribute("user_type", session.getAttribute("userType"));
	      
		     model.addAttribute("Papplycompanycount", Papplycompanycount);
		     model.addAttribute("Papplypaperpasscount", Papplypaperpasscount);
		     model.addAttribute("Papplypasscount", Papplypasscount);
		     model.addAttribute("Papplyfailcount", Papplyfailcount);
		     
		     model.addAttribute("Capplicantcount", Capplicantcount);
		     model.addAttribute("Capplicantpappercount", Capplicantpappercount);
		     model.addAttribute("Capplicantpasscount", Capplicantpasscount);
		     model.addAttribute("Capplicantfailcount", Capplicantfailcount);
	     
	     /** 취준생_지원한 회사 정보(지원완료 리스트 눌렀을때) */
	     model.addAttribute("Papplycompanylist", Papplycompanylist);
	     
	     /** 기업_지원한 취준생 정보(지원완료 리스트 눌렀을때) */
	     model.addAttribute("Capplicantlist", Capplicantlist);
  
	     String userType = (String) session.getAttribute("userType");
	     
	      String returnType = "/myppage/myppage_recruit";
	      
	      if("P".equals(userType)) {
	         returnType = "/myppage/P_myppage_recruit";
	         
	      } else if("C".equals(userType)) {
	         returnType = "/myppage/C_myppage_recruit";
	      }
	      logger.info("+ end " + className + ".initDashboard");
	     
	      return returnType;

	}

	
	//  마이페이지 채용현황 + 회원 등급별, 아이디별 연결 - 채용현황 - 서류 통과
	@RequestMapping("/myppage/myppage_recruitGrd2.do")
	public String myppage_recruitGrd2(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {	
		

	      logger.info("+ Start " + className + ".myppage");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("user_type", session.getAttribute("userType"));
	      
	      /** 취준생_서류통과 회사 리스트 */
	      List<MyppageDto> Papplypapercompanylist = myppageService.Papplypapercompanylist(paramMap);
	      
	      /** 기업_서류통과 지원자 리스트 */
	      List<MyppageDto> Capplicantpapperlist = myppageService.Capplicantpapperlist(paramMap);
	      
	      /** 취준생_지원한 횟수 불러오기 */
	      int Papplycompanycount = myppageService.Papplycompanycount(paramMap); 
	      
	      /** 기업_지원자 수 불러오기 */
	      int Capplicantcount = myppageService.Capplicantcount(paramMap); 

	      /** 기업_서류통과 지원자 수 불러오기 */
	      int Capplicantpappercount = myppageService.Capplicantpappercount(paramMap); 
             
	      /** 취준생_서류통과 횟수 불러오기*/
	      int Papplypaperpasscount = myppageService.Papplypaperpasscount(paramMap); 
	      
	      /** 취준생_합격 횟수 불러오기 */
	      int Papplypasscount = myppageService.Papplypasscount(paramMap); 

	      /** 기업_합격자 수 불러오기 */
	      int Capplicantpasscount = myppageService.Capplicantpasscount(paramMap); 
             
	      /** 취준생_불합격 횟수 불러오기 */
	      int Papplyfailcount = myppageService.Papplyfailcount(paramMap); 
	        
		   /** 기업_불합격자 수 불러오기 */
		   int Capplicantfailcount = myppageService.Capplicantfailcount(paramMap); 
		      
	      logger.info("+ End " + className + ".myppage");

	     model.addAttribute("loginID", session.getAttribute("loginId"));
	     model.addAttribute("user_type", session.getAttribute("userType"));
	     
	     model.addAttribute("Papplycompanycount", Papplycompanycount);
	     model.addAttribute("Papplypaperpasscount", Papplypaperpasscount);
	     model.addAttribute("Papplypasscount", Papplypasscount);
	     model.addAttribute("Papplyfailcount", Papplyfailcount);
	     
	     model.addAttribute("Capplicantcount", Capplicantcount);
	     model.addAttribute("Capplicantpappercount", Capplicantpappercount);
	     model.addAttribute("Capplicantpasscount", Capplicantpasscount);
	     model.addAttribute("Capplicantfailcount", Capplicantfailcount);
	     
	     /** 취준생_서류통과 회사 리스트 */
	     model.addAttribute("Papplypapercompanylist", Papplypapercompanylist);
	    
	     /** 기업_서류통과 지원자 리스트 */
	     model.addAttribute("Capplicantpapperlist", Capplicantpapperlist);
	  
	     
	     String userType = (String) session.getAttribute("userType");
	     
	      String returnType = "/myppage/myppage_recruitGrd2";
	      
	      if("P".equals(userType)) {
	         returnType = "/myppage/P_myppage_recruitGrd2";
	         
	      } else if("C".equals(userType)) {
	         returnType = "/myppage/C_myppage_recruitGrd2";
	      }
	      logger.info("+ end " + className + ".myppage_recruitGrd2");
	     
	      return returnType;
	}
	
	//  마이페이지 채용현황 + 회원 등급별, 아이디별 연결 - 채용현황 - 최종합격
	@RequestMapping("/myppage/myppage_recruitGrd3.do")
	public String myppage_recruitGrd3(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {	

	      logger.info("+ Start " + className + ".myppage");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("user_type", session.getAttribute("userType"));
	      
	      /** 취준생_최종합격 회사 리스트 */
	      List<MyppageDto> Papplypasscompanylist = myppageService.Papplypasscompanylist(paramMap);
	      
	      /** 기업_최종합격 지원자 리스트 */
	      List<MyppageDto> Capplicantpasslist = myppageService.Capplicantpasslist(paramMap);
	     
	      /** 취준생_지원한 횟수 불러오기 */
	      int Papplycompanycount = myppageService.Papplycompanycount(paramMap); 
	      
	      /** 기업_지원자 수 불러오기 */
	      int Capplicantcount = myppageService.Capplicantcount(paramMap); 

	      /** 기업_서류통과 지원자 수 불러오기 */
	      int Capplicantpappercount = myppageService.Capplicantpappercount(paramMap); 
             
	      /** 취준생_서류통과 횟수 불러오기*/
	      int Papplypaperpasscount = myppageService.Papplypaperpasscount(paramMap); 
	      
	      /** 취준생_합격 횟수 불러오기 */
	      int Papplypasscount = myppageService.Papplypasscount(paramMap); 

	      /** 기업_합격자 수 불러오기 */
	      int Capplicantpasscount = myppageService.Capplicantpasscount(paramMap); 
             
	      /** 취준생_불합격 횟수 불러오기 */
	      int Papplyfailcount = myppageService.Papplyfailcount(paramMap); 
	        
		   /** 기업_불합격자 수 불러오기 */
		   int Capplicantfailcount = myppageService.Capplicantfailcount(paramMap); 
	      
	      logger.info("+ End " + className + ".myppage");

	     model.addAttribute("loginID", session.getAttribute("loginId"));
	     model.addAttribute("user_type", session.getAttribute("userType"));
	     
	     model.addAttribute("Papplycompanycount", Papplycompanycount);
	     model.addAttribute("Papplypaperpasscount", Papplypaperpasscount);
	     model.addAttribute("Papplypasscount", Papplypasscount);
	     model.addAttribute("Papplyfailcount", Papplyfailcount);
	     
	     model.addAttribute("Capplicantcount", Capplicantcount);
	     model.addAttribute("Capplicantpappercount", Capplicantpappercount);
	     model.addAttribute("Capplicantpasscount", Capplicantpasscount);
	     model.addAttribute("Capplicantfailcount", Capplicantfailcount);
	     
	     /** 취준생_최종합격 회사 리스트 */
	     model.addAttribute("Papplypasscompanylist", Papplypasscompanylist);
	     
	     /** 기업_최종합격 지원자 리스트 */
	     model.addAttribute("Capplicantpasslist", Capplicantpasslist);
	     
	     String userType = (String) session.getAttribute("userType");
	      
	      String returnType = "/myppage/myppage_recruitGrd3";
	      
	      if("P".equals(userType)) {
	         returnType = "/myppage/P_myppage_recruitGrd3";
	         
	      } else if("C".equals(userType)) {
	         returnType = "/myppage/C_myppage_recruitGrd3";
	      }
	      logger.info("+ end " + className + ".myppage_recruitGrd3");
	     
	      return returnType;
	}
	
	
	//  마이페이지 채용현황 + 회원 등급별, 아이디별 연결 - 채용현황 - 불합격
	@RequestMapping("/myppage/myppage_recruitGrd4.do")
	public String myppage_recruitGrd4(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {	
		

	      logger.info("+ Start " + className + ".myppage");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("user_type", session.getAttribute("userType"));
	      
	      /** 취준생_불합격 회사 리스트  */
	      List<MyppageDto> Papplyfailcompanylist = myppageService.Papplyfailcompanylist(paramMap);
	      
	      /** 기업_불합격 지원자 리스트 */
	      List<MyppageDto> Capplicantfaillist = myppageService.Capplicantfaillist(paramMap);
	      
	      /** 취준생_지원한 횟수 불러오기 */
	      int Papplycompanycount = myppageService.Papplycompanycount(paramMap); 
	      
	      /** 기업_지원자 수 불러오기 */
	      int Capplicantcount = myppageService.Capplicantcount(paramMap); 

	      /** 기업_서류통과 지원자 수 불러오기 */
	      int Capplicantpappercount = myppageService.Capplicantpappercount(paramMap); 
             
	      /** 취준생_서류통과 횟수 불러오기*/
	      int Papplypaperpasscount = myppageService.Papplypaperpasscount(paramMap); 
	      
	      /** 취준생_합격 횟수 불러오기 */
	      int Papplypasscount = myppageService.Papplypasscount(paramMap); 

	      /** 기업_합격자 수 불러오기 */
	      int Capplicantpasscount = myppageService.Capplicantpasscount(paramMap); 
             
	      /** 취준생_불합격 횟수 불러오기 */
	      int Papplyfailcount = myppageService.Papplyfailcount(paramMap); 
	        
		   /** 기업_불합격자 수 불러오기 */
		   int Capplicantfailcount = myppageService.Capplicantfailcount(paramMap); 
	      
	      logger.info("+ End " + className + ".myppage");

	     model.addAttribute("loginID", session.getAttribute("loginId"));
	     model.addAttribute("user_type", session.getAttribute("userType"));
	     
	     model.addAttribute("Papplycompanycount", Papplycompanycount);
	     model.addAttribute("Papplypaperpasscount", Papplypaperpasscount);
	     model.addAttribute("Papplypasscount", Papplypasscount);
	     model.addAttribute("Papplyfailcount", Papplyfailcount);
	     
	     model.addAttribute("Capplicantcount", Capplicantcount);
	     model.addAttribute("Capplicantpappercount", Capplicantpappercount);
	     model.addAttribute("Capplicantpasscount", Capplicantpasscount);
	     model.addAttribute("Capplicantfailcount", Capplicantfailcount);
	     
	     /** 취준생_불합격 회사 리스트 */
	     model.addAttribute("Papplyfailcompanylist", Papplyfailcompanylist);
	     
	     /** 기업_불합격 지원자 리스트 */
	     model.addAttribute("Capplicantfaillist", Capplicantfaillist);
	     
	     String userType = (String) session.getAttribute("userType");
  
	      String returnType = "/myppage/myppage_recruitGrd4";
	      
	      if("P".equals(userType)) {
	         returnType = "/myppage/P_myppage_recruitGrd4";
	         
	      } else if("C".equals(userType)) {
	         returnType = "/myppage/C_myppage_recruitGrd4";
	      }
	      logger.info("+ end " + className + ".myppage_recruitGrd4");
	     
	      return returnType;
	}


	//  기업 채용현황 페이지 - 서류 합격 버튼
	@RequestMapping("/myppage/Capplicantpaperpassbutton.do")
	@ResponseBody
	public Map<String, Object> Capplicantpaperpassbutton(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".Capplicantpaperpassbutton");
	      logger.info("   - paramMap : " + paramMap);
	
	      int returncval = 0;
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returncval = myppageService.Capplicantpaperpassbutton(paramMap);
	      
	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".Capplicantpaperpassbutton");

	       return returnmap;
	   }    
	
	//  기업 채용현황 페이지 - 최종 합격 버튼
	@RequestMapping("/myppage/Capplicantallpassbutton.do")
	@ResponseBody
	public Map<String, Object> Capplicantallpassbutton(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".Capplicantallpassbutton");
	      logger.info("   - paramMap : " + paramMap);

	      int returncval = 0;
	
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returncval = myppageService.Capplicantallpassbutton(paramMap);

	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".Capplicantallpassbutton");

	       return returnmap;
	   }    
	
	//  기업 채용현황 페이지 - 불합격 버튼
	@RequestMapping("/myppage/Capplicantfailbutton.do")
	@ResponseBody
	public Map<String, Object> Capplicantfailbutton(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".Capplicantfailbutton");
	      logger.info("   - paramMap : " + paramMap);
	      
	      int returncval = 0;
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returncval = myppageService.Capplicantfailbutton(paramMap);

	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".Capplicantfailbutton");

	       return returnmap;
	   }    
	
}

