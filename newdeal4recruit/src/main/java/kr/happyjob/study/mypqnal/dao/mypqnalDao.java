package kr.happyjob.study.mypqnal.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mypqnal.model.mypqnalModel;


public interface mypqnalDao {

	/**  목록 조회 */
	public List<mypqnalModel> searchquestionlist(Map<String, Object> paramMap) throws Exception;
	
    /** 목록 카운트 조회 */
	public int countquestionlist(Map<String, Object> paramMap) throws Exception;

	/** 한건 조회 */
	public mypqnalModel questionselectone(Map<String, Object> paramMap) throws Exception;
	
//	/** 등록 */
//	public int noticeinsert(Map<String, Object> paramMap) throws Exception;
//	
	
	/** 수정 */
	public int questionupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int questiondelete(Map<String, Object> paramMap) throws Exception;
//	
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
