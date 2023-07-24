package kr.happyjob.study.mngcmg.service;

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
import kr.happyjob.study.mngcmg.dao.MngCmgDao;
import kr.happyjob.study.mngcmg.model.MngCmgModel;


@Service
	
	public class MngCmgServiceImpl implements MngCmgService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	MngCmgDao mngcmgDao;
	
	/** 목록 조회 */
	public List<MngCmgModel> complist(Map<String, Object> paramMap) throws Exception {
		return mngcmgDao.complist(paramMap);
	}
	
	/** 유저 타입 선택 데이터 목록 조회 */
	public List<MngCmgModel> complistByUserType(Map<String, Object> paramMap) throws Exception {
		return mngcmgDao.complistByUserType(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countcomplist(Map<String, Object> paramMap) throws Exception {
				
		return mngcmgDao.countcomplist(paramMap);
	}
	
	/** 한건 조회 */
	public MngCmgModel compselectone(Map<String, Object> paramMap) throws Exception {
		
		return mngcmgDao.compselectone(paramMap);
	}
	
	/** 등록 */
	public int compinsert(Map<String, Object> paramMap) throws Exception {

		return mngcmgDao.compinsert(paramMap);
	}
	
	/** 수정 */
	public int compupdate(Map<String, Object> paramMap) throws Exception {

		return mngcmgDao.compupdate(paramMap);
	}
	
	/** 삭제 */
	public int compdelete(Map<String, Object> paramMap) throws Exception {
		
		return mngcmgDao.compdelete(paramMap);
	}
	
	
	
}



