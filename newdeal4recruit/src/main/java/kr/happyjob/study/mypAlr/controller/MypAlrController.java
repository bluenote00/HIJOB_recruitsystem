package kr.happyjob.study.mypAlr.controller;

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
import kr.happyjob.study.mypAlr.model.AlertModel;
import kr.happyjob.study.mypAlr.service.MypAlrService;

@Controller
@RequestMapping("/mypair/")
public class MypAlrController {
   
   @Autowired
   MypAlrService mypAlrService;
   
   
   private final Logger logger = LogManager.getLogger(this.getClass());
   private final String className = this.getClass().toString();
   
   
  
   @RequestMapping("alert.do")
   public String alert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".alert");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".alert");

      return "mypAlr/alertlist";
   }
       
   @RequestMapping("alertlist.do")
   public String alertlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,	//http 요청의 파라미터를 data로 전달받음
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".alertlist");
      
      logger.info("   - paramMap : " + paramMap);
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      // Controller  Service  Dao  SQL
      List<AlertModel> alertsearchlist = mypAlrService.alertlist(paramMap);
      int totalcnt = mypAlrService.countalertlist(paramMap);
      
      model.addAttribute("alertsearchlist", alertsearchlist);
      model.addAttribute("totalcnt", totalcnt);
            
      logger.info("+ End " + className + ".alertlist");

      return "mypAlr/alertlistgrd";
   }
   
   @RequestMapping("alertselectone.do")
   @ResponseBody
   public Map<String, Object> alertselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".alertselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      AlertModel alertsearch = mypAlrService.alertselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("alertsearch", alertsearch);
      
      logger.info("+ End " + className + ".alertselectone");
      
      return returnmap;
   }   
   
   
   @RequestMapping("alertsave.do")
   @ResponseBody
   public Map<String, Object> alertsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".alertsave");
      
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
      logger.info("   - 요기 login있어여햠... : " + paramMap);

           
      int returncval = 0;
      
           
      if("U".equals(action)) {
    	  returncval = mypAlrService.alertupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mypAlrService.alertdelete(paramMap);
      }
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
  /*    logger.info("returnmap"+ (returnmap));*/
      
      
      logger.info("+ End " + className + ".alertsave");

      return returnmap;
   }    
   
   
   
}