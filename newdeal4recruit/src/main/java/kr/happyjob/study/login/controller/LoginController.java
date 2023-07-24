package kr.happyjob.study.login.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import kr.happyjob.study.common.comnUtils.ComnCodUtil;
import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.service.LoginService;
import kr.happyjob.study.login.service.KakaoService;
import kr.happyjob.study.login.service.MailSendService;
import kr.happyjob.study.system.model.ComnCodUtilModel;







@Controller

public class LoginController {
   // 커밋 테스트 됌 -동철


// Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   
   @Autowired
   LoginService loginService;
   
   @Autowired
   MailSendService mailSendService;
   
   @Autowired
	private KakaoService ks;


   /**
* index 접속 시 로그인 페이지로 이동한다.
* 
* @param   Model result - Spring model object
* @param   Map paramMap - Request Param object
* @param   HttpServletRequest request - Servlet request object
* @param   HttpServletResponse response - Servlet response object
* @param   HttpSession session - Http session Object
* @return   String - page navigator
* @throws Exception
*/

   
   
   
   @RequestMapping("login.do")
	   public String index(Model result, @RequestParam Map<String, String> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	
	  logger.info("+ Start LoginController.login.do");
			
      logger.info("+ End LoginController.login.do");

  return "/login/login";
   }
   

   
   
   
   
   
   /**
* 사용자 로그인을 처리한다.
* 
* @param   Model result - Spring model object
* @param   Map paramMap - Request Param object
* @param   HttpServletRequest request - Servlet request object
* @param   HttpServletResponse response - Servlet response object
* @param   HttpSession session - Http session Object
* @return   String - page navigator
* @throws Exception
*/
   @RequestMapping("loginProc.do")
   @ResponseBody
   public Map<String, Object> loginProc(Model model, @RequestParam Map<String, Object> paramMap,
           HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

       logger.info("+ Start LoginController.loginProc.do");
       logger.info("   - ParamMap : " + paramMap);

       // 사용자 로그인
       LgnInfoModel lgnInfoModel = loginService.loginProc(paramMap);

       String result;
       String resultMsg;
       Map<String, Object> resultMap = new HashMap<String, Object>();

       if (lgnInfoModel != null) {
           String userStatus = lgnInfoModel.getUser_status();
           if (userStatus != null) {
               // 가입 승인이 완료된 경우
               // 로그인 처리 로직
               // 사용자 메뉴 권한 조회
               paramMap.put("usr_sst_id", lgnInfoModel.getUsr_sst_id());
               paramMap.put("userType", lgnInfoModel.getMem_author());
               // 메뉴 목록 조회 0depth
               List<UsrMnuAtrtModel> listUsrMnuAtrtModel = loginService.listUsrMnuAtrt(paramMap);
               // 메뉴 목록 조회 1depth
               for (UsrMnuAtrtModel list : listUsrMnuAtrtModel) {
                   Map<String, Object> resultMapSub = new HashMap<String, Object>();
                   resultMapSub.put("lgn_Id", paramMap.get("lgn_Id"));
                   resultMapSub.put("hir_mnu_id", list.getMnu_id());
                   resultMapSub.put("userType", lgnInfoModel.getMem_author());
                   list.setNodeList(loginService.listUsrChildMnuAtrt(resultMapSub));
               }

               session.setAttribute("loginId", lgnInfoModel.getLgn_id()); // 로그인 ID
               session.setAttribute("userNm", lgnInfoModel.getUsr_nm()); // 사용자 성명
               session.setAttribute("usrMnuAtrt", listUsrMnuAtrtModel);
               session.setAttribute("userType", lgnInfoModel.getMem_author()); // 로그인 사용자 권한 (A: 관리자, C: 기업회원, P: 일반회원)
               session.setAttribute("user_businesstype", lgnInfoModel.getUser_businesstype());
               session.setAttribute("user_coname", lgnInfoModel.getUser_coname());
               session.setAttribute("user_status", lgnInfoModel.getUser_status());

               resultMap.put("loginId", lgnInfoModel.getLgn_id());
               resultMap.put("userNm", lgnInfoModel.getUsr_nm());
               resultMap.put("usrMnuAtrt", listUsrMnuAtrtModel);
               resultMap.put("userType", lgnInfoModel.getMem_author());
               resultMap.put("user_businesstype", lgnInfoModel.getUser_businesstype());
               resultMap.put("user_coname", lgnInfoModel.getUser_coname());
               resultMap.put("user_status", lgnInfoModel.getUser_status());

               result = "SUCCESS";
               resultMsg = "가입이 승인되었습니다.";
           } else {
               result = "FALSE";
               resultMsg = "가입 승인 대기 중입니다.";
           }
       } else {
           result = "FALSE";
           resultMsg = "사용자 로그인 정보가 일치하지 않습니다.";
       }

       resultMap.put("result", result);
       resultMap.put("resultMsg", resultMsg);

       logger.info("+ End LoginController.loginProc.do");
       logger.info("+ End LoginController.loginProc.do" + resultMap);

       return resultMap;
   }


   
   /**
* 로그아웃
* @param request
* @param response
* @param session
* @return
*/
   @RequestMapping(value = "/loginOut.do")
   public ModelAndView loginOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
                  
      ModelAndView mav = new ModelAndView();
      session.invalidate();
      
   // 상태 토큰으로 사용할 랜덤 문자열 생성

      
      mav.setViewName("redirect:/login.do");
      
      return mav;
   }
   /*회원가입*/
   @RequestMapping("register.do")
   @ResponseBody
   public Map<String, Object> registerUser(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
	   logger.info("+ Start " + className + ".registerUser");
	   logger.info("   - paramMap : " + paramMap);
		
	   String action = (String)paramMap.get("action");
	   String result = "SUCCESS";
	   String resultMsg;
	   
	   if("I".equals(action)) {
		   // 가입 승인 대기 유저타입 부여
	       paramMap.put("user_type", "H");
	       loginService.registerUser(paramMap);
		   resultMsg = "가입 요청 완료";
	   } else {
		   
		   result = "FAIL";
		   resultMsg = "가입 요청 실패";
	   }
	   
	   
	   // login ID 스킬 delete
	   
	   // insert
	   
	   //paramMap
	   
	   
	   //전문기술
	   List<ComnCodUtilModel> lg = ComnCodUtil.getComnCod("LanguageCD");
	   
	   for(ComnCodUtilModel lgitem : lg) {
		   String groupitem = lgitem.getGrp_cod();
		   String dtlitem = lgitem.getDtl_cod();
		   
		   try {
			   //String paramitem = (String) paramMap.get(dtlitem);
			   
			   paramMap.put("skillgrpcd", groupitem);
			   paramMap.put("skilldtlcd", dtlitem);
			   
			   //insert 
			   
		   } catch (Exception e) {
			   
		   }
	   }   
	   
	   List<ComnCodUtilModel> web = ComnCodUtil.getComnCod("webCD");
	   
	   for(ComnCodUtilModel webitem : web) {
		   String groupitem = webitem.getGrp_cod();
		   String dtlitem = webitem.getDtl_cod();
		   
		   try {
			   //String paramitem = (String) paramMap.get(dtlitem);
			   
			   paramMap.put("skillgrpcd", groupitem);
			   paramMap.put("skilldtlcd", dtlitem);
			   
			   //insert 
			   
		   } catch (Exception e) {
			   
		   }
	   }   
	   
	   List<ComnCodUtilModel> db = ComnCodUtil.getComnCod("DBCD");
	   
	   for(ComnCodUtilModel dbitem : db) {
		   String groupitem = dbitem.getGrp_cod();
		   String dtlitem = dbitem.getDtl_cod();
		   
		   try {
			   //String paramitem = (String) paramMap.get(dtlitem);
			   
			   paramMap.put("skillgrpcd", groupitem);
			   paramMap.put("skilldtlcd", dtlitem);
			   
			   //insert 
			   
		   } catch (Exception e) {
			   
		   }
	   }
	   
	   
	   List<ComnCodUtilModel> ws = ComnCodUtil.getComnCod("WSCD");
	   
	   for(ComnCodUtilModel wsitem : ws) {
		   String groupitem = wsitem.getGrp_cod();
		   String dtlitem = wsitem.getDtl_cod();
		   
		   try {
			   //String paramitem = (String) paramMap.get(dtlitem);
			   
			   paramMap.put("skillgrpcd", groupitem);
			   paramMap.put("skilldtlcd", dtlitem);
			   
			   //insert 
			   
		   } catch (Exception e) {
			   
		   }
	   }
	   
	   
	   
	   
	   Map<String, Object> resultMap = new HashMap<String, Object>();
	   resultMap.put("result", result);
	   resultMap.put("resultMsg", resultMsg);
	   
	   logger.info("+ End " + className + ".registerUser");
	   
	   return resultMap;
   }
   
   
   /*loginID 중복체크*/
   @RequestMapping(value="check_loginID", method=RequestMethod.POST)
   @ResponseBody
   public int check_loginID(LgnInfoModel model) throws Exception{
	   
	   logger.info("+ Start " + className + ".loginID_check");
	   int result = loginService.check_loginID(model);
	   logger.info("+ End " + className + ".loginID_check");
	   return result;
   }
   
   
   
   /*이메일 중복체크*/
   @RequestMapping(value="check_email", method=RequestMethod.POST)
   @ResponseBody
   public int check_email(LgnInfoModel model) throws Exception{
	   logger.info("+ Start " + className + ".loginID_check");
	   int result = loginService.check_email(model);
	   logger.info("+ End " + className + ".loginID_check");
	   return result;
   }
   /**
*  사용자 id 찾기
*/
   @RequestMapping("selectFindInfoId.do")
   @ResponseBody
   public Map<String, Object> selectFindInfoId(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".selectFindInfoId");
  
  logger.info("   - paramMap : " + paramMap);
//      if(!paramMap.get("cpn_ctr").toString().equals("") && !paramMap.get("cpn_ctr").toString().equals("000")){
//         paramMap.put("type", "P");
//      }else if(!paramMap.get("eml").toString().equals("")){
//         paramMap.put("type", "E");
//      }
  String result;
  String resultMsg;
  LgnInfoModel resultModel= loginService.selectFindId(paramMap);
  
/*  	if(paramMap.get("lgn_id") == null){
		// 사용자 id 조회        
		System.out.println(loginService.selectFindId(paramMap));
		System.out.println("id조회!!!!!!!");
	}else{
		// 사용자 pw 조회
		System.out.println(loginService.selectFindPw(paramMap));
		System.out.println("pw조회!!!!!!!");
	}*/
  
  if (resultModel != null) {  
  result = "SUCCESS";
  resultMsg = "조회 성공";

  	
  }else {
      result = "FALSE";
      resultMsg = "조회 실패";
   }
  

  Map<String, Object> resultMap = new HashMap<String, Object>();

  resultMap.put("result", result);
  resultMap.put("resultMsg", resultMsg);
  resultMap.put("resultModel", resultModel);
  
  System.out.println(result);
  System.out.println(resultMsg);
  System.out.println(resultModel);
  System.out.println(resultMap);
  
  logger.info("+ End " + className + ".selectFindInfoId");
      
      return resultMap;
     
   }
   
   
   
   //사용자 pw 조회
   @RequestMapping("selectFindInfoPw.do")
   @ResponseBody
   public Map<String, Object> selectFindInfoPw(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".selectFindInfoPw");
  
      logger.info("   - paramMap : " + paramMap);

  String result;
  String resultMsg;
  LgnInfoModel resultModelPw= loginService.selectFindPw(paramMap);
  
  if (resultModelPw != null) {  
  result = "SUCCESS";
  resultMsg = "조회 성공";

  }else {
      result = "FALSE";
      resultMsg = "조회 실패";
   }

  Map<String, Object> resultMap = new HashMap<String, Object>();

  resultMap.put("result", result);
  resultMap.put("resultMsg", resultMsg);
  resultMap.put("resultModel", resultModelPw);
  
/*  System.out.println(result);
  System.out.println(resultMsg);
  System.out.println(resultModelPw);
  System.out.println(resultMap);*/
  
  logger.info("+ End " + className + ".selectFindInfoPw");
      
     return resultMap;
     
   }
   
   
   /**사용자 PW 찾기 ID 체크*/
   @RequestMapping("registerIdCheck.do")
   @ResponseBody
   public Map<String, Object> registerIdCheck(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	   
	   logger.info("+ Start " + className + ".registerIdCheck");
	   
	   logger.info("   - paramMap : " + paramMap);

	  String result;
	  String resultMsg;
	  LgnInfoModel registerIdCheck= loginService.registerIdCheck(paramMap);
	  
	  if (registerIdCheck != null) {  
		  result = "SUCCESS";
		  resultMsg = "조회 성공";

		}else {
		      result = "FALSE";
		      resultMsg = "조회 실패";
		  	  }
	  
	  Map<String, Object> resultMap = new HashMap<String, Object>();

	  resultMap.put("result", result);
	  resultMap.put("resultMsg", resultMsg);
	  resultMap.put("resultModel", registerIdCheck);
	  
/*	  System.out.println(result);
	  System.out.println(resultMsg);
	  System.out.println(registerIdCheck);
	  System.out.println(resultMap);*/
	  
	  logger.info("+ End " + className + ".registerIdCheck");
	   
	   return resultMap;
   }
   

   /**메일 발송*/
   @RequestMapping("sendmail.do")
   @ResponseBody
   public Map<String, Object> emailSendAuth(Model model, HttpServletRequest request, HttpServletResponse response, 
		   	HttpSession session) throws Exception {
	   logger.info("+ Start " + className + ".emailSendAuth");

	   String emailNum = request.getParameter("email");
	   String authNumId = "";
	   authNumId = mailSendService.RandomNum();
	   System.out.println(authNumId);
	   System.out.println(emailNum);
	   mailSendService.sendEmail(emailNum, authNumId);
	   
	   Map<String, Object> resultMap = new HashMap<String, Object>();
	   
	   //mv.setViewName("login/login");
	   resultMap.put("emailNum", emailNum);
	   resultMap.put("authNumId", authNumId);

	   System.out.println(emailNum);
	   System.out.println(authNumId);
	   System.out.println(resultMap);
	   logger.info("+ End " + className + ".emailSendAuth");
   
	   return resultMap;
   }
   
   
   /**네이버 로그인 api*/
	// CSRF 방지를 위한 상태 토큰 생성 코드
	// 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	

   @GetMapping("/naverLogin")
   public String naverLogin(Model result, @RequestParam Map<String, String> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	   
	   logger.info("+ Start " + className + ".naverLogin");
	   logger.info("   - paramMap : " + paramMap);
	   
	   //상태 토큰으로 사용할 랜덤 문자열 생성
	   String state = generateState();
	   
	   //세션 또는 별도의 저장 공간에 상태 토큰을 저장
	   session.setAttribute("naverstate", state);

	   return "/login/naverLogin";
	   }
   
   @RequestMapping(value="/naverLogincallback.do" , method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> naverLogincallback(Model result, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	   
	   logger.info("+ Start " + className + ".naverLogincallback");
	   logger.info("   - paramMap : " + paramMap);
	   	   
	   String resultmsg="OK";		   
	  // 들어온 id(email)  tb_userinfo loginid  check 
	  LgnInfoModel lgnInfoModel = loginService.naverloginProc(paramMap);
	  Map<String, Object> resultMap = new HashMap<String, Object>();
	  if (lgnInfoModel != null) {
	  paramMap.put("usr_sst_id", lgnInfoModel.getUsr_sst_id());
	  paramMap.put("userType",lgnInfoModel.getMem_author());
	  List<UsrMnuAtrtModel> listUsrMnuAtrtModel = loginService.listUsrMnuAtrt(paramMap);
	  for(UsrMnuAtrtModel list : listUsrMnuAtrtModel){
	        Map<String, Object> resultMapSub = new HashMap<String, Object>();
	        resultMapSub.put("lgn_Id", paramMap.get("lgn_Id")); 
	        resultMapSub.put("hir_mnu_id", list.getMnu_id());
	        resultMapSub.put("userType",lgnInfoModel.getMem_author());
	        list.setNodeList(loginService.listUsrChildMnuAtrt(resultMapSub));
	     }
	  session.setAttribute("loginId",lgnInfoModel.getLgn_id());                     //   로그인 ID
      session.setAttribute("userNm",lgnInfoModel.getUsr_nm());                  // 사용자 성명
      session.setAttribute("usrMnuAtrt", listUsrMnuAtrtModel);
      session.setAttribute("userType", lgnInfoModel.getMem_author());            // 로그린 사용자 권란       A: 관리자       C: 기업회원   P:일반회원
      
      
      resultMap.put("loginId",lgnInfoModel.getLgn_id()); 
      resultMap.put("userNm",lgnInfoModel.getUsr_nm()); 
      resultMap.put("usrMnuAtrt", listUsrMnuAtrtModel);
      resultMap.put("userType", lgnInfoModel.getMem_author());
	  resultMap.put("result", resultmsg); 
	  } else {
	 // 만약 없으면 회원가입  
	 //LgnInfoModel lgnInfoModel = loginService.loginProc(paramMap);
     String birthyear = (String) paramMap.get("birthyear");
	 String birthday2 = (String) paramMap.get("birthday");
	 String birthday = birthyear +"-"+birthday2;
	  
	 paramMap.put("birthday", birthday);
	 paramMap.put("user_type", "P");
	 paramMap.put("user_status", "Y");
	 paramMap.put("password", "1111");
	 
	  
	 loginService.naverRegisterUser(paramMap);
	  } 
	 return resultMap;
   }
   
// ==================== 카카오 로그인 ========================
   
/*code를 보내 access_Token 얻기*/
   @RequestMapping(value="/kakao", method=RequestMethod.GET)
	public String kakaoLogin(Model result, @RequestParam(value = "code", required = false) String code,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	   
	   logger.info("#########" + code);
		
		String access_Token = ks.getAccessToken(code);
		
		
		HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
		logger.info("###access_Token#### : " + access_Token);
		logger.info("###email#### : " + userInfo.get("email"));
		
		// 들어온 id(email)  tb_userinfo loginid  check 
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("email", userInfo.get("email"));
	    
	    LgnInfoModel lgnInfoModel = loginService.kakaologinProc(paramMap);
	    Map<String, Object> resultMap = new HashMap<String, Object>();
		
	    if (lgnInfoModel != null) {
	  	  paramMap.put("usr_sst_id", lgnInfoModel.getUsr_sst_id());
	  	  paramMap.put("userType",lgnInfoModel.getMem_author());
	  	  List<UsrMnuAtrtModel> listUsrMnuAtrtModel = loginService.listUsrMnuAtrt(paramMap);
	  	  
	  	  
	  	  for(UsrMnuAtrtModel list : listUsrMnuAtrtModel){
	  	        Map<String, Object> resultMapSub = new HashMap<String, Object>();
	  	        resultMapSub.put("lgn_Id", paramMap.get("lgn_Id")); 
	  	        resultMapSub.put("hir_mnu_id", list.getMnu_id());
	  	        resultMapSub.put("userType",lgnInfoModel.getMem_author());
	  	        list.setNodeList(loginService.listUsrChildMnuAtrt(resultMapSub));
	  	     }
	  	  	session.setAttribute("loginId",lgnInfoModel.getLgn_id());                     //   로그인 ID
	        session.setAttribute("userNm",lgnInfoModel.getUsr_nm());                  // 사용자 성명
	        session.setAttribute("usrMnuAtrt", listUsrMnuAtrtModel);
	        session.setAttribute("userType", lgnInfoModel.getMem_author());            // 로그린 사용자 권란       A: 관리자       C: 기업회원   P:일반회원
	        
	        
	        resultMap.put("loginId",lgnInfoModel.getLgn_id()); 
	        resultMap.put("userNm",lgnInfoModel.getUsr_nm()); 
	        resultMap.put("usrMnuAtrt", listUsrMnuAtrtModel);
	        resultMap.put("userType", lgnInfoModel.getMem_author());
	        
	  	  } else {
	  		  
	  	 // 만약 없으면 회원가입  
	  	  
	  	 paramMap.put("user_type", "P");
	  	 paramMap.put("user_status", "Y");
	  	 paramMap.put("password", "1111");
	  	 
	  	  
	  	 loginService.kakaoRegisterUser(paramMap);
	  	  } 
	    return "/login/kakaoLogin";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
   	}

}

   
   
/*	@RequestMapping("saveFileTest.do")
	@ResponseBody
	public Map<String, Object> saveFileTest(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start saveFileTest");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		
		
		if ("I".equals(action)) {
			//CmntBbsService.insertCmntBbs(paramMap, request); // 게시글 신규 저장 
			logger.info("  action  :  " + action);
			LoginService.insertFile(paramMap,request);
		} else if("U".equals(action)) {
			//CmntBbsService.updateCmntBbs(paramMap, request); // 게시글 수정 저장
			logger.info("  action  :  " + action);
			LoginService.updateFile(paramMap,request);
		} else {
			logger.info("  action  :  " + action);
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End saveFileTest");
		
		return resultMap;
	}*/
   
