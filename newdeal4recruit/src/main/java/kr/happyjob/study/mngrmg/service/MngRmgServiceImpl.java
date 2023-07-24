package kr.happyjob.study.mngrmg.service;

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
import kr.happyjob.study.mngrmg.dao.MngRmgDao;
import kr.happyjob.study.mngrmg.model.MngRmgModel;


@Service
public class MngRmgServiceImpl implements MngRmgService {  // implements 상속 받는 것 

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	MngRmgDao mngrmgDao;
	
	
	/** 목록 조회 */
	public List<MngRmgModel> revlist(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.revlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countrevlist(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.countrevlist(paramMap);
	}
	
	/** 한건 조회 */
	public MngRmgModel revselectone(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.revselectone(paramMap);
	}
	
	/** 등록 */
	public int revinsert(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.revinsert(paramMap);
	}
	
	/** 수정 */
	public int revupdate(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.revupdate(paramMap);
	}
	
	/** 삭제 */
	public int revdelete(Map<String, Object> paramMap) throws Exception {
		return mngrmgDao.revdelete(paramMap);
	}
	
}



