package kr.happyjob.study.myprmg.service;

import java.io.File;
import java.util.HashMap;
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

import kr.happyjob.study.myprmg.dao.MypRmgDao;
import kr.happyjob.study.myprmg.dto.MypRmgDto;


@Service
public class MypRmgServiceImpl implements MypRmgService {
 
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();
   
   @Autowired
   MypRmgDao mypRmgDao;
   
	@Value("${fileUpload.rootPath}")
	private String rootPath;    // W:\\FileRepository
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualrootPath;  // /serverfile
	
	@Value("${fileUpload.corecruitPath}")
	private String corecruitPath;   // corecruit
	
	/** 기업 - 리스트 조회 */
	public List<MypRmgDto> adverlist(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.adverlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countnoticelist(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.countnoticelist(paramMap);
	}
		
	/** 기업 - 공고 한건 조회 */
	public MypRmgDto adverselectone(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.adverselectone(paramMap);
	}

	/** 공고 Max 번호 구하기 */
	public int maxcorecruit(Map<String, Object> paramMap) throws Exception{
		return mypRmgDao.maxcorecruit(paramMap);
	}
	
	/** 기업 - 공고 한건 조회 + 스킬 리스트 낱개로 가져오기*/
	public List<MypRmgDto> skillist(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.skillist(paramMap);
	}
	
	/** 기업 -  회사 & 작성자 정보 */
	public MypRmgDto writerinfo(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.writerinfo(paramMap);
	}

	/** 기업 - 공고 지원하기 */
	public int adverapply(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		return mypRmgDao.adverapply(paramMap);
	}
	
	/** 기업 - 공고 작성 */
	public int adversave(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
       int returnvalue = 0;

		String corecruitdir = File.separator + corecruitPath + File.separator;
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, corecruitdir);
		Map filereturn = fileup.uploadFiles();		
		
		String upfile = (String) filereturn.get("file_nm");
		
		if(upfile == "" || upfile == null) {
			paramMap.put("fileexist", "N");
		} else {
			paramMap.put("filereturn", filereturn);
			paramMap.put("fileexist", "Y");
			returnvalue = mypRmgDao.fileinsert(paramMap);
		}
		
		returnvalue = mypRmgDao.adversave(paramMap);
		
		Map<String, Object> skillMap = new HashMap<String, Object>();
		
		String skillcd = (String) paramMap.get("dtlcombo1");
		if(skillcd != "" && skillcd != null) {
			skillMap.put("dtlcodeCD", skillcd);
			
			returnvalue = mypRmgDao.adversaveskill(skillMap);
		}
		
		 skillcd = (String) paramMap.get("dtlcombo2");
		if(skillcd != "" && skillcd != null) {
			skillMap.put("dtlcodeCD", skillcd);
			
			returnvalue = mypRmgDao.adversaveskill(skillMap);
		}
		
		 skillcd = (String) paramMap.get("dtlcombo3");
		if(skillcd != "" && skillcd != null) {
			skillMap.put("dtlcodeCD", skillcd);
			
			returnvalue = mypRmgDao.adversaveskill(skillMap);
		}
		
		return returnvalue;
	}
		
	/** 기업 - 공고 수정 */
	public int adverupdate(Map<String, Object> paramMap) throws Exception {
		return mypRmgDao.adverupdate(paramMap);
	}

	/** 기업 - 공고 삭제 */
	public int adverdelete(Map<String, Object> paramMap) throws Exception {	
		return mypRmgDao.adverdelete(paramMap);
	}

	/** 기업 - 공고 파일 삭제 */
	public int adverfiledelete(Map<String, Object> paramMap) throws Exception {	
		return mypRmgDao.adverfiledelete(paramMap);
	}
	
	/** 기업 - 공고 기술 삭제 */
	public int adverskilldelete(Map<String, Object> paramMap) throws Exception {	
		return mypRmgDao.adverskilldelete(paramMap);
	}

}