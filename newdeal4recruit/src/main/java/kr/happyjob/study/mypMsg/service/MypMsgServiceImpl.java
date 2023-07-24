package kr.happyjob.study.mypMsg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.mypMsg.dao.MypMsgDao;
import kr.happyjob.study.mypMsg.model.MessageModel;
/*import kr.happyjob.study.myprmg.dto.MypRmgDto;*/


@Service
public class MypMsgServiceImpl implements MypMsgService {

	
	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();
	
	@Autowired
	MypMsgDao mypMsgDao;
	

	/** 목록 조회 */
	public List<MessageModel> messagelist(Map<String, Object> paramMap) throws Exception {
		
		return mypMsgDao.messagelist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countmessagelist(Map<String, Object> paramMap) throws Exception {
				
		return mypMsgDao.countmessagelist(paramMap);
	}
	
	/** 한건 조회 */
	public MessageModel messageselectone(Map<String, Object> paramMap) throws Exception {
		
		return mypMsgDao.messageselectone(paramMap);
	}
	
	
	/** 쪽지 보내기 */
	public int msgsenderinfo(Map<String, Object> paramMap) throws Exception {
	
		return mypMsgDao.msgsenderinfo(paramMap);
	}

	
	/** 관리자에게 쪽지 */
	public int messageinsert(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return mypMsgDao.messageinsert(paramMap);
	}
	
	/** 수정 */
	/*
	  
	public int messageupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return mypMsgDao.messageupdate(paramMap);
	}
	
	*/
	
	/** 삭제 */
	public int messagedelete(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return mypMsgDao.messagedelete(paramMap);
	}
	

	
}
