package kr.happyjob.study.mngrmg.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mngrmg.model.MngRmgModel;

public interface MngRmgDao {

	/**  목록 조회 */
	public List<MngRmgModel> revlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countrevlist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public MngRmgModel revselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int revinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int revupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int revdelete(Map<String, Object> paramMap) throws Exception;
	

	
	
}
