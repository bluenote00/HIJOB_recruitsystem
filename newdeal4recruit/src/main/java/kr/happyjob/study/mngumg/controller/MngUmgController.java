package kr.happyjob.study.mngumg.controller;

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

import kr.happyjob.study.mngumg.model.MngUmgModel;
import kr.happyjob.study.mngumg.model.UserInfo;
import kr.happyjob.study.mngumg.service.MngUmgService;
import kr.happyjob.study.mypdcl.model.mypdclModel;



@Controller
@RequestMapping("/mngumg/")
	public class MngUmgController {
	   // 커밋 테스트 됌 -동철
	
	
	// Set logger
	   private final Logger logger = LogManager.getLogger(this.getClass());
	
	   // Get class name for logger
	   private final String className = this.getClass().toString();
	   
	   
	   @Autowired
	   MngUmgService mngumgService;

	   
	   
	   /**
	    * 초기화면
	    */      
	   @RequestMapping("member.do")
	   public String member(Model result, @RequestParam Map<String, String> paramMap, HttpServletRequest request,
		         HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start LoginController.changepwd.do");
				
	      logger.info("+ End LoginController.changepwd.do");
	      
	      return "mngumg/member";
	   }
  

	   @RequestMapping("blacklistsearch.do")
	   public String mypdclsearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".blacklist");
	      
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
	      List<MngUmgModel> blacksearchlist = mngumgService.searchblacklist(paramMap);
	      
	      int blackcnt = mngumgService.countblacklist(paramMap);
	      
	      model.addAttribute("blacksearchlist", blacksearchlist);
	      model.addAttribute("blackcnt", blackcnt);
	      
	      
	      logger.info("+ End " + className + ".declarelist");

	      return "mngumg/membergrd";
	   }

	   @RequestMapping("blackReturn.do")
	   @ResponseBody
	   public Map<String, Object> mypdclsave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".blackreturn");
	      logger.info("   - paramMap : " + paramMap);
	      
	      String action = (String) paramMap.get("action");
	      
	      paramMap.put("loginid", (String) session.getAttribute("loginId"));
	      
	      
	      int returncval = 0;
	      int returncval1 = 0;
	      int returncval2 = 0;
	      logger.info("   - paramMapstart : " + paramMap);

	      if("R".equals(action)) {
	    	  returncval1 = mngumgService.blacktypeupdate(paramMap);
	       	  //returncval2 = mngumgservice.blackdelete(paramMap);
	      }      
	      logger.info("   - paramMapend : " + paramMap);
	      returncval = returncval1 + returncval2;
	      

	      Map<String, Object> returnmap = new HashMap<String, Object>();
	      
	      returnmap.put("returncval", returncval);
	      
	      logger.info("+ End " + className + ".noticesave");

	      return returnmap;
	   }    

   
	   ////////////password change logic
	   
	   	   /**
	   	    * 초기화면
	   	    */      
	   	   @RequestMapping("changepwd.do")
	   	   public String index(Model result, @RequestParam Map<String, String> paramMap, HttpServletRequest request,
	   		         HttpServletResponse response, HttpSession session) throws Exception {
	   		
	   		  logger.info("+ Start LoginController.changepwd.do");
	   				
	   	      logger.info("+ End LoginController.changepwd.do");
	   	      
	   	      return "mngumg/changepwd";
	   	   }
	     
	   	   /*유저 정보 조회*/
	   	   @RequestMapping("modifiselectone.do")
	   	   @ResponseBody
	   	   public Map<String, Object> modifiselectone(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	   	         HttpServletResponse response, HttpSession session) throws Exception {
	   	      
	   	      logger.info("+ Start " + className + ".modifiselectone");
	   	      logger.info("   - paramMap : " + paramMap);
	   	      
	   	      // Controller  Service  Dao  SQL
	   	      UserInfo modifisearch = mngumgService.modifiselectone(paramMap);
	   	      
	   	      Map<String, Object> returnmap = new HashMap<String, Object>();
	   	      
	   	      returnmap.put("modifisearch",modifisearch);
	   	      
	   	      logger.info("+ End " + className + ".modifiselectone");

	   	      return returnmap;
	   	   }   
	     
	   	   /* 회원 정보 수정 */
	   	   @RequestMapping("mdification.do")
	   	   @ResponseBody
	   	   public Map<String, Object> mdification(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	   				HttpServletResponse response, HttpSession session) throws Exception{
	   		   
	   		   logger.info("+ Start " + className + ".mdification");
	   		   logger.info("   - paramMap : " + paramMap);
	   			
	   		   String action = (String)paramMap.get("action");
	   		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
	   		   
	   		   
	   		   logger.info("   - ########### : " + action);
	   		   
	   		   logger.info("   - ########### : " + session);
	   		   
	   		   int returncval = 0;
	   		      
	   		      if("U".equals(action)) {
	   		    	  returncval = mngumgService.mdificationUser(paramMap);
	   		      }
	   		      
	   		      Map<String, Object> returnmap = new HashMap<String, Object>();
	   		      
	   		      returnmap.put("returncval", returncval);
	   		      
	   		      logger.info("+ End " + className + ".mdification");

	   		      return returnmap;
	         }
	   	   
	   	   /*유저 비밀번호 조회*/
	   	   @RequestMapping("pwdconfirm.do")
	   	   @ResponseBody
	   	   public Map<String, Object> pwdconfirm(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	   	         HttpServletResponse response, HttpSession session) throws Exception {
	   	      
	   	      logger.info("+ Start " + className + ".pwdconfirm");
	   	      logger.info("   - paramMap : " + paramMap);
	   	      
	   	      String loginID = (String) session.getAttribute("loginID");
	   	      paramMap.put("loginID", loginID);
	   	      
	   	      // Controller  Service  Dao  SQL
	   	      UserInfo passwordconfirm = mngumgService.pwdconfirm(paramMap);
	   	      
	   	      Map<String, Object> returnmap = new HashMap<String, Object>();
	   	      
	   	      returnmap.put("passwordconfirm",passwordconfirm);
	   	      
	   	      logger.info("+ End " + className + ".pwdconfirm");

	   	      return returnmap;
	   	   }
	   	   
	   	   /*비밀번호 변경*/
	   	   @RequestMapping("changepassword.do")
	   	   @ResponseBody
	   	   public Map<String, Object> changepassword(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	   				HttpServletResponse response, HttpSession session) throws Exception{
	   		   
	   		   logger.info("+ Start " + className + ".changepassword");
	   		   logger.info("   - paramMap : " + paramMap);
	   			
	   		   String action = (String)paramMap.get("action");
	   		   paramMap.put("loginid", (String) session.getAttribute("loginId"));
	   		   
	   		   
	   		   logger.info("   - ########### : " + action);
	   		   
	   		   logger.info("   - ########### : " + session);
	   		   
	   		   int returncval = 0;
	   		      
	   		      if("U".equals(action)) {
	   		    	  returncval = mngumgService.changepwd(paramMap);
	   		      }
	   		      
	   		      Map<String, Object> returnmap = new HashMap<String, Object>();
	   		      
	   		      returnmap.put("returncval", returncval);
	   		      
	   		      logger.info("+ End " + className + ".changepassword");

	   		      return returnmap;
	   		   }
	      
	   }
	      

