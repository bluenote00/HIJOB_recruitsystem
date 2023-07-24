package kr.happyjob.study.expnmg.service;

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
import kr.happyjob.study.expnmg.dao.ExpNmgDao;
import kr.happyjob.study.expnmg.model.ExpNmgModel;


@Service 
public class ExpNmgServiceImpl implements ExpNmgService {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ExpNmgDao expnmgDao;

	@Value("${fileUpload.rootPath}")
	private String rootPath;   // W:\\FileRepository
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualrootPath; // /serverfile
	
	@Value("${fileUpload.noticePath}")
	private String noticePath;  // notice
	
	
	/** 목록 조회 */
	public List<ExpNmgModel> noticelist(Map<String, Object> paramMap) throws Exception {
		
		return expnmgDao.noticelist(paramMap);
	}
		
	/** 목록 카운트 조회 */
	public int countnoticelist(Map<String, Object> paramMap) throws Exception {
		
		return expnmgDao.countnoticelist(paramMap);
	}
	
	/** 한건 조회 */
	public ExpNmgModel noticeselectone(Map<String, Object> paramMap) throws Exception {
		
		return expnmgDao.noticeselectone(paramMap);
	}
	
	/** 등록 */
	public int noticeinsert(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return expnmgDao.noticeinsert(paramMap);
	}
	
	/** 수정 */
	public int noticeupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return expnmgDao.noticeupdate(paramMap);
	}
	
	/** 삭제 */
	public int noticedelete(Map<String, Object> paramMap) throws Exception {
		return expnmgDao.noticedelete(paramMap);
	}
	
	/** 등록 파일 */
	public int noticeinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		// private String rootPath;    // W:\\FileRepository
		// private String virtualrootPath;  // /serverfile
		// private String noticePath;   // notice
		
		String noticedir = File.separator + noticePath + File.separator;
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
		Map filereturn = fileup.uploadFiles();
		
		//map.put("file_nm", file_nm);
        //map.put("file_size", file_Size);
        //map.put("file_loc", file_loc);
        //map.put("vrfile_loc", vrfile_loc);
        //map.put("fileExtension", fileExtension);
		
		String upfile = (String) filereturn.get("file_nm");
		paramMap.put("fileprc", "Y");
		
		if(upfile == "" || upfile == null) {
			paramMap.put("fileexist", "N");
		} else {
			paramMap.put("filereturn", filereturn);
			paramMap.put("fileexist", "Y");
			
			expnmgDao.fileinsert(paramMap);
		}
		
		return expnmgDao.noticeinsert(paramMap);
	}
 	
	/** 수정 파일 */
	public int noticeupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		ExpNmgModel selectone = expnmgDao.noticeselectone(paramMap);
		
		if(selectone.getAtt_name() != "" && selectone.getAtt_name() != null) {
			File attfile = new File(selectone.getAtt_phypath());     
			attfile.delete();
			
			//notice_no			
			// tb_file delete
			expnmgDao.deletefileinfo(paramMap);
		} 
				
				
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
				
		String noticedir = File.separator + noticePath + File.separator;
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
		Map filereturn = fileup.uploadFiles();
				
		String upfile = (String) filereturn.get("file_nm");
		paramMap.put("fileprc", "Y");
		
		if(upfile == "" || upfile == null) {
			paramMap.put("fileexist", "N");
		} else {
			paramMap.put("filereturn", filereturn);
			paramMap.put("fileexist", "Y");
			
			expnmgDao.fileinsert(paramMap);
		}
		
		return expnmgDao.noticeupdatefile(paramMap);		
		
	}
	
	/** 삭제  파일*/
	public int noticedeletefile(Map<String, Object> paramMap) throws Exception {
		
        ExpNmgModel selectone = expnmgDao.noticeselectone(paramMap);
		
		if(selectone.getAtt_name() != "" && selectone.getAtt_name() != null) {
			File attfile = new File(selectone.getAtt_phypath());     
			attfile.delete();
			
			//notice_no			
			// tb_file delete
			expnmgDao.deletefileinfo(paramMap);
		} 
		
		return expnmgDao.noticedeletefile(paramMap);
	}

	
	
		public List<ExpNmgModel> noticeylist(Map<String, Object> paramMap) throws Exception {
		
			return expnmgDao.noticeylist(paramMap);
		
		
		
	}	
}