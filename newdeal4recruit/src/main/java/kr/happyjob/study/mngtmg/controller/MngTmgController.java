package kr.happyjob.study.mngtmg.controller;

import java.util.ArrayList;
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

import kr.happyjob.study.mngtmg.model.MngTmgModel;
import kr.happyjob.study.mngtmg.service.MngTmgService;
import kr.happyjob.study.myprmg.dto.MypRmgDto;

@Controller
@RequestMapping("/mngtmg/")
public class MngTmgController {
   
   @Autowired
   MngTmgService mngtmgService;
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();

   
   
   /**
    * 초기화면
    */
   @RequestMapping("term.do")
   public String term(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".term");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".term");

      return "mngtmg/term";
      
   }
   
   @RequestMapping("termlist.do")
   public String termlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
           HttpServletResponse response, HttpSession session) throws Exception {
       
       logger.info("+ Start " + className + ".termlist");
       
       logger.info("   - paramMap : " + paramMap);
       
       String pagenumStr = (String) paramMap.get("pagenum");
       String pageSizeStr = (String) paramMap.get("pageSize");
       
       int pagenum = (pagenumStr != null) ? Integer.parseInt(pagenumStr) : 1;
       int pageSize = (pageSizeStr != null) ? Integer.parseInt(pageSizeStr) : 10;
       int pageindex = (pagenum - 1) * pageSize;
       
       paramMap.put("pageSize", pageSize);
       paramMap.put("pageindex", pageindex);
       
       List<MngTmgModel> termsearchlist = mngtmgService.termlist(paramMap);
       int totalcnt = mngtmgService.counttermlist(paramMap);
       
       model.addAttribute("totalcnt", totalcnt);
       model.addAttribute("termsearchlist", termsearchlist);
       
       logger.info("+ End " + className + ".termlist");
       
       return "mngtmg/termlistgrd";
   }
   
   @RequestMapping("termcreate.do")
	public String termcreate(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start " + className + ".writerinfo");
		  logger.info("+ Start " + className + ".termcreate");
		  
	       


	      
	      logger.info("+ End " + className + ".termcreate");
	      
	      return "mngtmg/termcreate";
	}
}