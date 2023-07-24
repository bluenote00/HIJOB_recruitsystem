package kr.happyjob.study.myprmg.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.myprmg.service.MypRmgService;
 
@Controller
public class MypRmgController {
	
	  @Autowired
	  MypRmgService mypRmgService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	
	
//  기업 - 공고 전체 조회 - 기업 공고 첫 화면
	@RequestMapping("/recerc/employee.do")
	 public String adverlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {

	      logger.info("+ Start " + className + ".adverlist");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("name", session.getAttribute("userNm"));
	      paramMap.put("user_businesstype", session.getAttribute("user_businesstype"));
	      paramMap.put("user_type", session.getAttribute("userType"));
	      paramMap.put("user_coname", session.getAttribute("user_coname"));
	      
	      model.addAttribute("user_type", session.getAttribute("userType"));
	      logger.info("+ End " + className + ".adverlist");


	      return "recerc/employeelist";
	   }   
	
	
//  기업 - 공고 grd - 기업 공고 화면 grd
	@RequestMapping("/recerc/employeegrd.do")
	 public String adverlistgrd(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {

		 logger.info("+ Start " + className + ".adverlistgrd");
         logger.info("   - paramMap2 : " + paramMap);
	    	      
	      // 페이징 처리
	      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
         
         
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("name", session.getAttribute("userNm"));
	      paramMap.put("user_businesstype", session.getAttribute("user_businesstype"));
	      paramMap.put("user_type", session.getAttribute("userType"));
	      paramMap.put("user_coname", session.getAttribute("user_coname"));
	      	       
         List<MypRmgDto> adverlist = mypRmgService.adverlist(paramMap);
         int totalcnt = mypRmgService.countnoticelist(paramMap);
         
         for(MypRmgDto item : adverlist) {
        	 Map<String, Object> skillMap = new HashMap<String, Object>();
        	 skillMap.put("corecruit_no",item.getCorecruit_no());
        	 
        	 List<MypRmgDto> skillist = mypRmgService.skillist(skillMap);
        	 item.setSkillist(skillist);
         }
         
          model.addAttribute("user_type", session.getAttribute("userType"));
	      model.addAttribute("adverlist", adverlist);
	      model.addAttribute("totalcnt", totalcnt);
	      
	      logger.info("+ End " + className + ".adverlistgrd");

	      return "recerc/employeegrd";
	   }   


//  기업 - 공고 한건 조회
	@RequestMapping("/myprmg/adverselectone.do")
	 public String adverselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {

		 logger.info("+ Start " + className + ".adverselectone");
         logger.info("   - paramMap : " + paramMap);
	    	      
	      // 화면을 보고있는 사람의 정보 담기
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("name", session.getAttribute("userNm"));
	      paramMap.put("user_businesstype", session.getAttribute("user_businesstype"));
	      paramMap.put("user_type", session.getAttribute("userType"));
	      paramMap.put("user_coname", session.getAttribute("user_coname"));
         
	      MypRmgDto adverselectone = mypRmgService.adverselectone(paramMap); 
	      
	      List<MypRmgDto> skillist = mypRmgService.skillist(paramMap);
	      
	      model.addAttribute("adverselectone", adverselectone);
	      model.addAttribute("skillist", skillist);
	      model.addAttribute("loginID", session.getAttribute("loginId"));
	      model.addAttribute("user_type", session.getAttribute("userType"));
	      
	      logger.info("+ End " + className + ".adverselectone" + "loginID");
	      
	      return "myprmg/adverselectone";
	   }   

	//  기업 - 지원하기 저장
	@RequestMapping("/myprmg/adverapply.do")
	@ResponseBody
	public Map<String, Object> adverapply(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".adverapply");
	      logger.info("   - paramMap : " + paramMap);
	      
	      int returncval = 0;
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returncval = mypRmgService.adverapply(paramMap, request);

	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".adverapply");

	       return returnmap;
	   }    
	

	//  기업 - 공고 작성 페이지
	@RequestMapping("/myprmg/adverwrite.do")
	public String adverwrite(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start " + className + ".writerinfo");
		  logger.info("+ Start " + className + ".adverwrite");
		  
	      logger.info("   - paramMap1 : " + paramMap);    
	      
	      // 작성하는 기업 가입 정보 세션에 답기 (회사,회사 형태, 이름, 아이디)
	      paramMap.put("loginID", session.getAttribute("loginId")); 
	      paramMap.put("name", session.getAttribute("userNm"));
	      paramMap.put("user_businesstype", session.getAttribute("user_businesstype"));
	      paramMap.put("user_coname", session.getAttribute("user_coname"));

	      logger.info("   - paramMap2 : " + paramMap);
	      
	      // 작성하는 기업 가입 정보 가져오기 (회사,회사 형태, 이름, 아이디)
	      MypRmgDto writerinfo = mypRmgService.writerinfo(paramMap); 

	   // 작성하는 기업 가입 정보 model에 담음 (회사,회사 형태, 이름, 아이디)
	      model.addAttribute("writerinfo", writerinfo);
	      model.addAttribute("usertype", writerinfo);
	      
	      logger.info("+ End " + className + ".adverselectone");
	      
	      return "myprmg/adverwrite";
	}
	

	//  기업 - 공고 작성 저장
	@RequestMapping("/myprmg/adversave.do")
	@ResponseBody
	public Map<String, Object> adversave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".adversave");
	      logger.info("   - paramMap : " + paramMap);
	      
	      int returncval = 0;
	      
	      paramMap.put("loginID", (String) session.getAttribute("loginId"));

	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returncval = mypRmgService.adversave(paramMap, request);

	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".adversave");
	      logger.info("+ End " + className + ".adversaveskill");

	       return returnmap;
	   }    
	

//  기업 - 공고 & 기술 삭제
	@RequestMapping("/myprmg/adverdelete.do")
	@ResponseBody
	public Map<String, Object> adverdelete(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception {
		
	      logger.info("+ Start " + className + ".adverdelete");
	      logger.info("   - paramMap : " + paramMap);
	      
	      paramMap.put("loginid", (String) session.getAttribute("loginId"));
	      
	      int returncval2 = 0;
	      int returncval3 = 0;
	      int returncval = 0;
	      
	      
	      returncval3 = mypRmgService.adverfiledelete(paramMap);
	      returncval2 = mypRmgService.adverskilldelete(paramMap);
	      returncval = mypRmgService.adverdelete(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval3", returncval3);	
	      returnmap.put("returncval2", returncval2);	      
	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".adverdelete");

	       return returnmap;
	   }    

}

