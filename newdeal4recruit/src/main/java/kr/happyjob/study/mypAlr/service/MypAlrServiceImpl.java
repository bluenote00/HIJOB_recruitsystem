package kr.happyjob.study.mypAlr.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.mypAlr.dao.MypAlrDao;
import kr.happyjob.study.mypAlr.model.AlertModel;


@Service
public class MypAlrServiceImpl implements MypAlrService {

	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	private final String className = this.getClass().toString();
	
	@Autowired
	MypAlrDao mypAlrDao;
	

	/** 목록 조회 */
	public List<AlertModel> alertlist(Map<String, Object> paramMap) throws Exception {
		
		return mypAlrDao.alertlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countalertlist(Map<String, Object> paramMap) throws Exception {
				
		return mypAlrDao.countalertlist(paramMap);
	}
	
	/** 한건 조회 */
	public AlertModel alertselectone(Map<String, Object> paramMap) throws Exception {
		
		return mypAlrDao.alertselectone(paramMap);
	}
	
	/** 수정 */
	public int alertupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return mypAlrDao.alertupdate(paramMap);
	}
	
	/** 삭제 */
	public int alertdelete(Map<String, Object> paramMap) throws Exception {
		return mypAlrDao.alertdelete(paramMap);
	}
	

	
}
