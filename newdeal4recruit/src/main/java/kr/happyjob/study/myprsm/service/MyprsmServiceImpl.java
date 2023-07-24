package kr.happyjob.study.myprsm.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.myprsm.dao.MyprsmDao;
import kr.happyjob.study.myprsm.model.MyprsmModel;

@Service
public class MyprsmServiceImpl implements MyprsmService {

	private final Logger logger = LogManager.getLogger(this.getClass());

	private final String className = this.getClass().toString();

	@Value("${fileUpload.rootPath}")
	private String rootPath; // W:\\FileRepository

	@Value("${fileUpload.virtualRootPath}")
	private String virtualrootPath; // /serverfile

	@Value("${fileUpload.resumePath}")
	private String resumePath; // resume

	@Autowired
	MyprsmDao myprsmDao;

	public List<MyprsmModel> resumelist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumelist(paramMap);
	}

	public int countresumelist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.countresumelist(paramMap);
	}
	
	public int updatecheck(Map<String,Object> paramMap)throws Exception{
		
		return myprsmDao.updatecheck(paramMap);
	}

	public MyprsmModel resumeselectone(Map<String, Object> paramMap) throws Exception{
		
		return myprsmDao.resumeselectone(paramMap);
	}


	public int resumenoinsert (Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumenoinsert(paramMap);
	}
	
	public int resumenoselect (Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumenoselect(paramMap);
	}
	
	public int totalupdate (Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.totalupdate(paramMap);
	}
	
	public int totalDelete(Map<String,Object> paramMap) throws Exception {
		
		return myprsmDao.totalDelete(paramMap);
	}
	
	/** 등록 파일 */
	public int pictureinsertfile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		// private String rootPath;    // W:\\FileRepository
		// private String virtualrootPath;  // /serverfile
		// private String noticePath;   // notice
		
		String resumedir = File.separator + resumePath + File.separator;
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, resumedir);
		Map filereturn = fileup.uploadFiles();
		
		
		String upfile = (String) filereturn.get("file_nm");
		
		if(upfile == "" || upfile == null) {
			paramMap.put("fileexist", "N");
		} else {
			paramMap.put("filereturn", filereturn);
			paramMap.put("fileexist", "Y");
			
			
		}
		
		return myprsmDao.pictureinsertfile(paramMap) ;
		
	}
	
//	myprsmDao.resumeupdateatt(paramMap); return myprsmDao.totalupdate(paramMap);
	
//	public int noticeupdatefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
//		
//		List<MyprsmModel> selectone = myprsmDao.resumeselectone(paramMap);
//		
//		if(selectone.getFile_name() != "" && selectone.getFile_name() != null) {
//			File attfile = new File(selectone.getPhysic_path());     
//			attfile.delete();
//			
//			//notice_no			
//			// tb_file delete
//			mngNotDao.deletefileinfo(paramMap);
//		} 
//		
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
//		
//		String noticedir = File.separator + noticePath + File.separator;
//		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest,rootPath, virtualrootPath, noticedir);
//		Map filereturn = fileup.uploadFiles();
//				
//		String upfile = (String) filereturn.get("file_nm");
//		paramMap.put("fileprc", "Y");
//		
//		if(upfile == "" || upfile == null) {
//			paramMap.put("fileexist", "N");
//		} else {
//			paramMap.put("filereturn", filereturn);
//			paramMap.put("fileexist", "Y");
//			
//			mngNotDao.fileinsert(paramMap);
//		}
//		
//		return mngNotDao.noticeupdatefile(paramMap);		
//		
//	}
	/** 이력서 기본정보 select */
	public MyprsmModel resumeForm(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumeForm(paramMap);
	}


	
	/** 링크 등록 */
	public int resumelinkeinsert(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return myprsmDao.resumelinkeinsert(paramMap);
	}

	/** 링크 수정 */
	public int resumelinkupdate(Map<String, Object> paramMap) throws Exception {
		paramMap.put("fileprc", "N");
		return myprsmDao.resumelinkupdate(paramMap);
	}

	/** 링크 삭제 */
	public int resumelinkdelete(Map<String, Object> paramMap) throws Exception {
		return myprsmDao.resumelinkdelete(paramMap);
	}
	
	/** 링크리스트*/
	public List<MyprsmModel> resumelinklist(Map<String, Object> paramMap) throws Exception {

		
		
		return myprsmDao.resumelinklist(paramMap);
	}
	
	/** resumelistcount*/
	
	public int countlinklist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countlinklist(paramMap);
	}
	
	public MyprsmModel linkselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.linkselectone(paramMap);
	}
	
	
	/** 학력 등록 */
	public int resumeeduinsert(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeeduinsert(paramMap);
	}
	
	/** 학력 수정 */
	public int resumeeduupdate(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeeduupdate(paramMap);
	}
	
	/** 학력 삭제 */
	public int resumeedudelete(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeedudelete(paramMap);
	}
	
	public List<MyprsmModel> resumeedulist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeedulist(paramMap);
	}
	
	
	public int countedulist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countedulist(paramMap);
	}
	
	public MyprsmModel eduselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.eduselectone(paramMap);
	}

	public int resumecareerinsert(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumecareerinsert(paramMap);
	}


	public int resumecareerupdate(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumecareerupdate(paramMap);
	}

	public int resumecareerdelete(Map<String, Object> paramMap) throws Exception {
	
		return myprsmDao.resumecareerdelete(paramMap);
	}
	
	public MyprsmModel careerselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.careerselectone(paramMap);
	}
	
	public List<MyprsmModel> resumecareerlist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumecareerlist(paramMap);
	}
	
	public int countcareerlist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countcareerlist(paramMap);
	}
	
	
	/** 프로젝트 등록 */
	public int resumeprojectinsert(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeprojectinsert(paramMap);
	}
	
	/** 프로젝트 수정 */
	public int resumeprojectupdate(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeprojectupdate(paramMap);
	}
	
	/** 프로젝트 삭제 */
	public int resumeprojectdelete(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeprojectdelete(paramMap);
	}
	
	public List<MyprsmModel> resumeprojectlist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumeprojectlist(paramMap);
	}
	
	public int countprojectlist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countprojectlist(paramMap);
	}
	
	
	public MyprsmModel projectselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.projectselectone(paramMap);
	}
	
	public List<MyprsmModel> resumeacademylist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumeacademylist(paramMap);
	}
	
	public int countacademylist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countacademylist(paramMap);
	}
	
	/** 교육이력 등록 */
	public int resumeacademyinsert(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeacademyinsert(paramMap);
	}
	
	/** 교육이력 수정 */
	public int resumeacademyupdate(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeacademyupdate(paramMap);
	}
	
	/** 교육이력 삭제 */
	public int resumeacademydelete(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeacademydelete(paramMap);
	}
	
	public MyprsmModel academyselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.academyselectone(paramMap);
	}
	
	public List<MyprsmModel> resumeintroductionlist(Map<String, Object> paramMap) throws Exception {

		return myprsmDao.resumeintroductionlist(paramMap);
	}
	
	public int countintroductionlist(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.countintroductionlist(paramMap);
	}
	
	/** 자기소개 등록 */
	public int resumeintroductioninsert(Map<String, Object> paramMap) throws Exception {
	
		
		return myprsmDao.resumeintroductioninsert(paramMap);
	}
	
	/** 자기소개 수정 */
	public int resumeintroductionupdate(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeintroductionupdate(paramMap);
	}
	
	/** 자기소개 삭제 */
	public int resumeintroductiondelete(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.resumeintroductiondelete(paramMap);
	}
	
	public MyprsmModel introductionselectone(Map<String, Object> paramMap) throws Exception {
		
		return myprsmDao.introductionselectone(paramMap);
	}
	
	@Override
	public MyprsmModel selecttitle(Map<String, Object> paramMap) {
		return myprsmDao.selecttitle(paramMap);
	}

	
}
