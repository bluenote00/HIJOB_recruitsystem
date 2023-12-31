package kr.happyjob.study.expnmg.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.expnmg.model.ExpNmgModel;
import kr.happyjob.study.expnmg.service.ExpNmgService;

@Controller
@RequestMapping("/expnmg/")
public class ExpNmgController {
	
	@Autowired
	ExpNmgService expnmgService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass()); 
	
	// Get class name for logger 
	private final String className = this.getClass().toString();
	
	
	
	   /**
	    * 초기화면
	    */
	   @RequestMapping("notice.do")
	   public String notice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".notice");
	      logger.info("   - paramMap : " + paramMap);
	      
	      logger.info("+ End " + className + ".notice");
	      
	      return "expnmg/noticelist";
	   }
	   
	   @RequestMapping("noticelist.do")  
	   public String noticelist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {  
	      
	      logger.info("+ Start " + className + ".noticelist");
	      logger.info("   - paramMap : " + paramMap);
	      
	      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); 
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
	      
	      // Controller  Service  Dao  SQL
	      List<ExpNmgModel> noticesearchlist = expnmgService.noticelist(paramMap); //List <List 안에 어떤 값을 넣을지> 
	      int totalcnt = expnmgService.countnoticelist(paramMap);
	      
	      model.addAttribute("noticesearchlist", noticesearchlist);
	      model.addAttribute("totalcnt", totalcnt);
	      
	      
	      logger.info("+ End " + className + ".noticelist");

	      return "expnmg/noticelistgrd";
	   }	   
	
	   @RequestMapping("noticeselectone.do")
	   @ResponseBody
	   public Map<String, Object> noticeselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".noticeselectone");
	      logger.info("   - paramMap : " + paramMap);
	      
	      // Controller  Service  Dao  SQL
	      ExpNmgModel noticesearch = expnmgService.noticeselectone(paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("noticesearch", noticesearch);
	      
	      logger.info("+ End " + className + ".noticeselectone");

	      return returnmap;
	   }   
	
	   @RequestMapping("noticesave.do")
	   @ResponseBody
	   public Map<String, Object> noticesave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".noticesave");
	      logger.info("   - paramMap : " + paramMap);
	      
	      String action = (String) paramMap.get("action");
	      
	      paramMap.put("loginid", (String) session.getAttribute("loginId"));
	      

	      int returncval = 0;
	      
	      if("I".equals(action)) {
	    	  returncval = expnmgService.noticeinsert(paramMap);
	      } else if("U".equals(action)) {
	    	  returncval = expnmgService.noticeupdate(paramMap);
	      } else if("D".equals(action)) {
	    	  returncval = expnmgService.noticedelete(paramMap);
	      }      
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".noticesave");

	      return returnmap;
	   }    
	   
	   
	   @RequestMapping("noticesavefile.do")
	   @ResponseBody
	   public Map<String, Object> noticesavefile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		   
		   logger.info("+ Start " + className + ".noticesavefile");
		   logger.info("  - paramMap : " + paramMap);
		   
		   
		   String action = (String) paramMap.get("actionexpnmg");
		   
		   paramMap.put("loginID", (String) session.getAttribute("loginId"));
		   
		   int returncval = 0;
		   
		   if("I".equals(action)) {
			   returncval = expnmgService.noticeinsertfile(paramMap,request);
		   } else if("U".equals(action)) {
			   returncval = expnmgService.noticeupdatefile(paramMap,request);
		   } else if("D".equals(action)) {
			   returncval = expnmgService.noticedeletefile(paramMap);
		   }
		   
		   Map<String, Object> returnmap = new HashMap<String, Object>();
		   
		   returnmap.put("returncval", returncval);
		   
		   logger.info("+ End " + className + ".noticesavefile");
		   
		   return returnmap;
	   }
	   
	   @RequestMapping("downloadnoticefile.do")
	   public void downloadBbsAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
		   
		    logger.info("+ Start " + className + ".downloadBbsAtmtFil");
			logger.info("   - paramMap : " + paramMap);
			
			// 첨부파일 조회
			ExpNmgModel noticesearch = expnmgService.noticeselectone(paramMap);  // file 이름    , 물리경로
			
			byte fileByte[] = FileUtils.readFileToByteArray(new File(noticesearch.getAtt_phypath()));
			
			response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(noticesearch.getAtt_name(),"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();

			logger.info("+ End " + className + ".downloadBbsAtmtFil");		   
	   }
	   
	   
	   
	   
	   @RequestMapping("noticeylist.do")
	   	public String noticeylist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {  
	   
		   logger.info("+ Start " + className + ".noticeylist");
	   
		   paramMap.put("notice_del_yn", "Y");
		   
		   List<ExpNmgModel> noticesearchlist = expnmgService.noticeylist(paramMap);
		   int totalcnt = expnmgService.countnoticelist(paramMap);
		   
		   model.addAttribute("noticesearchlist", noticesearchlist);
		   model.addAttribute("totalcnt", totalcnt);
		   
		   logger.info("+ End " + className + ".noticeylist");
		   
		   return "expnmg/noticelistgrd";
	   }
	   
	   
	   
	   
	
}