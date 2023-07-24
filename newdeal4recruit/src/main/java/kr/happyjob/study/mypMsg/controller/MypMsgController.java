package kr.happyjob.study.mypMsg.controller;

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

import kr.happyjob.study.mypMsg.model.MessageModel;
import kr.happyjob.study.mypMsg.service.MypMsgService;
import kr.happyjob.study.common.comnUtils.ComnCodUtil;


@Controller
@RequestMapping("/mypmsg/")
public class MypMsgController {
   
   @Autowired
   MypMsgService mypMsgService; 
   
   private final Logger logger = LogManager.getLogger(this.getClass());
   private final String className = this.getClass().toString();
   

   @RequestMapping("message.do")
   public String message(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".message");
      logger.info("   - paramMap : " + paramMap);
      
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId"));
      
      /*String loginID = request.getParameter("loginID");*/
    	 
      logger.info("+ End " + className + ".message");
      
      model.addAttribute("loginID", session.getAttribute("loginId"));
            
       return "mypmsg/messagelist";
   }
   
   //쪽지내역  
   @RequestMapping("messagelist.do")
   public String messagelist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,	//http 요청의 파라미터를 data로 전달받음
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".messagelist");
      logger.info("   - paramMap : " + paramMap);
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      //로그인 정보
      paramMap.put("loginID", session.getAttribute("loginId"));
     
      
      // Controller  Service  Dao  SQL
      List<MessageModel> messagesearchlist = mypMsgService.messagelist(paramMap);
      int totalcnt = mypMsgService.countmessagelist(paramMap);
      
      model.addAttribute("messagesearchlist", messagesearchlist);
      model.addAttribute("totalcnt", totalcnt);
            
      logger.info("+ End " + className + ".messagelist");

      return "mypmsg/messagelistgrd";
   }
   
   //쪽지 하나 선택
   @RequestMapping("messageselectone.do")
   @ResponseBody
   public Map<String, Object> messageselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".messageselectone");
      logger.info("   - paramMap : " + paramMap);
           
      //로그인 정보담기
      paramMap.put("loginID", session.getAttribute("loginId")); 
      
      // Controller  Service  Dao  SQL
      MessageModel messagesearch = mypMsgService.messageselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("messagesearch", messagesearch);
      
      /*model.addAttribute("loginID", session.getAttribute("loginId"));*/
      
      logger.info("+ End " + className + ".messageselectone");

      return returnmap;
   }
   
   
   @RequestMapping("messagesave.do")
   @ResponseBody
   public Map<String, Object> messagesave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".messagesave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      
      if("I".equals(action)) {
    	  returncval = mypMsgService.messageinsert(paramMap);
      }else if("D".equals(action)) {
    	  returncval = mypMsgService.messagedelete(paramMap);
      }   
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".messagesave");
    
      return returnmap;
   }    

   	//채용관-> 인재모집-> 쪽지아이콘-> 보내기
	@RequestMapping("msgsenderinfo.do")
	@ResponseBody
	public Map<String, Object> msgsenderinfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start " + className + ".msgsenderinfo");
		  logger.info("   - paramMap : " + paramMap);
		  
		  //로그인 정보담기
		  paramMap.put("loginID", session.getAttribute("loginId")); 
		  
		  String action = (String) paramMap.get("action");
		  
	
		  paramMap.put("loginID", (String)session.getAttribute("loginId")); 


	      int returncval = 0;
	      
	      returncval = mypMsgService.msgsenderinfo(paramMap);
	      
	      logger.info("   - paramMap2 : " + paramMap);
	      
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	
	      
	      logger.info("+ End " + className + ".msgsenderinfo");
	      
	      model.addAttribute("loginID", session.getAttribute("loginid"));
	      
	      return returnmap;
	}
	
	
	
}