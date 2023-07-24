package kr.happyjob.study.myplil.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.myplil.model.myplilModel;



public interface myplilDao {

   /** 좋아요 목록 조회 */
   //likelist 가 쿼리문 ID가 됌.
   public List<myplilModel> likelist(Map<String, Object> paramMap) throws Exception;
   
   // 좋아요 목록 카운트 조회 
   public int likecountlist(Map<String, Object> paramMap) throws Exception;
   
   //좋아요 삭제
   
   public int likedelete(Map<String, Object>paramMap) throws Exception;
   
   // 좋아요 갱신
   public int likeRefresh(Map<String, Object>paramMap) throws Exception; 
   
   //좋아요 추가
   public int likeInsert(Map<String, Object> paramMap) throws Exception;
   
   
   
}