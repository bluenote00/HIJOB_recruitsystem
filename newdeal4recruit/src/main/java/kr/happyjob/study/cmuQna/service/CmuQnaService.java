package kr.happyjob.study.cmuQna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.cmuQna.model.QuestionModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;
  
public interface CmuQnaService {

	/**  목록 조회 */
	public List<QuestionModel> questionlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countquestionlist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public QuestionModel questionselectone(Map<String, Object> paramMap) throws Exception;
	
	
	/** 등록 */
	public int questioninsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	public int questionupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 삭제 */
	public int questiondelete(Map<String, Object> paramMap) throws Exception;

	
	
}
