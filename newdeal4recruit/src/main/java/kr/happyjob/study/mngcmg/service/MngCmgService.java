package kr.happyjob.study.mngcmg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mngcmg.model.MngCmgModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface MngCmgService {
	
	/**  목록 조회 */
	public List<MngCmgModel> complist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countcomplist(Map<String, Object> paramMap) throws Exception;
	
	/** 유저 타입 선택 데이터 목록 조회 */
	public List<MngCmgModel> complistByUserType(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public MngCmgModel compselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 등록 */
	public int compinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int compupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int compdelete(Map<String, Object> paramMap) throws Exception;
	
	
	
}
