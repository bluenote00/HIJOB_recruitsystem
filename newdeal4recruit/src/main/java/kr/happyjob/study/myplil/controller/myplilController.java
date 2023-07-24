package kr.happyjob.study.myplil.controller;

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

import kr.happyjob.study.myplil.model.myplilModel;
import kr.happyjob.study.myplil.service.myplilService;



@Controller
@RequestMapping("/myplil/")
public class myplilController {
   
	@Autowired
	   myplilService myplilservice; 
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   
   /**
    * 좋아요 초기화면
    */
   @RequestMapping("likelist.do")
      public String myplil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".initmyplil");
      logger.info("   - paramMap : " + paramMap);
      logger.info("+ End " + className + ".initmyplil");

    		  

      return "myplil/likelist";
      
   }

   /**
    * 좋아요 목록조회
    */
   @RequestMapping("likelistsearch.do")
   
      public String myplilsearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".likelistsearchinitpill");
      
      
      logger.info("   - loginMap : " + paramMap);
      
//      paramMap.put("sessionId", session.getAttribute("loginId"));
      
      //세션값 loginid로 paramMap입력
      paramMap.put("loginid", (String) session.getAttribute("loginId"));

      String loginid = ((String) paramMap.get("loginid"));
      logger.info("   - loginid put : " + loginid);
      int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
      int pageindex = (pagenum - 1) * pageSize;
      
      paramMap.put("loginid", loginid);
      paramMap.put("pageSize", pageSize);
      paramMap.put("pageindex", pageindex);     
      
      
      logger.info("+ End " + className + ".here");
      logger.info("   - lastMap put : " + paramMap);
      
      
      List<myplilModel> myplilList = myplilservice.likelist(paramMap);
      int myplilcnt = myplilservice.myplilcountlist(paramMap);
      
      
      
      logger.info("   - myplilList1 : " + myplilList);
      
        
      model.addAttribute("myplilList", myplilList);
      model.addAttribute("myplilcnt", myplilcnt);
      
      logger.info("   - myplilList2 : " + myplilList);
      logger.info("   - model : " + model);
      logger.info("+ End " + className + ".myplilList");

    		  

      return "myplil/likelistgrd";
      
   }

   
	   
	@RequestMapping("likedelete.do")
	@ResponseBody
	public Map<String, Object> likedelete(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		  
	      logger.info("+ Start " + className + ".likedelete");

	      logger.info("   - start  : delete paramMap" + paramMap);

	      String action = (String) paramMap.get("action");
	      //int corecruit_no = Integer.parseInt( paramMap.get("corecruit_no"));
          
//          int ln = Integer.parseInt((String) paramMap.get("like_number"));
          paramMap.get("like_number");
	      paramMap.put("loginID", (String) session.getAttribute("loginId"));
	      //paramMap.put("corecruit_no", corecruit_no);
	      
	      logger.info("   - integer end " + paramMap);
	      
	      
	      int returncval = 0;
	      int returncval1 = 0;
	      int returncval2 = 0;
	      logger.info("   - action : " + action);
	      
	      logger.info("   - start  : delete2 paramMap" + paramMap);


	      if("D".equals(action)) {
	    	  returncval1 = myplilservice.myplildelete(paramMap);
	    	  returncval2 = myplilservice.myplilrefresh(paramMap);  
	      }      
	      returncval = returncval1 + returncval2; 
	       
	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	      
	      logger.info("   - paramreturncval : " + paramMap);
	      logger.info("   - paramreturncval : " + returnmap);
	      return returnmap;
	      
	}
	   
   

	   @RequestMapping("likeNew.do")
	   @ResponseBody
	   public Map<String, Object> likeNew(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".mpydclsave");
	      logger.info("   - paramMap : " + paramMap);
	      
	      
	      
	      paramMap.put("loginid", (String) session.getAttribute("loginId"));
	      
	      
	      int returncval = 0;
	      logger.info("   - paramMapstart : " + paramMap);

	     returncval = myplilservice.myplilinsert(paramMap);
	    	  
	    	  
	    	       
	      
	      
	      logger.info("   - returncval : " + returncval);

	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	      logger.info("+ End " + returnmap + ".returnmap");
	      logger.info("+ End " + className + ".myplillikeNEW");

	      return returnmap;
	   }    
	   
   
//   @RequestMapping("noticesave.do")
//   @ResponseBody
//   public Map<String, Object> noticesave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//         HttpServletResponse response, HttpSession session) throws Exception {
//      
//      logger.info("+ Start " + className + ".noticesave");
//      logger.info("   - paramMap : " + paramMap);
//      
//      String action = (String) paramMap.get("action");
//      
//      paramMap.put("loginid", (String) session.getAttribute("loginId"));
//      
//      
//      int returncval = 0;
//      
//      if("I".equals(action)) {
//    	  returncval = mngNotService.noticeinsert(paramMap);
//      } else if("U".equals(action)) {
//    	  returncval = mngNotService.noticeupdate(paramMap);
//      } else if("D".equals(action)) {
//    	  returncval = mngNotService.noticedelete(paramMap);
//      }      
//      
//      Map<String, Object> returnmap = new HashMap<String, Object>();
//      
//      returnmap.put("returncval", returncval);
//      
//      logger.info("+ End " + className + ".noticesave");
//
//      return returnmap;
//   }    
//   
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
	   
      
}