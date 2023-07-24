package kr.happyjob.study.mngtmg.service;

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
import kr.happyjob.study.mngtmg.dao.MngTmgDao;
import kr.happyjob.study.mngtmg.model.MngTmgModel;


@Service
	
	public class MngTmgServiceImpl implements MngTmgService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	MngTmgDao mngtmgDao;
	
	/** 목록 조회 */
	public List<MngTmgModel> termlist(Map<String, Object> paramMap) throws Exception {
		return mngtmgDao.termlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int counttermlist(Map<String, Object> paramMap) throws Exception {
				
		return mngtmgDao.counttermlist(paramMap);
	}
}



