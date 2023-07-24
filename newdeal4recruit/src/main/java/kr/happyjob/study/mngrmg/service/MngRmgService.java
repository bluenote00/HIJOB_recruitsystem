package kr.happyjob.study.mngrmg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mngrmg.model.MngRmgModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface MngRmgService {

	/**  목록 조회 */
	public List<MngRmgModel> revlist(Map<String, Object> paramMap) throws Exception;  //Map<키, 값>
	
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
