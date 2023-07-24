package kr.happyjob.study.myppage.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.myppage.dto.MyppageDto;
import kr.happyjob.study.myprmg.dto.MypRmgDto;
import kr.happyjob.study.myprsm.model.MyprsmModel;


public interface MyppageService {

	public List<MyprsmModel> resumelist (Map<String, Object> paramMap) throws Exception;
	
	/** 취준생_지원한 횟수 불러오기 */
	public int Papplycompanycount(Map<String, Object> paramMap) throws Exception;
 
	/** 기업_지원자 수 불러오기 */
	public int Capplicantcount(Map<String, Object> paramMap) throws Exception;

	/** 취준생_서류통과 횟수 불러오기 */
	public int Papplypaperpasscount(Map<String, Object> paramMap) throws Exception;

	/** 기업_ 서류통과 지원자 수 불러오기 */
	public int Capplicantpappercount(Map<String, Object> paramMap) throws Exception;
	
	 /** 취준생_합격 횟수 불러오기 */
	public int Papplypasscount(Map<String, Object> paramMap) throws Exception;
	
	 /** 기업_합격자 수 불러오기 */
	public int Capplicantpasscount(Map<String, Object> paramMap) throws Exception;
	
	/** 취준생_불합격 횟수 불러오기 */
	public int Papplyfailcount(Map<String, Object> paramMap) throws Exception;

	/** 기업_불합격자 수 불러오기 */
	public int Capplicantfailcount(Map<String, Object> paramMap) throws Exception;
	
	/** 취준생_지원한 회사 불러오기 */
	public List<MyppageDto> Papplycompanylist(Map<String, Object> paramMap) throws Exception;

	/** 기업_지원한 취준생 불러오기 */
	public List<MyppageDto> Capplicantlist(Map<String, Object> paramMap) throws Exception;

	/** 취준생_서류통과 회사 불러오기 */
	public List<MyppageDto> Papplypapercompanylist(Map<String, Object> paramMap) throws Exception;

	/** 기업_서류통과 취준생 불러오기 */
	public List<MyppageDto> Capplicantpapperlist(Map<String, Object> paramMap) throws Exception;

	/** 취준생_최종합격 회사 불러오기 */
	public List<MyppageDto> Papplypasscompanylist(Map<String, Object> paramMap) throws Exception;

	/** 기업_최종합격 취준생 불러오기 */
	public List<MyppageDto> Capplicantpasslist(Map<String, Object> paramMap) throws Exception;

	/** 취준생_불합격 회사 불러오기 */
	public List<MyppageDto> Papplyfailcompanylist(Map<String, Object> paramMap) throws Exception;

	/** 기업_불합격 취준생 불러오기 */
	public List<MyppageDto> Capplicantfaillist(Map<String, Object> paramMap) throws Exception;

	/** 기업 채용현황_서류합격 */
	public int Capplicantpaperpassbutton(Map<String, Object> paramMap) throws Exception;

	/** 기업 채용현황_최종합격 */
	public int Capplicantallpassbutton(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 채용현황_불합격 */
	public int Capplicantfailbutton(Map<String, Object> paramMap) throws Exception;
	
	/** 지원자 정보 */
	public MyppageDto applyinfo(Map<String, Object> paramMap) throws Exception;

	/** 기업 - 공고 한건 조회 */
	public List<MyppageDto> adverlist_write(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 한건 조회 + 스킬 리스트 낱개로 가져오기*/
	public List<MyppageDto> skillist(Map<String, Object> paramMap) throws Exception;
	
	
	
}
