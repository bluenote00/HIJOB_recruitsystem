package kr.happyjob.study.myprmg.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.myprmg.dto.MypRmgDto;


public interface MypRmgDao {
	 
	/** 기업 - 리스트 조회 - 최신순 */
	public List<MypRmgDto> adverlist(Map<String, Object> paramMap) throws Exception;
		
	/** 목록 카운트 조회 */
	public int countnoticelist(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 한건 조회 */
	public MypRmgDto adverselectone(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 + 스킬 리스트 낱개로 가져오기*/
	public List<MypRmgDto> skillist(Map<String, Object> paramMap) throws Exception;

	/** 공고 Max 번호 구하기 */
	public int maxcorecruit(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 회사 & 작성자 정보 가져오기 */
	public MypRmgDto writerinfo(Map<String, Object> paramMap) throws Exception;

	/** 기업 - 공고 지원하기  */
	public int adverapply(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 작성 저장  */
	public int adversave(Map<String, Object> paramMap) throws Exception;

	/** 기업 - 공고 작성 - 스킬 */
	public int adversaveskill(Map<String, Object> paramMap) throws Exception;
	
	/** 파일 등록 */
	public int fileinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 수정 */
	public int adverupdate(Map<String, Object> paramMap) throws Exception;

	/** 기업 - 공고 기술 삭제 */
	public int adverskilldelete(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 기술 삭제 */
	public int adverfiledelete(Map<String, Object> paramMap) throws Exception;
	
	/** 기업 - 공고 삭제 */
	public int adverdelete(Map<String, Object> paramMap) throws Exception;

	}
