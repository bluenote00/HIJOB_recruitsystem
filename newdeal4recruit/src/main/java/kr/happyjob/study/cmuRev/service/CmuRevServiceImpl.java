package kr.happyjob.study.cmuRev.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.cmuRev.dao.CmuRevDao;
import kr.happyjob.study.cmuRev.model.ReviewModel;


@Service
public class CmuRevServiceImpl implements CmuRevService {

	
	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();
	
	@Autowired
	CmuRevDao cmuRevDao;
	

	/** 목록 조회 */
	public List<ReviewModel> reviewlist(Map<String, Object> paramMap) throws Exception {
		
		return cmuRevDao.reviewlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countreviewlist(Map<String, Object> paramMap) throws Exception {
				
		return cmuRevDao.countreviewlist(paramMap);
	}
	
	/** 한건 조회 */
	public ReviewModel reviewselectone(Map<String, Object> paramMap) throws Exception {
		
		return cmuRevDao.reviewselectone(paramMap);
	}
	
	/** 등록 */
	public int reviewinsert(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return cmuRevDao.reviewinsert(paramMap);
	}
	
	/** 수정 */
	public int reviewupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return cmuRevDao.reviewupdate(paramMap);
	}
	
	/** 삭제 */
	public int reviewdelete(Map<String, Object> paramMap) throws Exception {
		return cmuRevDao.reviewdelete(paramMap);
	}
	
	
	
}
