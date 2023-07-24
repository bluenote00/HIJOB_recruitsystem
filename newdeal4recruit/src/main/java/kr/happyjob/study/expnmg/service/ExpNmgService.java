package kr.happyjob.study.expnmg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.expnmg.model.ExpNmgModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface ExpNmgService {
	
	/**  목록 조회 */
	public List<ExpNmgModel> noticelist(Map<String, Object> paramMap) throws Exception;  
	
	/** 목록 카운트 조회 */
	public int countnoticelist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public ExpNmgModel noticeselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int noticeinsert(Map<String, Object> paramMap) throws Exception;
		
	/** 수정 */
	public int noticeupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int noticedelete(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 파일 */
	public int noticeinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	/** 수정 파일 */
	public int noticeupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	/** 삭제  파일*/
	public int noticedeletefile(Map<String, Object> paramMap) throws Exception;
	
	
	public List<ExpNmgModel> noticeylist(Map<String, Object> paramMap) throws Exception;  
	
	
}
