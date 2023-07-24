package kr.happyjob.study.myprsm.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.happyjob.study.myprsm.model.MyprsmModel;
import kr.happyjob.study.myprsm.service.MyprsmService;

@Controller
@RequestMapping("/myprsm/")
public class MyprsmController {
	
	@Autowired
	MyprsmService myprsmService;
	
	   private final Logger logger = LogManager.getLogger(this.getClass());
	   
	   private final String className = this.getClass().toString();
	

	   
	   @RequestMapping("resume.do")
	   public String resume(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   
		   
		      logger.info("+ Start " + className + ".resume");
		      logger.info("   - paramMap : " + paramMap);
		      
		      logger.info("+ End " + className + ".resume");

	      return "myprsm/resumelist";
	   }

	   @RequestMapping("checkchange.do")
	   @ResponseBody
	   public Map<String, Object> checkChange(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest reqeust,
			   HttpServletResponse response, HttpSession session) throws Exception {
		  
		   logger.info("  - adsfasdfasdfasdfsparamMap : " + paramMap);
		   
		   
		   int checkchange = myprsmService.updatecheck(paramMap);
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   
		   returnmap.put("checkchange", checkchange); 
		   logger.info("  - dfasjhfgajhfg : " + returnmap);
		   
		   return returnmap;
	   }
	   
	   @RequestMapping("resumelist.do")
	   public String resumelist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		   	 
		   
		     String loginId = (String)session.getAttribute("loginId");
		     logger.info("+ Start " + className + ".resumelist");
		     logger.info("   - paramMap : " + paramMap);
		   

		      paramMap.put("loginID", loginId);
		      
		      // Controller  Service  Dao  SQL
		      List<MyprsmModel> resumesearchlist = myprsmService.resumelist(paramMap);
		      int totalcnt = myprsmService.countresumelist(paramMap);
		      
		      model.addAttribute("resumesearchlist", resumesearchlist);
		      model.addAttribute("totalcnt", totalcnt);
		      
		      logger.info("+ End " + className + ".resumelist");
		      
		      
		      
		      return "myprsm/resumelistgrd";
	   }
	   
	   @RequestMapping("resumeselectone.do")	   
	   public String resumeselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".resumeselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      String loginID = (String)session.getAttribute("loginId");
	      
	      paramMap.put("loginID",loginID);
	      // Controller  Service  Dao  SQL
	      MyprsmModel totalselect = myprsmService.resumeselectone(paramMap);
	      
	      MyprsmModel myprsmModel = myprsmService.resumeForm(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      System.out.println("안녕안녕"+ paramMap.get("resume_no"));
	      paramMap.get("resume_no");
	      
	      logger.info("sdfgdfgsdfgsdfgsdfgsdfgsdfgsdfg11133"+ paramMap);
	      
	      model.addAttribute("totalselect", totalselect);
	      model.addAttribute("myprsmModel", myprsmModel);
	      model.addAttribute("resumenoselect", paramMap.get("resume_no"));
	      
	      logger.info("+ End " + className + ".resumeselectone");

	      
	      
	      return "/myprsm/resumeForm";
	   }   
	   
	   @RequestMapping("totalSave.do")
	   @ResponseBody
	   public Map<String, Object> totalSave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   
		   String loginId = (String)session.getAttribute("loginId");
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".totalSave");
		   logger.info("   - paramMap : " + paramMap);

		   int resume_no = myprsmService.resumenoselect(paramMap);
		   
		   returncval = myprsmService.totalupdate(paramMap);
		   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("returncval", returncval);
		   returnmap.put("resume_no", resume_no);
		   returnmap.put("loginID", loginId);
		   model.addAttribute("resume_no", resume_no);
		   
		   
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".totalSave");
		  
		   
		   return returnmap;
	   }
	   
	   @RequestMapping("totalDelete.do")
	   @ResponseBody
	   public Map<String, Object> totalDelete(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response, HttpSession session) throws Exception{
		   
		   int returncval = 0;
		   
		   myprsmService.resumelinkdelete(paramMap);
		   myprsmService.resumeedudelete(paramMap);
		   myprsmService.resumecareerdelete(paramMap);
		   myprsmService.resumeprojectdelete(paramMap);
		   myprsmService.resumeacademydelete(paramMap);
		   myprsmService.resumeintroductiondelete(paramMap);
		   
		   returncval = myprsmService.totalDelete(paramMap);
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   
		   returnmap.put("returncval", returncval);
		   
		   logger.info("왜 삭제를 안하니"+returnmap);
		   
		   return returnmap;
	   }
	   
	   @RequestMapping("savefile.do")
	   @ResponseBody
	   public Map<String, Object> savefile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
		   String loginId = (String)session.getAttribute("loginId"); 
		   
	      logger.info("+ Start " + className + ".savefile");
	      logger.info("   - paramMap : " + paramMap);
	      
	      String action = (String) paramMap.get("action");
	      
	      paramMap.put("loginid", (String) session.getAttribute("savefile"));
	      
	      paramMap.put("loginID", loginId);
	      
	      int returncval = 0;
	      
	      if("I".equals(action)) {
	    	  returncval = myprsmService.pictureinsertfile(paramMap,request);
	    	  
	      } 
//	      else if("U".equals(action)) {
//	    	  returncval = myprsmService.pictureupdatefile(paramMap,request);
//	      } 
	      //else if("D".equals(action)) {
//	    	  returncval = myprsmService.picturedeletefile(paramMap);
//	      }      
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	      
	      
	      logger.info("+ End " + className + ".noticesavefile");

	      return returnmap;
	   }  
	   

	   @RequestMapping("resumeForm.do")
	      public String resumeForm(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	            HttpServletResponse response, HttpSession session) throws Exception {
	         
	   
	         logger.info("+ Start " + className + ".resumeForm");         
	         
	         String loginId = (String)session.getAttribute("loginId");
	         paramMap.put("loginID", loginId);
	        
	         logger.info("0");
	         // no,reg,loginID 인서트 
	                 
	         int  myprsm = myprsmService.resumenoinsert(paramMap);
	         	         
	         // 인적사항 셀렉
	         MyprsmModel myprsmModel = myprsmService.resumeForm(paramMap);

	         
	         //제일 최근 이력서넘버
	         int resumenoselect = myprsmService.resumenoselect(paramMap);
	         
	         
	         model.addAttribute("loginId", loginId);
	         model.addAttribute("myprsmModel", myprsmModel);
	         model.addAttribute("resumenoselect", resumenoselect);
	         paramMap.put("resumenoselect", resumenoselect);
	         logger.info("  이력서 번호를 가져오거라 paramMap : " + paramMap);
	         logger.info("+ End " + className + ".resumeForm");
	         
	         
	         return "/myprsm/resumeForm";
	        
	      }
	   
	   
	   
	   @RequestMapping("resumelinksave.do")
	   @ResponseBody
	   public Map<String, Object> resumelinksave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		   logger.info("   - paramMap 훌랄라 : " + paramMap);
		      
		   int returncval = 0; //초기화
		      logger.info("+ Start " + className + ".noticesave");
		      logger.info("   - paramMap123123123123123123123123 : " + paramMap);
		      
		   if("I".equals(action)) {
			   	 
		    	  returncval = myprsmService.resumelinkeinsert(paramMap);
		      } else if("U".equals(action)) {
		    	  returncval = myprsmService.resumelinkupdate(paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumelinkdelete(paramMap);
		      }  	   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".noticesave");
		   return returnmap;
	   }
	   
	   @RequestMapping("linklist.do")
	   public String resumelinklist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".resumelist");
		   logger.info("   - paramMap를르르르를 : " + paramMap);

		      
		      // Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormlinklist = myprsmService.resumelinklist(paramMap);
		    int totalcnt = myprsmService.countlinklist(paramMap);
		      
		    model.addAttribute("resumeFormlinklist", resumeFormlinklist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".resumelist");
		      
		    return "myprsm/linklist";
	   }
	   
	   @RequestMapping("linkselectone.do")
	   @ResponseBody
	   public Map<String, Object> linkselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".linkselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel linkselect = myprsmService.linkselectone(paramMap);
	     
	    
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("linkselect", linkselect);
	      
	      
	      
	      logger.info("+ End " + className + ".noticeselectone");

	      return returnmap;
	   }   

	   @RequestMapping("resumeedusave.do")
	   @ResponseBody
	   public Map<String, Object> resumeedusave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".noticesave");
		   logger.info("   - paramMap : " + paramMap);
		      
		   if("I".equals(action)) {
		    	  returncval = myprsmService.resumeeduinsert(paramMap);
		      } else if("U".equals(action)) {
		    	  returncval = myprsmService.resumeeduupdate(paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumeedudelete(paramMap);
		      }  	   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".noticesave");
		   return returnmap;
	   }
	   
	   
	   
	   @RequestMapping("edulist.do")
	   public String resumeedulist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".resumelist");
		   logger.info("   - paramMap : " + paramMap);

		      
		      //Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormedulist = myprsmService.resumeedulist(paramMap);
		    int totalcnt = myprsmService.countedulist(paramMap);
		      
		    model.addAttribute("resumeFormedulist", resumeFormedulist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".resumelist");
		      
		    return "myprsm/edulist";
		    
		    
	   }
	   
	   @RequestMapping("eduselectone.do")
	   @ResponseBody
	   public Map<String, Object> eduselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".eduselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel eduselect = myprsmService.eduselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("eduselect", eduselect);
	      
	      logger.info("+ End " + className + ".eduselectone");

	      return returnmap;
	   }  
	   
	   @RequestMapping("resumecareersave.do")
	   @ResponseBody
	   public Map<String, Object> resumecareersave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".noticesave");
		   logger.info("   - paramMap : " + paramMap);
		      
		   if("I".equals(action)) {
		    	  returncval = myprsmService.resumecareerinsert(paramMap);
		      } else if("U".equals(action)) {
		    	  returncval = myprsmService.resumecareerupdate(paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumecareerdelete(paramMap);
		      }  	   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".noticesave");
		   return returnmap;
	   }
	   
	   @RequestMapping("careerlist.do")
	   public String careerlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".resumelist");
		   logger.info("   - paramMap : " + paramMap);

		      
		      // Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormcareerlist = myprsmService.resumecareerlist(paramMap);
		    int totalcnt = myprsmService.countcareerlist(paramMap);
		      
		    model.addAttribute("resumeFormcareerlist", resumeFormcareerlist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".resumelist");
		      
		    return "myprsm/careerlist";
	   }
	   
	   @RequestMapping("careerselectone.do")
	   @ResponseBody
	   public Map<String, Object> careerselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".careerselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel careerselect = myprsmService.careerselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("careerselect", careerselect);
	      
	      logger.info("+ End " + className + ".careerselectone");

	      return returnmap;
	   }  
	   
	   @RequestMapping("resumeprojectsave.do")
	   @ResponseBody
	   public Map<String, Object> resumeprojectsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".noticesave");
		   logger.info("   - paramMap : " + paramMap);
		      
		   if("I".equals(action)) {
		    	  returncval = myprsmService.resumeprojectinsert(paramMap);
		      } else if("U".equals(action)) {
		    	  returncval = myprsmService.resumeprojectupdate(paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumeprojectdelete(paramMap);
		      }  	   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".noticesave");
		   return returnmap;
	   }
	   
	   @RequestMapping("projectselectone.do")
	   @ResponseBody
	   public Map<String, Object> projectselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".projectselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel projectselect = myprsmService.projectselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("projectselect", projectselect);
	      
	      logger.info("+ End " + className + ".careerselectone");

	      return returnmap;
	   }  
	   
	   @RequestMapping("projectlist.do")
	   public String porjectlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".projectlist");
		   logger.info("   - paramMap : " + paramMap);

		      
		      // Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormprojectlist = myprsmService.resumeprojectlist(paramMap);
		    int totalcnt = myprsmService.countprojectlist(paramMap);
		      
		    model.addAttribute("resumeFormprojectlist", resumeFormprojectlist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".projectlist");
		      
		    return "myprsm/projectlist";
	   }
	   
	   
	   @RequestMapping("academysave.do")
	   @ResponseBody
	   public Map<String, Object> resumeacademysave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".noticesave");
		   logger.info("   - paramMap : " + paramMap);
		      
		   if("I".equals(action)) {
		    	  returncval = myprsmService.resumeacademyinsert(paramMap);
		      } else if("U".equals(action)) {
		    	  logger.info("   - 111111111paramMap : " + paramMap);
		    	  returncval = myprsmService.resumeacademyupdate(paramMap);
		    	  logger.info("   - 2222222paramMap : " + paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumeacademydelete(paramMap);
		      }  	   
		   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".noticesave");
		   return returnmap;
	   }
	   
	   @RequestMapping("academylist.do")
	   public String academylist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".academylist");
		   logger.info("   - paramMap : " + paramMap);

		      
		      // Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormacademylist = myprsmService.resumeacademylist(paramMap);
		    int totalcnt = myprsmService.countacademylist(paramMap);
		      
		    model.addAttribute("resumeFormacademylist", resumeFormacademylist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".academylist");
		      
		    return "myprsm/academylist";
	   }
	   
	   @RequestMapping("academyselectone.do")
	   @ResponseBody
	   public Map<String, Object> academyselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".academyselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel academyselect = myprsmService.academyselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("academyselect", academyselect);
	      
	      logger.info("+ End " + className + ".careerselectone");

	      return returnmap;
	   }  
	   
	   @RequestMapping("introductionsave.do")
	   @ResponseBody
	   public Map<String, Object> introductionsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   String action = (String) paramMap.get("action");
		   
		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
		   
		      
		   int returncval = 0; //초기화
		   logger.info("+ Start " + className + ".introductionsave");
		   logger.info("   - paramMap : " + paramMap);
		      
		   if("I".equals(action)) {
		    	  returncval = myprsmService.resumeintroductioninsert(paramMap);
		      } else if("U".equals(action)) {
		    	  returncval = myprsmService.resumeintroductionupdate(paramMap);
		      } else if("D".equals(action)) {
		    	  returncval = myprsmService.resumeintroductiondelete(paramMap);
		      }  	   
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   returnmap.put("action", action);
		   returnmap.put("returncval", returncval);
		   logger.info("   - paramMap returnMap : " + returnmap);
		   
		   logger.info("+ End " + className + ".introductionsave");
		   return returnmap;
	   }
	   
	   @RequestMapping("introductionlist.do")
	   public String introductionlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		     
		   logger.info("+ Start " + className + ".introductionlist");
		   logger.info("   - paramMap : " + paramMap);

		      
		      // Controller  Service  Dao  SQL
		    List<MyprsmModel> resumeFormintroductionlist = myprsmService.resumeintroductionlist(paramMap);
		    int totalcnt = myprsmService.countintroductionlist(paramMap);
		      
		    model.addAttribute("resumeFormintroductionlist", resumeFormintroductionlist);
		    model.addAttribute("totalcnt", totalcnt);
		   
		    logger.info("+ End " + className + ".introductionlist");
		      
		    return "myprsm/introductionlist";
	   }
	   
	   @RequestMapping("introductionselectone.do")
	   @ResponseBody
	   public Map<String, Object> introductionselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".introductionselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	     MyprsmModel introductionselect = myprsmService.introductionselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("introductionselect", introductionselect);
	      
	      logger.info("+ End " + className + ".careerselectone");

	      return returnmap;
	   } 
}
