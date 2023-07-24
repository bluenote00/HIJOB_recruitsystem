package kr.happyjob.study.myppage.service;

import java.io.File;
import java.util.HashMap;
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
import kr.happyjob.study.myppage.dao.MyppageDao;
import kr.happyjob.study.myppage.dto.MyppageDto;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.myprsm.model.MyprsmModel;


@Service
public class MyppageServiceImpl implements MyppageService {
 
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();
   
   @Autowired
   MyppageDao myppageDao;

	public List<MyprsmModel> resumelist (Map<String, Object> paramMap) throws Exception{
		return myppageDao.resumelist(paramMap);
	}
   
	
   /** 취준생_지원한 횟수 불러오기 */
	public int Papplycompanycount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplycompanycount(paramMap);
		}
	
	/** 기업_지원자 수 불러오기 */
	public int Capplicantcount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantcount(paramMap);
	}
	
	   /** 취준생_서류통과 횟수 불러오기 */
	public int Papplypaperpasscount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplypaperpasscount(paramMap);
		}
	
	   /** 기업_서류통과 지원자 수 불러오기 */
	public int Capplicantpappercount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantpappercount(paramMap);
		}
		
		 /** 취준생_최종합격 횟수 불러오기 */
	public int Papplypasscount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplypasscount(paramMap);
		}
		
	 /** 기업_합격자 수 불러오기 */
	public int Capplicantpasscount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantpasscount(paramMap);
		}
	
		 /** 취준생_불합격 횟수 불러오기 */
	public int Papplyfailcount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplyfailcount(paramMap);
		}
	
	 /** 기업_불합격자 수 불러오기 */
	public int Capplicantfailcount(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantfailcount(paramMap);
	}
	
	/** 취준생_지원한 회사 목록 불러오기 */
	public List<MyppageDto> Papplycompanylist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplycompanylist(paramMap);
	}	
	
	/** 기업_지원한 취준생 목록 불러오기 */
	public List<MyppageDto> Capplicantlist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantlist(paramMap);
	}	
	
	/** 취준생_서류통과 회사 목록 불러오기 */
	public List<MyppageDto> Papplypapercompanylist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplypapercompanylist(paramMap);
	}	
	
	/** 기업_서류통과 취준생 목록 불러오기 */
	public List<MyppageDto> Capplicantpapperlist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantpapperlist(paramMap);
	}	
	
	/** 취준생_최종합격 회사 목록 불러오기 */
	public List<MyppageDto> Papplypasscompanylist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplypasscompanylist(paramMap);
	}			
	
	/** 기업_최종합격 취준생 목록 불러오기 */
	public List<MyppageDto> Capplicantpasslist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantpasslist(paramMap);
	}			
	
	/** 취준생_불합격 회사 목록 불러오기 */
	public List<MyppageDto> Papplyfailcompanylist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Papplyfailcompanylist(paramMap);
	}			
	
	/** 기업_불합격 취준생 목록 불러오기 */
	public List<MyppageDto> Capplicantfaillist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantfaillist(paramMap);
	}		
	
	/** 기업 채용현황_서류합격 */
	public int Capplicantpaperpassbutton(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantpaperpassbutton(paramMap);
	}

	/** 기업 채용현황_최종합격 */
	public int Capplicantallpassbutton(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantallpassbutton(paramMap);
	}
	
	/** 기업 채용현황_불합격 */
	public int Capplicantfailbutton(Map<String, Object> paramMap) throws Exception {
		return myppageDao.Capplicantfailbutton(paramMap);
	}
	
	/** 지원자 정보 */
	public MyppageDto applyinfo(Map<String, Object> paramMap) throws Exception {
		return myppageDao.applyinfo(paramMap);		
	}

	/** 기업 - 공고 한건 조회 */
	public List<MyppageDto> adverlist_write(Map<String, Object> paramMap) throws Exception {
		return myppageDao.adverlist_write(paramMap);
}

	/** 기업 - 공고 한건 조회 + 스킬 리스트 낱개로 가져오기*/
	public List<MyppageDto> skillist(Map<String, Object> paramMap) throws Exception {
		return myppageDao.skillist(paramMap);
	}
	
	
}

