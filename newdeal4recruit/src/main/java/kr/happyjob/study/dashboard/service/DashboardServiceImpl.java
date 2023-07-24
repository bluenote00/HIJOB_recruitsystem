package kr.happyjob.study.dashboard.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.dashboard.dao.DashboardDao;
import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.recors.model.RecorsModel;

@Service
public class DashboardServiceImpl implements DashboardService {
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();
   
   @Autowired
   DashboardDao dashboardDao;
	   
   @Override
   public DashboardModel goChart(Map<String, Object> paramMap) throws Exception {
      
	   DashboardModel goChart = dashboardDao.goChart(paramMap);
      
      return goChart;
   }
   
	@Override
	public int cntEngineer(Map<String, Object> paramMap) throws Exception {
		int cntEngineer = dashboardDao.cntEngineer(paramMap);
		return cntEngineer;
	}
	
	@Override
	public int cntCompany(Map<String, Object> paramMap) throws Exception {
		int cntCompany = dashboardDao.cntCompany(paramMap);
		return cntCompany;
	}
	
	@Override
	public int cntProject(Map<String, Object> paramMap) throws Exception {
		int cntProject = dashboardDao.cntProject(paramMap);
		return cntProject;
	}

	/** 기업 - 리스트 조회 - 최신순 */
	@Override
	public List<DashboardModel> adverlist_new(Map<String, Object> paramMap) throws Exception {
		List<DashboardModel> adverlist_new = dashboardDao.adverlist_new(paramMap);
		return adverlist_new;
	}
	
	/** 기업 - 리스트 조회 - 좋아요순 */
	@Override
	public List<DashboardModel> adverlist_like(Map<String, Object> paramMap) throws Exception {
		List<DashboardModel> adverlist_like = dashboardDao.adverlist_like(paramMap);
		return adverlist_like;
	}
	
	/** 기업 - 공고 + 스킬 리스트 낱개로 가져오기*/
	@Override
	public List<DashboardModel> skillist(Map<String, Object> paramMap) throws Exception {
		List<DashboardModel> skillist = dashboardDao.skillist(paramMap);
		return skillist;
	}
	
	/** 받은 쪽지 정보 가져오기 */
	@Override
	public List<DashboardModel> messages(Map<String, Object> paramMap) throws Exception {
		List<DashboardModel> messages = dashboardDao.messages(paramMap);
		return messages;
	}

	@Override
	public List<RecorsModel> openresumelist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dashboardDao.openresumelist(paramMap);
	}

	@Override
	public int countopenlist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dashboardDao.countopenlist(paramMap);
	}
	
	

}
