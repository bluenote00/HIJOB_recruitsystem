package kr.happyjob.study.stteck.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.dashboard.model.MonthCompanyVO;
import kr.happyjob.study.dashboard.model.MonthProductVO;
import kr.happyjob.study.dashboard.model.MonthProfitVO;
import kr.happyjob.study.mypqnal.model.mypqnalModel;
import kr.happyjob.study.stteck.model.CompanyPassuserVO;
import kr.happyjob.study.stteck.model.SessionApplyuserVO;
import kr.happyjob.study.stteck.model.SessionCompanyVO;
import kr.happyjob.study.stteck.model.stteckModel;


public interface stteckDao {

	/**  목록 조회 */
	public List<stteckModel> sttecksearchlist(Map<String, Object> paramMap) throws Exception;
	
	// 회차별 기업합격자 수 찾기
	public List<CompanyPassuserVO> selectCompanyPassuser();
	
	// 회차별 지원자 수 찾기
	public List<SessionApplyuserVO> selectSessionApplyuser();
	
	// 회차별 신청 기업 수 찾기
	public List<SessionCompanyVO> selectSessionCompany();
	
//    /** 목록 카운트 조회 */
//	public int countquestionlist(Map<String, Object> paramMap) throws Exception;
//
//	/** 한건 조회 */
//	public mypqnalModel questionselectone(Map<String, Object> paramMap) throws Exception;
//	
//	/** 등록 */
//	public int noticeinsert(Map<String, Object> paramMap) throws Exception;
//	
//	
//	/** 수정 */
//	public int questionupdate(Map<String, Object> paramMap) throws Exception;
//	
//	/** 삭제 */
//	public int questiondelete(Map<String, Object> paramMap) throws Exception;
//	
//	/** 등록 파일 */
//	public int noticeinsertfile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 수정 파일 */
//	public int noticeupdatefile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 삭제  파일*/
//	public int noticedeletefile(Map<String, Object> paramMap) throws Exception;
//	
//	/** 파일 등록 */
//	public int fileinsert(Map<String, Object> paramMap) throws Exception;
//	
//	/** 파일 정보 삭제 */
//	public int deletefileinfo(Map<String, Object> paramMap) throws Exception;
	
	
}
