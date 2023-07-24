package kr.happyjob.study.dashboard.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.recors.model.RecorsModel;
 
public interface DashboardDao {
	
	public List<RecorsModel> openresumelist(Map<String, Object> paramMap) throws Exception;
	   
	public int countopenlist(Map<String, Object> paramMap) throws Exception;
	
	public DashboardModel goChart(Map<String, Object> paramMap) throws Exception;

	// 엔지니어 수 조회
	public int cntEngineer(Map<String, Object> paramMap)throws Exception ;
	
	// 기업 수 조회
	public int cntCompany(Map<String, Object> paramMap)throws Exception ;
	
	// 프로젝트 수 조회
	public int cntProject(Map<String, Object> paramMap)throws Exception ;
	
	/** 기업 - 리스트 조회 - 최신순 */
	public List<DashboardModel> adverlist_new(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 리스트 조회 - 좋아요순 */
	public List<DashboardModel> adverlist_like(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 + 스킬 리스트 낱개로 가져오기*/
	public List<DashboardModel> skillist(Map<String, Object> paramMap) throws Exception;
	
	/** 받은 쪽지 정보 가져오기*/
	public List<DashboardModel> messages(Map<String, Object> paramMap) throws Exception;
	
}
