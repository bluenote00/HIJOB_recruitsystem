package kr.happyjob.study.cmuRev.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.cmuRev.model.ReviewModel;

public interface CmuRevDao {

	/**  목록 조회 */
	public List<ReviewModel> reviewlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countreviewlist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public ReviewModel reviewselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int reviewinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int reviewupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int reviewdelete(Map<String, Object> paramMap) throws Exception;
	
	
	
}
