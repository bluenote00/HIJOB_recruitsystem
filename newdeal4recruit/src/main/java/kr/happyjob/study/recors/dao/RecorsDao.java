package kr.happyjob.study.recors.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.myplil.model.myplilModel;
import kr.happyjob.study.myprsm.model.MyprsmModel;
import kr.happyjob.study.recors.model.RecorsModel;



public interface RecorsDao {

   public List<RecorsModel> openresumelist(Map<String, Object> paramMap) throws Exception;
   
   public int countopenlist(Map<String, Object> paramMap) throws Exception;
   
   
	public RecorsModel resumeselectone(Map<String, Object> paramMap) throws Exception;
	
	public RecorsModel resumeForm(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel>resumelinklist(Map<String, Object> paramMap) throws Exception;
	
	public int countlinklist(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel> resumeedulist(Map<String, Object> paramMap) throws Exception;
	
	public int countedulist(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel> resumecareerlist(Map<String, Object> paramMap) throws Exception;
	
	public int countcareerlist(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel> resumeprojectlist(Map<String, Object> paramMap) throws Exception;
	
	public int countprojectlist(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel> resumeacademylist(Map<String, Object> paramMap) throws Exception;
	
	public int countacademylist(Map<String, Object> paramMap) throws Exception;
	
	public List<RecorsModel> resumeintroductionlist(Map<String, Object> paramMap) throws Exception;
	
	public int countintroductionlist(Map<String, Object> paramMap) throws Exception;
	
}