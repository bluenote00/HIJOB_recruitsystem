package kr.happyjob.study.mypdcl.controller;

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
import kr.happyjob.study.mypdcl.model.mypdclModel;
import kr.happyjob.study.mypdcl.service.mypdclService;



@Controller
@RequestMapping("/mypdcl/")
public class mypdclController {
   
   @Autowired
   mypdclService mypdclservice;
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 초기화면
    */
   @RequestMapping("declarelist.do")
   public String mypdcl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".notice");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".notice");

      return "mypdcl/declarelist";
   }
   
   
       
   @RequestMapping("declarelistsearch.do")
   public String mypdclsearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".declarelist");
      
      logger.info("   - paramMap : " + paramMap);
      
      
      paramMap.put("loginid", (String) session.getAttribute("loginId"));
	  paramMap.put("userType", (String) session.getAttribute("userType"));
      

      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      //service전에 log확인
      logger.info("+ End " + paramMap + ".paramMap+usertype?");

      // Controller  Service  Dao  SQL
      List<mypdclModel> declaresearchlist = mypdclservice.declarelist(paramMap);
      int declarecnt = mypdclservice.countdeclarelist(paramMap);
      
      model.addAttribute("declaresearchlist", declaresearchlist);
      model.addAttribute("declarecnt", declarecnt);
      
      
      logger.info("+ End " + className + ".declarelist");

      return "mypdcl/declarelistgrd";
   }
   
   @RequestMapping("declareselectone.do")
   @ResponseBody
   public Map<String, Object> declareselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".declareselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      mypdclModel declaresearch = mypdclservice.declareselectone(paramMap);
      logger.info("   - declaresearch? : " + declaresearch);
      logger.info("   - service후? paramMap : " + paramMap);
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("declaresearch", declaresearch);
      
      logger.info("+ End " + className + ".declareselectone");

      return returnmap;
   }   
   

   
   
   
   
   @RequestMapping("mypdclsave.do")
   @ResponseBody
   public Map<String, Object> mypdclsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".mpydclsave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginid", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      logger.info("   - paramMapstart : " + paramMap);

      if("U".equals(action)) {
    	  returncval = mypdclservice.mypdclupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mypdclservice.mypdcldelete(paramMap);
      }      
      logger.info("   - paramMapend : " + paramMap);

      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".noticesave");

      return returnmap;
   }    

   

   @RequestMapping("declareNew.do")
   @ResponseBody
   public Map<String, Object> declareNew(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".mpydclsave");
      logger.info("   - paramMap : " + paramMap);
      //String report_CD = (String) paramMap.get("group_code");
      String action = (String) paramMap.get("action");
      
      //paramMap.put("report_CD", report_CD);
      paramMap.put("loginid", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      int returncval1 = 0;
      int returncval2 = 0;
      int returncval3 = 0;
      int returncval4 = 0;
      int returncval5 = 0;
      logger.info("   - paramMapstart : " + paramMap);

      if("I".equals(action)) {
    	  returncval1 = mypdclservice.mypdclinsert(paramMap);
    	  returncval2 = mypdclservice.mypdclrefresh(paramMap);
    	  returncval3 = mypdclservice.mypdclblackNullcheck(paramMap);
    	  if(returncval3 == 1) {
    			  
    		  returncval4 = mypdclservice.mypdclblack(paramMap);
    		  
    			  if(returncval4 == 1){
    				  
    				  returncval5 =  mypdclservice.mypdclblackUsertype(paramMap);
    				  
    			  }
    				  
    				  
    	  		  }
    	  }     
      returncval = returncval1 + returncval2 ; 
      //+ returncval3;
      logger.info("   - returncval : " + returncval);
      logger.info("   - mypdclinsert : " + returncval1);
      logger.info("   - mypdclrefresh : " + returncval2);
      logger.info("   - mypdclblackNullcheck : " + returncval3);
      logger.info("   - mypdclblack : " + returncval4);
      logger.info("   - mypdclblackUsertype : " + returncval4);

      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".noticesave");

      return returnmap;
   }    
   
//   
//   @RequestMapping("noticesavefile.do")
//   @ResponseBody
//   public Map<String, Object> noticesavefile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//         HttpServletResponse response, HttpSession session) throws Exception {
//      
//      logger.info("+ Start " + className + ".noticesavefile");
//      logger.info("   - paramMap : " + paramMap);
//      
//      String action = (String) paramMap.get("action");
//      
//      paramMap.put("loginid", (String) session.getAttribute("loginId"));
//      
//      int returncval = 0;
//      
//      if("I".equals(action)) {
//    	  returncval = mngNotService.noticeinsertfile(paramMap,request);
//      } else if("U".equals(action)) {
//    	  returncval = mngNotService.noticeupdatefile(paramMap,request);
//      } else if("D".equals(action)) {
//    	  returncval = mngNotService.noticedeletefile(paramMap);
//      }      
//      
//      Map<String, Object> returnmap = new HashMap<String, Object>();
//      
//      returnmap.put("returncval", returncval);
//      
//      logger.info("+ End " + className + ".noticesavefile");
//
//      return returnmap;
//   }  
//   
//	@RequestMapping("downloadnoticefile.do")
//	public void downloadBbsAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//			HttpServletResponse response, HttpSession session) throws Exception {
//	
//		logger.info("+ Start " + className + ".downloadBbsAtmtFil");
//		logger.info("   - paramMap : " + paramMap);
//		
//		// 첨부파일 조회
//		NoticeModel noticesearch = mngNotService.noticeselectone(paramMap);  // file 이름    , 물리경로
//		
//		byte fileByte[] = FileUtils.readFileToByteArray(new File(noticesearch.getPhysic_path()));
//		
//		response.setContentType("application/octet-stream");
//	    response.setContentLength(fileByte.length);
//	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(noticesearch.getFile_name(),"UTF-8")+"\";");
//	    response.setHeader("Content-Transfer-Encoding", "binary");
//	    response.getOutputStream().write(fileByte);
//	     
//	    response.getOutputStream().flush();
//	    response.getOutputStream().close();
//
//		logger.info("+ End " + className + ".downloadBbsAtmtFil");
//	}
//	   
//	   
	   
      
}