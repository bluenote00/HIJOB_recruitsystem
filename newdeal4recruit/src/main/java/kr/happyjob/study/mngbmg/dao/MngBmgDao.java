package kr.happyjob.study.mngbmg.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mngbmg.model.MngBmgModel;

public interface MngBmgDao {

	/**  목록 조회 */
	public List<MngBmgModel> qnalist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countqnalist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public MngBmgModel qnaselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int qnainsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int qnaupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int qnadelete(Map<String, Object> paramMap) throws Exception;
	

	
	
}
