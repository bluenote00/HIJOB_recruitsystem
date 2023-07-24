package kr.happyjob.study.recors.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
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
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.myprsm.model.MyprsmModel;
import kr.happyjob.study.myprsm.service.MyprsmService;
import kr.happyjob.study.recors.model.RecorsModel;
import kr.happyjob.study.recors.service.RecorsService;

@Controller
@RequestMapping("/recors/")
public class RecorsController {


   @Autowired
   RecorsService recorsService;
   
   private final Logger logger = LogManager.getLogger(this.getClass());
   private final String className = this.getClass().toString();
   
   @RequestMapping("openresume.do")
   public String openresume (Model model, @RequestParam Map<String, Object> paramMap,HttpServletRequest request,
		   HttpServletResponse response, HttpSession session) throws Exception{
	   
	    
	   
	   return "recors/recorslist";
   }
  
   
   @RequestMapping("recorsgrd.do")
   public String recorsgrd(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		   HttpServletResponse response, HttpSession session) throws Exception {
	   
	   	  int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
	     
	      
	      // Controller  Service  Dao  SQL
	      List<RecorsModel> openresumelist = recorsService.openresumelist(paramMap);
	      int totalcnt = recorsService.countopenlist(paramMap);
	      
	      model.addAttribute("openresumelist", openresumelist);
	      model.addAttribute("totalcnt", totalcnt);
	      
	      logger.info("+ End " + className + ".resumelist");
	      
	   
	   return  "recors/recorslistgrd";
   }
   
   // 이력서 한건 조회
   @RequestMapping("resumeselectone.do")   
   public String resumeselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		   HttpServletResponse response, HttpSession session) throws Exception {
	   
	    String loginID = (String)session.getAttribute("loginId");
	      
	    paramMap.put("loginID",loginID);
	   
	   	RecorsModel userinfo = recorsService.resumeForm(paramMap);
	  
	   	RecorsModel totalselect = recorsService.resumeselectone(paramMap);
	 
	    
	    model.addAttribute("totalselect", totalselect);
	    model.addAttribute("userinfo", userinfo);
	    model.addAttribute("resumenoselect", paramMap.get("resume_no"));
	    
	    return "recors/resumeForm_readonly";
   }
   
// 이력서 한건 조회
   @RequestMapping("resumeselectoneread.do")   
   public String resumeselectoneread(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		   HttpServletResponse response, HttpSession session) throws Exception {
	   
	    //String loginID = (String)session.getAttribute("loginId");
	      
	   // paramMap.put("loginID",loginID);
	   
	   	RecorsModel userinfo = recorsService.resumeForm(paramMap);
	  
	   	RecorsModel totalselect = recorsService.resumeselectone(paramMap);
	 
	    
	    model.addAttribute("totalselect", totalselect);
	    model.addAttribute("userinfo", userinfo);
	    model.addAttribute("resumenoselect", paramMap.get("resume_no"));
	    
	    return "recors/resumeForm_readonly";
   }
   
   @RequestMapping("linklist.do")
   public String resumelinklist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".resumelist");
	   logger.info("   - paramMap를르르르를 : " + paramMap);

	      
	      // Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormlinklist = recorsService.resumelinklist(paramMap);
	    int totalcnt = recorsService.countlinklist(paramMap);
	      
	    model.addAttribute("resumeFormlinklist", resumeFormlinklist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".resumelist");
	      
	    return "myprsm/linklist";
   }
   
   @RequestMapping("edulist.do")
   public String resumeedulist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".resumelist");
	   logger.info("   - paramMap : " + paramMap);

	      
	      //Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormedulist = recorsService.resumeedulist(paramMap);
	    int totalcnt = recorsService.countedulist(paramMap);
	      
	    model.addAttribute("resumeFormedulist", resumeFormedulist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".resumelist");
	      
	    return "myprsm/edulist";   
   }
   
   @RequestMapping("careerlist.do")
   public String careerlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".resumelist");
	   logger.info("   - paramMap : " + paramMap);

	      
	      // Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormcareerlist = recorsService.resumecareerlist(paramMap);
	    int totalcnt = recorsService.countcareerlist(paramMap);
	      
	    model.addAttribute("resumeFormcareerlist", resumeFormcareerlist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".resumelist");
	      
	    return "myprsm/careerlist";
   }
   
   @RequestMapping("projectlist.do")
   public String porjectlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".projectlist");
	   logger.info("   - paramMap : " + paramMap);

	      
	      // Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormprojectlist = recorsService.resumeprojectlist(paramMap);
	    int totalcnt = recorsService.countprojectlist(paramMap);
	      
	    model.addAttribute("resumeFormprojectlist", resumeFormprojectlist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".projectlist");
	      
	    return "myprsm/projectlist";
   }
   
   @RequestMapping("academylist.do")
   public String academylist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".academylist");
	   logger.info("   - paramMap : " + paramMap);

	      
	      // Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormacademylist = recorsService.resumeacademylist(paramMap);
	    int totalcnt = recorsService.countacademylist(paramMap);
	      
	    model.addAttribute("resumeFormacademylist", resumeFormacademylist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".academylist");
	      
	    return "myprsm/academylist";
   }
   
   @RequestMapping("introductionlist.do")
   public String introductionlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	     
	   logger.info("+ Start " + className + ".introductionlist");
	   logger.info("   - paramMap : " + paramMap);

	      
	      // Controller  Service  Dao  SQL
	    List<RecorsModel> resumeFormintroductionlist = recorsService.resumeintroductionlist(paramMap);
	    int totalcnt = recorsService.countintroductionlist(paramMap);
	      
	    model.addAttribute("resumeFormintroductionlist", resumeFormintroductionlist);
	    model.addAttribute("totalcnt", totalcnt);
	   
	    logger.info("+ End " + className + ".introductionlist");
	      
	    return "myprsm/introductionlist";
   }
}