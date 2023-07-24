package kr.happyjob.study.mngtmg.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mngtmg.model.MngTmgModel;

public interface MngTmgDao {
	
	/**  목록 조회 */
	public List<MngTmgModel> termlist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int counttermlist(Map<String, Object> paramMap) throws Exception;

}