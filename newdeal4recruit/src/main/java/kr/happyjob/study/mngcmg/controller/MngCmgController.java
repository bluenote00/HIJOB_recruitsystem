package kr.happyjob.study.mngcmg.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import kr.happyjob.study.mngcmg.model.MngCmgModel;
import kr.happyjob.study.mngcmg.service.MngCmgService;

@Controller
@RequestMapping("/mngcmg/")
public class MngCmgController {
   
   @Autowired
   MngCmgService mngcmgService;
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();

   
   
   /**
    * 초기화면
    */
   @RequestMapping("approve.do")
   public String comp(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".comp");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".comp");

      return "mngcmg/complist";
      
   }
   
   @RequestMapping("complist.do")
   public String complist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
           HttpServletResponse response, HttpSession session) throws Exception {
       
       logger.info("+ Start " + className + ".complist");
       
       logger.info("   - paramMap : " + paramMap);
       
       String pagenumStr = (String) paramMap.get("pagenum");
       String pageSizeStr = (String) paramMap.get("pageSize");
       
       int pagenum = (pagenumStr != null) ? Integer.parseInt(pagenumStr) : 1;
       int pageSize = (pageSizeStr != null) ? Integer.parseInt(pageSizeStr) : 10;
       int pageindex = (pagenum - 1) * pageSize;
       
       paramMap.put("pageSize", pageSize);
       paramMap.put("pageindex", pageindex);
       
       // delyn 파라미터 값 가져오기
       String delyn = (String) paramMap.get("delyn");
       
       logger.info("delyn: " + delyn);
       
       List<MngCmgModel> compsearchlist = new ArrayList<>();
       
       if (delyn == null || delyn.isEmpty()) {
           // delyn 값이 없을 경우 모든 데이터를 가져옴
           compsearchlist = mngcmgService.complist(paramMap);
       } else {
           // delyn 값에 해당하는 데이터만 가져옴
           paramMap.put("userType", delyn);
           compsearchlist = mngcmgService.complistByUserType(paramMap);
       }
       
       int totalcnt = mngcmgService.countcomplist(paramMap);
       model.addAttribute("totalcnt", totalcnt);
       model.addAttribute("compsearchlist", compsearchlist);
       
       logger.info("+ End " + className + ".complist");
       
       return "mngcmg/complistgrd";
   }

   
   @RequestMapping("compselectone.do")
   @ResponseBody
   public Map<String, Object> compselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".compselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      MngCmgModel compsearch = mngcmgService.compselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("compsearch", compsearch);
      
      logger.info("+ End " + className + ".compselectone");

      return returnmap;
   }   
   
   @RequestMapping("compsave.do")
   @ResponseBody
   public Map<String, Object> compsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".compsave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      
      if("I".equals(action)) {
    	  returncval = mngcmgService.compinsert(paramMap);
      } else if("U".equals(action)) {
    	  returncval = mngcmgService.compupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mngcmgService.compdelete(paramMap);
      }      
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".compsave");

      return returnmap;
   }    
}