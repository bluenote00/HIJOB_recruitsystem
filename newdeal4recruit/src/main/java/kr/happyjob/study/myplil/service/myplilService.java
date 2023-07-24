package kr.happyjob.study.myplil.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.myplil.model.myplilModel;



public interface myplilService {

   /** 좋아요 목록 조회 */
   public List<myplilModel> likelist(Map<String, Object> paramMap) throws Exception;
//   
   /**  좋아요 목록 카운트 조회  **/
  public int myplilcountlist(Map<String, Object> paramMap) throws Exception;

   /** 좋아요 삭제 **/
  public int myplildelete(Map<String, Object>paramMap) throws Exception;
    
  /** 좋아요 갱신 **/
  public int myplilrefresh(Map<String, Object>paramMap) throws Exception;
  

  /** 좋아요 추가 **/
  public int myplilinsert(Map<String, Object>paramMap) throws Exception;
  
  
     
}