package kr.happyjob.study.mngbmg.controller;

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
import kr.happyjob.study.mngbmg.model.MngBmgModel;
import kr.happyjob.study.mngbmg.service.MngBmgService;

@Controller
@RequestMapping("/mngbmg/")
public class MngBmgController { // class를 생성하다 
	
   @Autowired
   MngBmgService mngbmgService;  
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass()); 

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 초기화면
    */
   @RequestMapping("board.do")
   public String qna(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".qna");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".qna");

      return "mngbmg/qnalist";
   }
       
   @RequestMapping("qnalist.do")  
   public String qnalist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {   
      
      logger.info("+ Start " + className + ".qnalist");
      logger.info("   - paramMap : " + paramMap);
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); 
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      // Controller  Service  Dao  SQL
      List<MngBmgModel> qnasearchlist = mngbmgService.qnalist(paramMap); //List <List 안에 어떤 값을 넣을지> 
      int totalcnt = mngbmgService.countqnalist(paramMap);
      
      model.addAttribute("qnasearchlist", qnasearchlist);
      model.addAttribute("totalcnt", totalcnt);
      
      
      logger.info("+ End " + className + ".qnalist");
      
      return "mngbmg/qnalistgrd";
   }
   
//   
   @RequestMapping("qnaselectone.do")
   @ResponseBody
   public Map<String, Object> qnaselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".qnaselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      MngBmgModel qnasearch = mngbmgService.qnaselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("qnasearch", qnasearch);
      
      logger.info("+ End " + className + ".qnaselectone");

      return returnmap;
   }   
   
   @RequestMapping("qnasave.do")
   @ResponseBody
   public Map<String, Object> qnasave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".qnasave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginid", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      
      if("I".equals(action)) {
    	  returncval = mngbmgService.qnainsert(paramMap);
      } else if("U".equals(action)) {
    	  returncval = mngbmgService.qnaupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mngbmgService.qnadelete(paramMap);
      }      
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".qnasave");

      return returnmap;
   }    
 
	   
      
}