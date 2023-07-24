package kr.happyjob.study.myprsm.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.myprsm.model.MyprsmModel;

public interface MyprsmDao {

	public List<MyprsmModel> resumelist(Map<String, Object> paramMap) throws Exception;
	
	public int countresumelist(Map<String, Object> paramMap) throws Exception;
	
	public int totalupdate(Map<String, Object> paramMap) throws Exception;
	
	public int totalDelete(Map<String,Object> paramMap) throws Exception;
	
	public int updatecheck(Map<String,Object> paramMap)throws Exception;
	

	
	public MyprsmModel resumeselectone(Map<String, Object> paramMap)throws Exception;
	
	public int resumenoinsert (Map<String, Object> paramMap) throws Exception;
	
	public int resumenoselect (Map<String, Object> paramMap) throws Exception;
	
	/** 등록 파일 */
	public int pictureinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	public int resumeupdateatt(Map<String, Object> paramMap)throws Exception;
	
	/** 수정 파일 */
//	public int pictureupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
//	
//	/** 삭제  파일*/
//	public int picturedeletefile(Map<String, Object> paramMap) throws Exception;
	
	/** 파일 등록 */
	public int pictureinsertfile(Map<String, Object> paramMap) throws Exception;
	
	/** 파일 정보 삭제 */
	public int deletefileinfo(Map<String, Object> paramMap) throws Exception;
	
	/** 기본정보 select */
	public MyprsmModel resumeForm(Map<String, Object> paramMap) throws Exception;
	

	public MyprsmModel linkselectone(Map<String, Object> paramMap) throws Exception;
	
	public List<MyprsmModel> resumelinklist(Map<String, Object> paramMap) throws Exception;
	
	public int countlinklist(Map<String, Object> paramMap) throws Exception;
	
	/**링크 등록*/
	public int resumelinkeinsert(Map<String, Object> paramMap) throws Exception;
	
	/**링크 수정 */
	public int resumelinkupdate(Map<String, Object> paramMap) throws Exception;
	
	/**링크 삭제 */
	public int resumelinkdelete(Map<String, Object> paramMap) throws Exception;
	
	
	public List<MyprsmModel> resumeedulist(Map<String, Object> paramMap) throws Exception;
	
	public int countedulist(Map<String, Object> paramMap) throws Exception;
	
	/**학력 등록*/
	public int resumeeduinsert(Map<String, Object> paramMap) throws Exception;
	
	/**학력  수정 */
	public int resumeeduupdate(Map<String, Object> paramMap) throws Exception;
	
	/**학력  삭제 */
	public int resumeedudelete(Map<String, Object> paramMap) throws Exception;
	
	public MyprsmModel eduselectone(Map<String, Object> paramMap) throws Exception;
	
	public List<MyprsmModel> resumecareerlist(Map<String, Object> paramMap) throws Exception;
	
	public int countcareerlist(Map<String, Object> paramMap) throws Exception;
	
	/**경력 등록*/
	public int resumecareerinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 경력 수정 */
	public int resumecareerupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 경력 삭제 */
	public int resumecareerdelete(Map<String, Object> paramMap) throws Exception;
	
	public MyprsmModel careerselectone(Map<String, Object> paramMap) throws Exception;
	
	
	
	public List<MyprsmModel> resumeprojectlist(Map<String, Object> paramMap) throws Exception;
	
	public int countprojectlist(Map<String, Object> paramMap) throws Exception;
	
	/** 프로젝트 등록 */
	public int resumeprojectinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 프로젝트 수정 */
	public int resumeprojectupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 프로젝트 삭제 */
	public int resumeprojectdelete(Map<String, Object> paramMap) throws Exception;
	
	public MyprsmModel projectselectone(Map<String, Object> paramMap) throws Exception;
	
	public List<MyprsmModel> resumeacademylist(Map<String, Object> paramMap) throws Exception;
	
	public int countacademylist(Map<String, Object> paramMap) throws Exception;
	
	/** 교육이력 등록 */
	public int resumeacademyinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 교육이력 수정 */
	public int resumeacademyupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 교육이력 삭제 */
	public int resumeacademydelete(Map<String, Object> paramMap) throws Exception;
	

	public MyprsmModel academyselectone(Map<String, Object> paramMap) throws Exception;
	
	public List<MyprsmModel> resumeintroductionlist(Map<String, Object> paramMap) throws Exception;
	
	public int countintroductionlist(Map<String, Object> paramMap) throws Exception;

	
	/** 자기소개 등록 */
	public int resumeintroductioninsert(Map<String, Object> paramMap) throws Exception;
	
	/** 자기소개 수정 */
	public int resumeintroductionupdate(Map<String, Object> paramMap) throws Exception;
	
	/** 자기소개 삭제 */
	public int resumeintroductiondelete(Map<String, Object> paramMap) throws Exception;
	
	public MyprsmModel introductionselectone(Map<String, Object> paramMap) throws Exception;

	public MyprsmModel selecttitle(Map<String, Object> paramMap);
	
}
