package kr.happyjob.study.mypMsg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.mypMsg.model.MessageModel;
/*import kr.happyjob.study.myprmg.dto.MypRmgDto;*/
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface MypMsgService {

	/**  목록 조회 */
	public List<MessageModel> messagelist(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 카운트 조회 */
	public int countmessagelist(Map<String, Object> paramMap) throws Exception;
	
	/** 한건 조회 */
	public MessageModel messageselectone(Map<String, Object> paramMap) throws Exception;

	/** 쪽지 보내기 */ 
	public int msgsenderinfo(Map<String, Object> paramMap) throws Exception;
	
	/** 관리자에게 쪽지*/
	public int messageinsert(Map<String, Object> paramMap) throws Exception;
	
	/** 수정 */
	/*public int messageupdate(Map<String, Object> paramMap) throws Exception;*/
	
	/** 삭제 */
	public int messagedelete(Map<String, Object> paramMap) throws Exception;


	
}
