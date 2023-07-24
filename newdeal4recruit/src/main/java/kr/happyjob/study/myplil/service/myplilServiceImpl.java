package kr.happyjob.study.myplil.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.myplil.dao.myplilDao;
import kr.happyjob.study.myplil.model.myplilModel;






@Service
public class myplilServiceImpl implements myplilService {


   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();

	@Autowired
	myplilDao myplildao;
	
   
   /** 좋아요 목록 조회 */
   public List<myplilModel> likelist(Map<String, Object> paramMap) throws Exception {
           
      return myplildao.likelist(paramMap);
   }
   

   /**  좋아요 목록 카운트 조회  **/
  public int myplilcountlist(Map<String, Object> paramMap) throws Exception {
	  
	  return myplildao.likecountlist(paramMap);
	  }
	
  /**  좋아요 삭제  **/
  public int myplildelete(Map<String, Object> paramMap) throws Exception {
	  
	  return myplildao.likedelete(paramMap);
	  }
  
  /**  좋아요 갱신  **/
  public int myplilrefresh(Map<String, Object> paramMap) throws Exception {
	  
	  return myplildao.likeRefresh(paramMap);
	  }
	  
  /**  좋아요 추가  **/
  public int myplilinsert(Map<String, Object> paramMap) throws Exception {
	  
	  return myplildao.likeInsert(paramMap);
	  }
  
  
  
  }
  
   
   
