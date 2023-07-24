package kr.happyjob.study.mypAlr.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mypAlr.model.AlertModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface MypAlrService {

	/**  목록 조회 */
	public List<AlertModel> alertlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countalertlist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public AlertModel alertselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int alertupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int alertdelete(Map<String, Object> paramMap) throws Exception;

		
	
}
