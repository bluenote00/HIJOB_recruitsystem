package kr.happyjob.study.mngrmg.controller;

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
import kr.happyjob.study.mngrmg.model.MngRmgModel;
import kr.happyjob.study.mngrmg.service.MngRmgService;

@Controller
@RequestMapping("/mngrmg/")
public class MngRmgController { // class를 생성하다 
	
   @Autowired
   MngRmgService mngrmgService;  
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass()); 

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 초기화면
    */
   @RequestMapping("rev.do")
   public String rev(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".rev");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".rev");

      return "mngrmg/revlist";
   }
       
   @RequestMapping("revlist.do")  
   public String revlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {   
      
      logger.info("+ Start " + className + ".revlist");
      logger.info("   - paramMap : " + paramMap);
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); 
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      // Controller  Service  Dao  SQL
      List<MngRmgModel> revsearchlist = mngrmgService.revlist(paramMap); //List <List 안에 어떤 값을 넣을지> 
      int totalcnt = mngrmgService.countrevlist(paramMap);
      
      model.addAttribute("revsearchlist", revsearchlist);
      model.addAttribute("totalcnt", totalcnt);
      
      
      logger.info("+ End " + className + ".revlist");
      
      return "mngrmg/revlistgrd";
   }
   
//   
   @RequestMapping("revselectone.do")
   @ResponseBody
   public Map<String, Object> revselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".revselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      MngRmgModel revsearch = mngrmgService.revselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("revsearch", revsearch);
      
      logger.info("+ End " + className + ".revselectone");

      return returnmap;
   }   
   
   @RequestMapping("revsave.do")
   @ResponseBody
   public Map<String, Object> revsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".revsave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      
      if("I".equals(action)) {
    	  returncval = mngrmgService.revinsert(paramMap);
      } else if("U".equals(action)) {
    	  returncval = mngrmgService.revupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mngrmgService.revdelete(paramMap);
      }      
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".revsave");

      return returnmap;
   }    
 
	   
      
}