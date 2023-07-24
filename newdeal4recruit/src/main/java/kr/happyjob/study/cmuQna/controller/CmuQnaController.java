package kr.happyjob.study.cmuQna.controller;
      
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
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.SessionScope;

import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.cmuQna.model.QuestionModel;
import kr.happyjob.study.cmuQna.service.CmuQnaService;

@Controller
@RequestMapping("/cmuqna/")
public class CmuQnaController {
   
   @Autowired
   CmuQnaService cmuQnaService; 
   

   private final Logger logger = LogManager.getLogger(this.getClass());
   private final String className = this.getClass().toString();
   

   @RequestMapping("question.do")
   public String question(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".question");
      logger.info("   - paramMap : " + paramMap);
      
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId"));   
     
      
      logger.info("+ End " + className + ".question");

      model.addAttribute("loginID", session.getAttribute("loginid"));
    
      
      return "cmuQna/questionlist";
   }
       
   @RequestMapping("questionlist.do")
   public String questionlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,	//http 요청의 파라미터를 data로 전달받음
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".questionlist");
      
      logger.info("   - paramMap : " + paramMap);
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      // Controller  Service  Dao  SQL
      List<QuestionModel> questionsearchlist = cmuQnaService.questionlist(paramMap);
      int totalcnt = cmuQnaService.countquestionlist(paramMap);
      
      model.addAttribute("questionsearchlist", questionsearchlist);
      model.addAttribute("totalcnt", totalcnt);
      
      
      logger.info("+ End " + className + ".questionlist");

      return "cmuQna/questionlistgrd";
   }
   
   @RequestMapping("questionselectone.do")
   @ResponseBody
   public Map<String, Object> questionselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".questionselectone");
      logger.info("   - paramMap : " + paramMap);
      
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId")); 
      
      /*  HttpSession session= request.getSession();*/
      
      String loginID= (String) session.getAttribute("loginId");
      paramMap.put("loginID",loginID);
      
     
      
      // Controller  Service  Dao  SQL
      QuestionModel questionsearch = cmuQnaService.questionselectone(paramMap);
     
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("questionsearch", questionsearch);
     
      
      model.addAttribute("loginID", session.getAttribute("loginId"));
     
      logger.info("+ End " + className + ".questionselectone" + "loginID");
      
      return returnmap;
      
   }   
   
   @RequestMapping("questionsave.do")
   @ResponseBody
   public Map<String, Object> questionsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".questionsave");
      
      logger.info("   - paramMap : " + paramMap);
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
     /* paramMap.put("name", (String) session.getAttribute("userNm")); */
      paramMap.put("userConame", (String) session.getAttribute("user_coname")); 
      
      /*QuestionModel questionconame = cmuQnaService.questionsave(paramMap);*/
      
      String action = (String) paramMap.get("action");
      
      model.addAttribute("loginID", session.getAttribute("loginId"));
      /*model.addAttribute("name", session.getAttribute("userNm"));*/
      model.addAttribute("userConame", session.getAttribute("user_coname"));
      
      logger.info("   - 요기 login있어여햠... : " + paramMap );

           
      int returncval = 0;
      
           
      if("I".equals(action)) {
    	  returncval = cmuQnaService.questioninsert(paramMap);
      } else if("U".equals(action)) {
    	  returncval = cmuQnaService.questionupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = cmuQnaService.questiondelete(paramMap);
      }
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
  /*    logger.info("returnmap"+ (returnmap));*/
      
      
      logger.info("+ End " + className + ".questionsave");

      return returnmap;
   }    
    	       
   
}