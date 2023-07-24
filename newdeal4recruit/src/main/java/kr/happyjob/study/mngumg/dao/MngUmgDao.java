package kr.happyjob.study.mngumg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.mngumg.model.MngUmgModel;
import kr.happyjob.study.mngumg.model.UserInfo;

public interface MngUmgDao {
	
	/** 블랙리스트 정보 확인 */

	public List<MngUmgModel> blacklist(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 정보 수정*/
	public int countblacklist(Map<String, Object> paramMap) throws Exception;
	
	/** 블랙 타입 수정*/
	public int blacktypeupdate(Map<String, Object>paramMap) throws Exception;
	
	
	/** 사용자 정보 수정*/
	public int mdificationUser(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 비밀번호 확인 */
	public UserInfo pwdconfirm(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public UserInfo modifiselectone(Map<String, Object> paramMap) throws Exception;

	/** 사용비밀번호 수정*/
	public int changepwd(Map<String, Object> paramMap) throws Exception;
	
	
	
}