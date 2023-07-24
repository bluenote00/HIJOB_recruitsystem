package kr.happyjob.study.recors.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.myprsm.dao.MyprsmDao;
import kr.happyjob.study.myprsm.model.MyprsmModel;
import kr.happyjob.study.recors.dao.RecorsDao;
import kr.happyjob.study.recors.model.RecorsModel;


@Service
public class RecorsServiceImpl implements RecorsService {


   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();

	@Autowired
	RecorsDao recorsDao;
	

	public List<RecorsModel> openresumelist(Map<String, Object> paramMap) throws Exception {

		return recorsDao.openresumelist(paramMap);
	}

	public int countopenlist(Map<String, Object> paramMap) throws Exception {

		return recorsDao.countopenlist(paramMap);
	}
 
	
	public RecorsModel resumeForm(Map<String, Object> paramMap) throws Exception{
		return recorsDao.resumeForm(paramMap);
	}
	
	public RecorsModel resumeselectone(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.resumeselectone(paramMap);
	}
	
	public List<RecorsModel>resumelinklist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.resumelinklist(paramMap);
	}
  
	public int countlinklist(Map<String, Object> paramMap) throws Exception{
		return recorsDao.countlinklist(paramMap);
	}
	
	public List<RecorsModel> resumeedulist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.resumeedulist(paramMap);
	}
	
	public int countedulist(Map<String, Object> paramMap) throws Exception{
		return recorsDao.countedulist(paramMap);
	}
	
	
	public List<RecorsModel> resumecareerlist(Map<String, Object> paramMap) throws Exception{
		return recorsDao.resumecareerlist(paramMap);
	}
	
	public int countcareerlist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.countcareerlist(paramMap);
	}
	

	public List<RecorsModel> resumeprojectlist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int countprojectlist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.countprojectlist(paramMap);
	}

	public List<RecorsModel> resumeacademylist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.resumeacademylist(paramMap);
	}
	
	public int countacademylist(Map<String, Object> paramMap) throws Exception{
		return recorsDao.countacademylist(paramMap);
	}
	
	public List<RecorsModel> resumeintroductionlist(Map<String, Object> paramMap) throws Exception{
	
		return recorsDao.resumeintroductionlist(paramMap);
	}
		
	
	public int countintroductionlist(Map<String, Object> paramMap) throws Exception{
		
		return recorsDao.countintroductionlist(paramMap);
	}
  }
  
   
   
