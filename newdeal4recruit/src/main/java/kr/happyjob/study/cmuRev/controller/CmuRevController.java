package kr.happyjob.study.cmuRev.controller;

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
import kr.happyjob.study.cmuRev.model.ReviewModel;
import kr.happyjob.study.cmuRev.service.CmuRevService;

@Controller
@RequestMapping("/cmurev/")
public class CmuRevController {
   
   @Autowired
   CmuRevService cmuRevService;
   
   
   private final Logger logger = LogManager.getLogger(this.getClass());
   private final String className = this.getClass().toString();
   
   
  
   @RequestMapping("review.do")
   public String review(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".review");
      logger.info("   - paramMap : " + paramMap);
      
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId"));
      
      
      logger.info("+ End " + className + ".review");
      
      
      model.addAttribute("loginID", session.getAttribute("loginId"));
    
      

      return "cmuRev/reviewlist";
   }
       
   @RequestMapping("reviewlist.do")
   public String reviewlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,	//http 요청의 파라미터를 data로 전달받음
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".reviewlist");
      
      logger.info("   - paramMap : " + paramMap);
      
 /*     paramMap.put("loginID", (String) session.getAttribute("loginId"));
	  	paramMap.put("userType",(String) session.getAttribute("userType"));		*/
      
/*      String loginID = ((String) paramMap.get("loginID"));
      String user_Type = ((String) paramMap.get("userType"));*/
              
      /*param값으로 넘겨줘야함*/
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      // Controller  Service  Dao  SQL
      List<ReviewModel> reviewsearchlist = cmuRevService.reviewlist(paramMap);
      int totalcnt = cmuRevService.countreviewlist(paramMap);
      
      model.addAttribute("reviewsearchlist", reviewsearchlist);
      model.addAttribute("totalcnt", totalcnt);
            
      logger.info("+ End " + className + ".reviewlist");

      return "cmuRev/reviewlistgrd";
   }
   
   @RequestMapping("reviewselectone.do")
   @ResponseBody
   public Map<String, Object> reviewselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".reviewselectone");
      logger.info("   - paramMap : " + paramMap);
      
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId")); 
      
      String loginID= (String) session.getAttribute("loginId");
      paramMap.put("loginID",loginID);
      
      
      // Controller  Service  Dao  SQL
      ReviewModel reviewsearch = cmuRevService.reviewselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("reviewsearch", reviewsearch);
      
      model.addAttribute("loginID", session.getAttribute("loginId"));
     
     logger.info("+ End " + className + ".reviewselectone"  + "loginID");

     return returnmap;
     
   }   
   
   @RequestMapping("reviewsave.do")
   @ResponseBody
   public Map<String, Object> reviewsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".reviewsave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;	
      
/*      HttpSession sessionUD= request.getSession();
      sessionUD.setAttribute("loginID", "loginID");*/
      
      
      if("I".equals(action)) {
    	  returncval = cmuRevService.reviewinsert(paramMap);
      } else if("U".equals(action)) {
    	  returncval = cmuRevService.reviewupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = cmuRevService.reviewdelete(paramMap);
      }      
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".reviewsave");
      
      model.addAttribute("loginID", session.getAttribute("loginId"));

      return returnmap;
   }   
   
}