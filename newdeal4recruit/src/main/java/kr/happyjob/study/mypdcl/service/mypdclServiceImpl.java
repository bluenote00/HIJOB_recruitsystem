package kr.happyjob.study.mypdcl.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.mypdcl.dao.mypdclDao;
import kr.happyjob.study.mypdcl.model.mypdclModel;
import kr.happyjob.study.myplil.model.myplilModel;



@Service
public class mypdclServiceImpl implements mypdclService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
    mypdclDao mypdcldao;
    
    
	@Value("${fileUpload.rootPath}")
	private String rootPath;    // W:\\FileRepository
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualrootPath;  // /serverfile
	
	@Value("${fileUpload.noticePath}")
	private String noticePath;   // notice
		
	
	/** 목록 조회 */
	public List<mypdclModel> declarelist(Map<String, Object> paramMap) throws Exception {
		
		return mypdcldao.declarelist(paramMap);
				
	}
	
	
//	
//
//	   /** 좋아요 목록 조회 */
//	   public List<myplilModel> likelist(Map<String, Object> paramMap) throws Exception {
//	           
//	      return myplildao.likelist(paramMap);
//	   }
//	
	
	/** 목록 카운트 조회 */
	public int countdeclarelist(Map<String, Object> paramMap) throws Exception {
				
		return mypdcldao.countdeclarelist(paramMap);
	}
	
	
	/** 한건 조회 */
	public mypdclModel declareselectone(Map<String, Object> paramMap) throws Exception {
		
		return mypdcldao.declareselectone(paramMap);
	}
	
	/** 등록 */
	public int mypdclinsert(Map<String, Object> paramMap) throws Exception {
//		paramMap.put("fileprc", "N");
		return mypdcldao.declareNewinsert(paramMap);
	}
	
	/** 수정 */
	public int mypdclupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return mypdcldao.mypdclupdate(paramMap);
	}
	
	/** 삭제 */
	public int mypdcldelete(Map<String, Object> paramMap) throws Exception {
		return mypdcldao.mypdcldelete(paramMap);
	}
	
	/**  좋아요 갱신  **/
	  public int mypdclrefresh(Map<String, Object> paramMap) throws Exception {
		  
		  return mypdcldao.declareRefresh(paramMap);
		  }
	  
	  /**  블랙 추가  **/
	  public int mypdclblack(Map<String, Object> paramMap) throws Exception {
		  
		  return mypdcldao.declareBlack(paramMap);
		  }  
	  
	  
		
	  /**  블랙 대상자 Null 값 확인   **/
	  public int mypdclblackNullcheck(Map<String, Object> paramMap) throws Exception {
		  
		  return mypdcldao.declareBlackNullcheck(paramMap);
		  }  
	
	  /**블랙리스트 권한 변경**/
	  public int mypdclblackUsertype(Map<String, Object> paramMap) throws Exception {
		  
		  return mypdcldao.declareblackUsertype(paramMap);
		  } 
	  
//	
//	/** 등록 파일 */
//	public int noticeinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
//		
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
//		
		// private String rootPath;    // W:\\FileRepository
		// private String virtualrootPath;  // /serverfile
		// private String noticePath;   // notice
//		
//		String noticedir = File.separator + noticePath + File.separator;
//		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
//		Map filereturn = fileup.uploadFiles();
//		
//		//map.put("file_nm", file_nm);
//        //map.put("file_size", file_Size);
//        //map.put("file_loc", file_loc);
//        //map.put("vrfile_loc", vrfile_loc);
//        //map.put("fileExtension", fileExtension);
//		
//		String upfile = (String) filereturn.get("file_nm");
//		paramMap.put("fileprc", "Y");
//		
//		if(upfile == "" || upfile == null) {
//			paramMap.put("fileexist", "N");
//		} else {
//			paramMap.put("filereturn", filereturn);
//			paramMap.put("fileexist", "Y");
//			
//			mngNotDao.fileinsert(paramMap);
//		}
//		
//		return mngNotDao.noticeinsert(paramMap);
//	}
//	
//	/** 수정 파일 */
//	public int noticeupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
//		
//		NoticeModel selectone = mngNotDao.noticeselectone(paramMap);
//		
//		if(selectone.getFile_name() != "" && selectone.getFile_name() != null) {
//			File attfile = new File(selectone.getPhysic_path());     
//			attfile.delete();
//			
//			//notice_no			
//			// tb_file delete
//			mngNotDao.deletefileinfo(paramMap);
//		} 
//				
//				
//		
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
//				
//		String noticedir = File.separator + noticePath + File.separator;
//		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
//		Map filereturn = fileup.uploadFiles();
//				
//		String upfile = (String) filereturn.get("file_nm");
//		paramMap.put("fileprc", "Y");
//		
//		if(upfile == "" || upfile == null) {
//			paramMap.put("fileexist", "N");
//		} else {
//			paramMap.put("filereturn", filereturn);
//			paramMap.put("fileexist", "Y");
//			
//			mngNotDao.fileinsert(paramMap);
//		}
//		
//		return mngNotDao.noticeupdatefile(paramMap);		
//		
//	}
//	
//	/** 삭제  파일*/
//	public int noticedeletefile(Map<String, Object> paramMap) throws Exception {
//		
//        NoticeModel selectone = mngNotDao.noticeselectone(paramMap);
//		
//		if(selectone.getFile_name() != "" && selectone.getFile_name() != null) {
//			File attfile = new File(selectone.getPhysic_path());     
//			attfile.delete();
//			
//			//notice_no			
//			// tb_file delete
//			mngNotDao.deletefileinfo(paramMap);
//		} 
//		
//		return mngNotDao.noticedeletefile(paramMap);
	   
	}

