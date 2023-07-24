package kr.happyjob.study.mngbmg.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.mngbmg.dao.MngBmgDao;
import kr.happyjob.study.mngbmg.model.MngBmgModel;


@Service
public class MngBmgServiceImpl implements MngBmgService {  // implements 상속 받는 것 

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	MngBmgDao mngbmgDao;
	
	
	/** 목록 조회 */
	public List<MngBmgModel> qnalist(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.qnalist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countqnalist(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.countqnalist(paramMap);
	}
	
	/** 한건 조회 */
	public MngBmgModel qnaselectone(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.qnaselectone(paramMap);
	}
	
	/** 등록 */
	public int qnainsert(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.qnainsert(paramMap);
	}
	
	/** 수정 */
	public int qnaupdate(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.qnaupdate(paramMap);
	}
	
	/** 삭제 */
	public int qnadelete(Map<String, Object> paramMap) throws Exception {
		return mngbmgDao.qnadelete(paramMap);
	}
	
}



