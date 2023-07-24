package kr.happyjob.study.mypdcl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mypdcl.model.mypdclModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;


public interface mypdclService {

	/**  목록 조회 */
	public List<mypdclModel> declarelist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countdeclarelist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public mypdclModel declareselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 신고등록 */
	public int mypdclinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int mypdclupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int mypdcldelete(Map<String, Object> paramMap) throws Exception;
	
    /** 좋아요 갱신 **/
    public int mypdclrefresh(Map<String, Object>paramMap) throws Exception;
    
    /** 신고 블랙 추가 **/
    public int mypdclblack(Map<String, Object>paramMap) throws Exception;
    
    /** 블랙대상 null 값 체크 **/
    public int mypdclblackNullcheck(Map<String, Object>paramMap) throws Exception;
    
    /**블랙리스트 권한 변경**/
    public int mypdclblackUsertype(Map<String, Object>paramMap) throws Exception;
    
    
    
	  
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
