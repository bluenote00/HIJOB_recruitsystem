package kr.happyjob.study.cmuQna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.cmuQna.dao.CmuQnaDao;
import kr.happyjob.study.cmuQna.model.QuestionModel;
   

@Service
public class CmuQnaServiceImpl implements CmuQnaService {

	
	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();
	
	@Autowired
	CmuQnaDao cmuQnaDao;
	

	/** 목록 조회 */
	public List<QuestionModel> questionlist(Map<String, Object> paramMap) throws Exception {
		
		return cmuQnaDao.questionlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countquestionlist(Map<String, Object> paramMap) throws Exception {
				
		return cmuQnaDao.countquestionlist(paramMap);
	}
	
	/** 한건 조회 */
	public QuestionModel questionselectone(Map<String, Object> paramMap) throws Exception {
		
		return cmuQnaDao.questionselectone(paramMap);
	}
	
	/** 등록 */
	public int questioninsert(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return cmuQnaDao.questioninsert(paramMap);
	}

	/** 수정 */
	public int questionupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return cmuQnaDao.questionupdate(paramMap);
	}
	
	/** 삭제 */
	public int questiondelete(Map<String, Object> paramMap) throws Exception {
		return cmuQnaDao.questiondelete(paramMap);
	}
	
	
}
