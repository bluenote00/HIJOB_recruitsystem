package kr.happyjob.study.mngumg.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.mngumg.dao.MngUmgDao;
import kr.happyjob.study.mngumg.model.MngUmgModel;
import kr.happyjob.study.mngumg.model.UserInfo;



@Service("mngumgService")
public class MngUmgServiceImpl implements MngUmgService {
	
	// Set logger
	@SuppressWarnings("unused")
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MngUmgDao mngumgDao;
	
	

	
	/** 한건 조회 */
	@Override
	public UserInfo modifiselectone(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.modifiselectone(paramMap);
	}
	
	
	/**사용자 정보 수정*/
	@Override
	public int mdificationUser(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.mdificationUser(paramMap);
	}
	
	/** 사용자 비밀번호 확인 */
	@Override
	public UserInfo pwdconfirm(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.pwdconfirm(paramMap);
	}
	
	/**사용자 정보 수정*/
	@Override
	public int changepwd(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.changepwd(paramMap);
	}
	
	
	/** 목록 조회 */
	
	public List<MngUmgModel> searchblacklist(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.blacklist(paramMap);
	}
	
	
	/** 목록 카운트 조회 */
	
	public int countblacklist(Map<String, Object> paramMap) throws Exception {
		
		return mngumgDao.countblacklist(paramMap);
	}
	
	public int blacktypeupdate(Map<String, Object> paramMap) throws Exception{
		
		return mngumgDao.blacktypeupdate(paramMap);
	}
		

		
		
	}

	

