package kr.happyjob.study.mypdcl.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mypdcl.model.mypdclModel;


public interface mypdclDao {

	/**  목록 조회 */
	public List<mypdclModel> declarelist(Map<String, Object> paramMap) throws Exception;
	
    /** 목록 카운트 조회 */
	public int countdeclarelist(Map<String, Object> paramMap) throws Exception;

	/** 한건 조회 */
	public mypdclModel declareselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int declareNewinsert(Map<String, Object> paramMap) throws Exception;
	
	
	/** 수정 */
	public int mypdclupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int mypdcldelete(Map<String, Object> paramMap) throws Exception;
	
	 /**  좋아요 갱신 */
	public int declareRefresh(Map<String, Object>paramMap) throws Exception; 
	   
	 /**  블랙 추가 */
	public int declareBlack(Map<String, Object>paramMap) throws Exception;
	
	 /**  블랙 대상자 Null 값체크  */
	public int declareBlackNullcheck(Map<String, Object>paramMap) throws Exception;
	
	  /**블랙리스트 권한 변경 **/
	public int declareblackUsertype(Map<String, Object>paramMap) throws Exception;
		
		   
//	/** 등록 파일 */
//	public int noticeinsertfile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 수정 파일 */
//	public int noticeupdatefile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 삭제  파일*/
//	public int noticedeletefile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 파일 등록 */
//	public int fileinsert(Map<String, Object> paramMap) throws Exception;
//	
//	/** 파일 정보 삭제 */
//	public int deletefileinfo(Map<String, Object> paramMap) throws Exception;
	
	
}
