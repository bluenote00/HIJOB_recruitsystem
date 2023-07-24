package kr.happyjob.study.mypqnal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import kr.happyjob.study.mypqnal.model.mypqnalModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;


public interface mypqnalService {

	/**  목록 조회 */
	public List<mypqnalModel> questionlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countquestionlist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public mypqnalModel questionselectone(Map<String, Object> paramMap) throws Exception;
	
//	/** 등록 */
//	public int noticeinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int mypqnalupdate(Map<String, Object> paramMap) throws Exception;
	
	
	/** 삭제 */
	public int mypqnaldelete(Map<String, Object> paramMap) throws Exception;
//	
//	/** 등록 파일 */
//	public int noticeinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
//	
//	/** 수정 파일 */
//	public int noticeupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
//	
//	/** 삭제  파일*/
//	public int noticedeletefile(Map<String, Object> paramMap) throws Exception;
//	
	
	
}
