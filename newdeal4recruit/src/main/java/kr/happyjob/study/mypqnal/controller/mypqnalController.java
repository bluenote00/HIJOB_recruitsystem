package kr.happyjob.study.mypqnal.controller;

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
import kr.happyjob.study.mypqnal.model.mypqnalModel;
import kr.happyjob.study.mypqnal.service.mypqnalService;



@Controller
@RequestMapping("/mypqnal/")
public class mypqnalController {
   
   @Autowired
   mypqnalService mypqnalservice;
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 초기화면
    */
   @RequestMapping("questionlist.do")
   public String mypqnal(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".notice");
      logger.info("   - paramMap : " + paramMap);
      
      logger.info("+ End " + className + ".notice");

      return "mypqnal/questionlist";
   }
   
   
       
   @RequestMapping("questionlistsearch.do")
   public String mypqnalsearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".questionlistsearch");
      
      logger.info("   - paramMap : " + paramMap);
      
      
      paramMap.put("loginID", (String) session.getAttribute("loginId"));
	  paramMap.put("userType",(String) session.getAttribute("userType"));
      
      String loginID = ((String) paramMap.get("loginID"));
      String userType = ((String) paramMap.get("userType"));
      
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);
      
      //service전에 log확인
      logger.info("+ End " + paramMap + ".paramMap+usertype?");

      // Controller  Service  Dao  SQL
      List<mypqnalModel> questionsearchlist = mypqnalservice.questionlist(paramMap);
      int questioncnt = mypqnalservice.countquestionlist(paramMap);
      
      
      model.addAttribute("questionsearchlist", questionsearchlist);
      model.addAttribute("questioncnt", questioncnt);
      
      logger.info("+ End " + questionsearchlist + ".questionsearchlist?");
      logger.info("+ End " + questioncnt + ".questioncnt?");

      logger.info("+ End " + className + ".questionlist");

      return "mypqnal/questionlistgrd";
   }
   
   
   @RequestMapping("questionselectone.do")
   @ResponseBody
   public Map<String, Object> noticeselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".questionselectone");
      logger.info("   - paramMap : " + paramMap);
      
      // Controller  Service  Dao  SQL
      mypqnalModel questionsearch = mypqnalservice.questionselectone(paramMap);
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("questionsearch", questionsearch);
      
      logger.info("+ End " + className + ".qnaselectone");

      return returnmap;
   }   
   

   
   
   
   
   @RequestMapping("mypqnalsave.do")
   @ResponseBody
   public Map<String, Object> mypqnalsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".mpydclsave");
      logger.info("   - paramMap : " + paramMap);
      
      String action = (String) paramMap.get("action");
      
      paramMap.put("loginid", (String) session.getAttribute("loginId"));
      
      
      int returncval = 0;
      logger.info("   - paramMapstart : " + paramMap);

      if("U".equals(action)) {
    	  returncval = mypqnalservice.mypqnalupdate(paramMap);
      } else if("D".equals(action)) {
    	  returncval = mypqnalservice.mypqnaldelete(paramMap);
      }      
      logger.info("   - paramMapend : " + paramMap);

      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      returnmap.put("returncval", returncval);
      
      logger.info("+ End " + className + ".mypqnalsave");

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