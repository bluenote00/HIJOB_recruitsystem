<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>이력서 관리</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>

#container ul li.contents {
   padding:0 20px;
   background: #fff;
   width: 800px;
   max-height: 100%;
}

#container ul li.contents .content {
    padding-top: 16px;
    margin-bottom: 20px;
    max-height: 100%;
}

input::placeholder {color:#b1b1b1e3; font-family: "Noto Sans KR", sans-serif;}
input::-webkit-input-placeholder {color:#b1b1b1e3;;}
input:-ms-input-placeholder {color:#b1b1b1e3;;}


textarea::placeholder {color:#b1b1b1e3; font-family: "Noto Sans KR", sans-serif;}
textarea::-webkit-input-placeholder {color:#b1b1b1e3;;}
textarea:-ms-input-placeholder {color:#b1b1b1e3;;}

placeholder {
    font-family: "Noto Sans KR", sans-serif;
    color: #cccccc85;
}


#resumepage_container {
    font-family: "Noto Sans KR", sans-serif;
   max-width: 730px;
    margin-left: 30px;
    margin-right: 20px;
    padding-top: 50px;
    padding-bottom: 50px;
}

.resumepage_top i {
    color: #1751a8;
}

#resumepage_container h1 {
    font-weight: 700;
    font-size: 30px;
    color: rgb(34, 34, 34);
    font-family: "Noto Sans KR", sans-serif;
    margin-top: 0;
    margin-bottom: 0;
}

.devide {
   color: #979797;
}

.resumepage {
    padding-bottom: 60px;
}

.resumepage_head {
   padding-bottom: 50px;
}

.name_login_dl i {
    text-align: center;
    width: 15px;
}

#resume_name {
    width: 700px;
    height: 65px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
    padding-left: 20px;
    line-height: 1.25;
    font-weight: 700;
    font-size: 40px;
    font-family: "Noto Sans KR", sans-serif;
}

.resumepage_picture {
    margin-top: 20px;
    margin-bottom: 10px;
    padding-left: 20px;
    font-weight: 700;
    font-size: 16px;
    line-height: 1.5rem;
}

.name_login_dl {
    margin-left: 20px;
    display: flex;
    font-weight: 700;
    font-size: 16px;
    margin-bottom: 10px;
    line-height: 1.5rem;
}

.resumepage_top {
    display: inline-block;
    vertical-align: top;
    padding-right: 16px;
    position: relative;
    color: rgb(34, 34, 34);
    font-size: 15px;
}

.resumesection_head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-bottom: 15px;
}

#spec_plus {
    padding-right: 10px;
    font-size: 13px;
    font-weight: 900;
}


.resumesection_head h3 {
    display: inline-block;
    padding-bottom: 3px;
    font-size: 20px;
    color: rgb(0, 0, 0);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
}

.fa-plus {
    background-color: #4e95ff;
    padding: 3px;
    border-radius: 20px 20px 20px 20px;
    color: rgb(255, 255, 255);
}

#savebutton {
    color: #494949;
    background-color: #ffffff;
    border-radius: 20px 20px 20px 20px;
    border: 1px solid #5f5f5f;
    font-size: 18px;
    padding-left: 60px;
    padding-right: 60px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

#savebutton1 {
    color: #494949;
    background-color: #ffffff;
    border-radius: 20px 20px 20px 20px;
    border: 1px solid #5f5f5f;
    font-size: 18px;
    padding-left: 60px;
    padding-right: 60px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

.end_button {
    padding-top: 50px;
    padding-top: 50px;
    display: flex;
    flex-flow: row nowrap;
    justify-content: flex-end;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

.font_red {
    color: red;
}

#skill_icon {
    display: flex;
    font-family: "Noto Sans KR", sans-serif;
    flex-flow : row nowrap;
    padding-top: 10px;
}


#skill1, #skill2, #skill3 {
    width: 180px;
    height: 45px;
    border-radius: 10px;
    margin-left: 20px;
    margin-right: 20px;
    border: 1px solid #C4C4C4;
}

#linklist, #edulist, #careerlist, #projectlist, #academylist, #introductionlist {
   margin-left: 20px;
    display: inline-block;
}

#list_set {
    display: flex;
}

#caption {
   margin-left: 20px;
   display: flex;
}

#resume_name, #resume_linklist_address {
   margin-bottom: 10px;
}


#resume_linklist, #resume_edulist, #resume_careerlist, #resume_projectlist, 
#resume_academylist, #resume_introductionlist  {
    border: none;
    border-radius: 10px;
    align-items: center;
    font-size: 17px;
    font-weight: 700;
    background-color: #E8F0FE;
    padding-left: 20px;
    padding-right: 10px;
    padding-top: 7px;
    height: 35px;
    width: 200px;
    font-family: "Noto Sans KR", sans-serif;
    margin-right: 10px;
}

#resume_linklist2, #resume_edulist2, #resume_careerlist2, #resume_projectlist2, 
#resume_academylist2, #resume_introductionlist2 {
    border: none;
    border-radius: 10px;
    font-size: 17px;
    font-weight: 700;
    background-color: #E8F0FE;
    padding-left: 20px;
    padding-right: 10px;
    padding-top: 7px;
    height: 35px;
    width: 425px;
    font-family: "Noto Sans KR", sans-serif;
}

#resume_smallname {
   width: 220px;
    height: 30px;
   background-color: #E8F0FE;
    border-radius: 10px;
   padding-left: 20px;
   padding-top: 10px;
   color: rgb(81 81 81);
   margin-right: 10px;
   font-size: 14px;
   font-weight: 600;
   font-family: "Noto Sans KR", sans-serif;
   margin-bottom: 10px;
}

#resume_address {
   width: 430px;
    height: 30px;
    background-color: #E8F0FE;
    border-radius: 10px;
    padding-left: 20px;
    padding-top: 10px;
    color: rgb(81 81 81);
    font-size: 14px;
    font-weight: 600;
    font-family: "Noto Sans KR", sans-serif;
    margin-bottom: 10px;
}

</style>


<script type="text/javascript">

   /** OnLoad event */
   $(function() {
      // 버튼 이벤트 등록
      fRegisterButtonClickEvent();
      
      fn_linklist();
	  fn_edulist();
	  fn_careerlist();
	  fn_projectlist();
	  fn_academylist();
	  fn_introductionlist();

   });

   function fRegisterButtonClickEvent() {
      $('a[name=btn]').click(function(e) {
         e.preventDefault();

         var btnId = $(this).attr('id');

         switch (btnId) {
         case 'linkbtnSave':
            fn_linkSave();
            break;
         case 'edubtnSave':
            fn_eduSave();
            break;
         case 'careerbtnSave':
            fn_careerSave();
            break;
         case 'projectbtnSave':
            fn_projectSave();
            break;
         case 'academybtnSave':
            fn_academySave();
            break;
         case 'introductionbtnSave':
            fn_introductionSave();
            break;
         case 'linkbtnDelete':
            $("#action").val("D");
            fn_linkSave();
            break;
         case 'edubtnDelete':
            $("#action").val("D");
            fn_eduSave();
            break;
         case 'careerbtnDelete':
            $("#action").val("D");
            fn_careerSave();
            break;
         case 'projectbtnDelete':
            $("#action").val("D");
            fn_projectSave();
            break;
         case 'academybtnDelete':
            $("#action").val("D");
            fn_academySave();
            break;
         case 'introductionbtnDelete':
            $("#action").val("D");
            fn_introductionSave();
            break;
         case 'totalSave' :
            fn_totalSave();
            break;
         case 'totalDelete' :
        	fn_totalDelete();
        	break;
         case 'btnClose':
            gfCloseModal();
            break;
         }
      });
   }
   
   function fn_totalValidate() {

      var chk = checkNotEmpty(
            [ 
               ["resume_name", "이력서 제목을 입력해 주세요."]
              ,["skill1", "기술스택1을 입력해 주세요." ]
              ,["skill2" ,"기술스택2를 입력해 주세요."]
              ,["skill3", "기술스택3을 입력해 주세요."]
            ]
      );
      
      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_totalSave() {
      
      if (!fn_totalValidate()) {
         return;
      }
      
      var param = {
         resume_no : $("#resume_no").val()
         ,resume_name : $("#resume_name").val()
         ,skill1 : $("#skill1").val()
         ,skill2 : $("#skill2").val()
         ,skill3 : $("#skill3").val()
      }
      
      
      var totalcallback = function(reval){
         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
         
      }
      
      callAjax("/myprsm/totalSave.do", "post", "json", false , param , totalcallback);
      
   }
   
      function fn_totalDelete(){
    	  
    	  
	    var param = {
	            resume_no : $("#resume_no").val()
	            ,resume_name : $("#resume_name").val()
	            ,skill1 : $("#skill1").val()
	            ,skill2 : $("#skill2").val()
	            ,skill3 : $("#skill3").val()
	    }
	    
	   
	    
	    var totalDeletecallback = function (reval){
	    	if(reval.returncval > 0){
	    		alert("삭제 되었습니다.");
 	    		location.href="/myprsm/resume.do";

	    		
	    		var params = "";
				
	    		
	    		//jQuery("<form action='/myprsm/resumelist.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
	    	}
	    	else{
	    		alert("오류가 발생 되었습니다.");
	    	}
	    	
	    	
	    }
	    
	    callAjax("/myprsm/totalDelete.do", "post", "json" , false, param, totalDeletecallback );
	    
   	  }
   

      function fn_linklist() {
            
            var param = {
                resume_no : $("#resume_no").val()
                ,link_no : $("#link_no").val()
                ,link_name : $("#link_name").val()
                ,link_address : $("#link_address").val()
            }
            
            var linklistcallback = function(returnvalue) {
               console.log(returnvalue);
               
               $("#linklist").empty().append(returnvalue);
         
            }
            
            callAjax("/myprsm/linklist.do", "post", "text", false, param, linklistcallback) ;
               
         }

   function fn_linkopenpopup() {

      linkopenpopup();

      // 모달 팝업
      gfModalPop("#linklayer1");

   }

   function linkopenpopup(object) {

      if (object == "" || object == null || object == undefined) {
         $("resume_no").val();
         $("#link_no").val("");
         $("#link_name").val("");
         $("#link_address").val("");

         $("#btnDelete").hide();

         $("#action").val("I");
      } else {
         $("resume_no").val();
         $("#link_no").val(object.link_no);
         $("#link_name").val(object.link_name);
         $("#link_address").val(object.link_address);

         $("#btnDelete").show();
         $("#action").val("U");
      }
   }

   function fn_linkValidate() {

      var chk = checkNotEmpty(
            [ 
              [ "link_name", "링크 이름을 입력해 주세요." ],
            
              [ "link_address", "링크주소을 입력해 주세요" ]
            ]
      );
      

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_linkSave() {

      if (!fn_linkValidate()) {
         return;
      }

      var param = {
         action : $("#action").val(),
         resume_no: $("#resume_no").val(),
         link_no: $("#link_no").val(),
         link_name : $("#link_name").val(),
         link_address : $("#link_address").val()
         
      }   
      
      
      var lilnksavecallback = function(reval) {
         console.log(JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_linklist();
         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }

      callAjax("/myprsm/resumelinksave.do", "post", "json", false, param, lilnksavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   
   function fn_linkselectone(no) {
      
//      alert(no);
      
      var param = {
            link_no : no
      }
      
      var linkselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         linkopenpopup(returndata.linkselect);
         
         // 모달 팝업
         gfModalPop("#linklayer1");
         
      }
      
      callAjax("/myprsm/linkselectone.do", "post", "json", false, param, linkselectoncallback) ;
      
   }
   
   
   function fn_edulist() {
      
      var param = {
        resume_no : $("#resume_no").val()
        ,degree_code : $("#degree_code").val()
        ,degree_school : $("#degree_school").val()
        ,degree_major : $("#degree_major").val()
      }
      
      var edulistcallback = function(returnvalue) {
         console.log(returnvalue);
         
         $("#edulist").empty().append(returnvalue);
   
      }
      
      callAjax("/myprsm/edulist.do", "post", "text", false, param, edulistcallback) ;
         
   }
   
   
   function fn_eduopenpopup() {

      eduopenpopup();

      // 모달 팝업
      gfModalPop("#edulayer1");

   }
   
   function eduopenpopup(object) {

      if (object == "" || object == null || object == undefined) {
         $("#resume_no").val();
         $("#degree_code").val("");
         $("#graduation_year").val("");
         $("#graduation_month").val("");
         $("#degree_dropout").val("y");
         $("#degree_division").val("0");
         $("#degree_school").val("");
         $("#degree_major").val("");
         $("#degree_grade").val("");
         $("#degree_credit").val("0");

         $("#btnDelete").hide();

         $("#action").val("I");
         
      } else {
         $("#resume_no").val();
         $("#degree_code").val(object.degree_code);
         $("#graduation_year").val(object.graduation_year);
         $("#graduation_month").val(object.graduation_month);
         $("#degree_dropout").val(object.degree_dropout);
         $("#degree_division").val(object.degree_division);
         $("#degree_school").val(object.degree_school);
         $("#degree_major").val(object.degree_major);
         $("#degree_grade").val(object.degree_grade);
         $("#degree_credit").val(object.degree_credit);

         $("#btnDelete").show();
         $("#action").val("U");
      }
   }
   
   function fn_eduValidate() {

      var chk = checkNotEmpty([ 
                                [ "graduation_year", "졸업년도를 입력해 주세요." ],
                          [ "graduation_month", "졸업 월을 입력해 주세요." ]
                         ,["degree_dropout","졸업 선택을 해주세요."]
                         ,["degree_division","학력구분을 선택 해주세요."]
                         ,["degree_school","학교명을 입력해주세요."]
                          ,["degree_major","학과명을 입력해주세요."]
                         ,["degree_grade","학점을 입력해주세요."]
                               ,["degree_credit","기준학점을 선택해주세요"]
      ]);

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_eduSave() {

      if (!fn_eduValidate()) {
         return;
      }

      var param = {
         action : $("#action").val()
         ,resume_no: $("#resume_no").val()
         ,degree_code : $("#degree_code").val()
         ,graduation_year: $("#graduation_year").val()
         ,graduation_month: $("#graduation_month").val()
         ,degree_dropout : $("#degree_dropout").val()
         ,degree_division : $("#degree_division").val()
         ,degree_school : $("#degree_school").val()
         ,degree_major : $("#degree_major").val()
         ,degree_grade: $("#degree_grade").val()
         ,degree_credit: $("#degree_credit").val()

      }   
      var edusavecallback = function(reval) {
         console.log(JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_edulist();

         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }

      callAjax("/myprsm/resumeedusave.do", "post", "json", false, param, edusavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   function fn_eduselectone(no) {
      
      //alert(no);
      
      var param = {
            degree_code : no
      }
      
      var eduselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         eduopenpopup(returndata.eduselect);
         
         // 모달 팝업
         gfModalPop("#edulayer1");
         
      }
      
      callAjax("/myprsm/eduselectone.do", "post", "json", false, param, eduselectoncallback) ;
      
   }
   

   
   function fn_careerlist() {
      
      var param = {
    		  resume_no : $("#resume_no").val()
             ,career_code : $("#career_code").val()
             ,career_company : $("#career_company").val()
             ,career_inoffice : $("#career_inoffice").val()
      }
      
      var careerlistcallback = function(returnvalue) {
         console.log(returnvalue);
         
         $("#careerlist").empty().append(returnvalue);
   
      }
      
      callAjax("/myprsm/careerlist.do", "post", "text", false, param, careerlistcallback) ;
         
   }
   
   function fn_careeropenpopup() {

      careeropenpopup();

      // 모달 팝업
      gfModalPop("#careerlayer1");

   }
   
   $(function(){
      comcombo("stackCD","career_skill1","all","");
      comcombo("stackCD","career_skill2","all","");
      comcombo("stackCD","career_skill3","all","");
      comcombo("stackCD","project_skill1","all","");
      comcombo("stackCD","project_skill2","all","");
      comcombo("stackCD","project_skill3","all","");
      comcombo("stackCD","skill1","all","");
      comcombo("stackCD","skill2","all","");
      comcombo("stackCD","skill3","all","");


      comcombo("stackCD","skill1","all","${totalselect.skill1}");
      comcombo("stackCD","skill2","all","${totalselect.skill2}");
	  comcombo("stackCD","skill3","all","${totalselect.skill3}");
   });
   
   function careeropenpopup(object) {

      
      if (object == "" || object == null || object == undefined) {
         $("#resume_no").val();
         $("#career_code").val("");
         $("#career_joinYear").val("");
         $("#career_joinMonth").val("");
         $("#career_outYear").val("");
         $("#career_outMonth").val("");
         $("#career_inoffice").val();
         $("#career_company").val("");
         $("#career_department").val("");
         $("#career_position").val("");
         $("#career_skill1").val("");
         $("#career_skill2").val("");
         $("#career_skill3").val("");
         $("#career_introduction").val("");

         $("#btnDelete").hide();

         $("#action").val("I");
      } else {
         $("#resume_no").val();
         $("#career_code").val(object.career_code);
         $("#career_joinYear").val(object.career_joinYear);
         $("#career_joinMonth").val(object.career_joinMonth);
         $("#career_outYear").val(object.career_outYear);
         $("#career_outMonth").val(object.career_outMonth);
         $("#career_inoffice").val(object.career_inoffice);
         $("#career_company").val(object.career_company);
         $("#career_department").val(object.career_department);
         $("#career_position").val(object.career_position);
         $("#career_skill1").val(object.career_skill1);
         $("#career_skill2").val(object.career_skill2);
         $("#career_skill3").val(object.career_skill3);
         $("#career_introduction").val(object.career_introduction);

         $("#btnDelete").show();
         $("#action").val("U");
         
      }
   }
   
   function fn_careerValidate() {

      var chk = checkNotEmpty([ 
                                ["career_joinYear", "입사 년도를 입력해 주세요."]
                         ,["career_joinMonth", "입사 월을 입력해 주세요."]
                         ,["career_outYear","퇴사 년도를 입력해 주세요."]
                         ,["career_outMonth","퇴사 월을 입력해 주세요.."]
                          ,["career_company","회사명을 입력해 주세요."]
                         ,["career_department","부서명을 입력해 주세요."]
                               ,["career_position","직책을 입력해 주세요."]
                               ,["career_skill1","기술스택을 선택해주세요."]
                                ,["career_skill2","기술스택을 선택해주세요."]
                                ,["career_skill3","기술스택을 선택해주세요."]
                               ,["career_introduction","주요업무 및 성과를 작성해주세요."]
      ]);

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_careerSave() {
      
      if (!fn_careerValidate()) {
         return;
      }
      

      var param = {
         action : $("#action").val()
         ,resume_no: $("#resume_no").val()
         ,career_code : $("#career_code").val()
         ,career_joinYear: $("#career_joinYear").val()
         ,career_joinMonth: $("#career_joinMonth").val()
         ,career_outYear : $("#career_outYear").val()
         ,career_outMonth : $("#career_outMonth").val()
         ,career_inoffice : $("#career_inoffice").val()
         ,career_company : $("#career_company").val()
         ,career_department: $("#career_department").val()
         ,career_position: $("#career_position").val()
         ,career_skill1: $("#career_skill1").val()
         ,career_skill2: $("#career_skill2").val()
         ,career_skill3: $("#career_skill3").val()
         ,career_introduction: $("#career_introduction").val()

      }   
      
      var careersavecallback = function(reval) {
         console.log(JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_careerlist();

         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }
      

      callAjax("/myprsm/resumecareersave.do", "post", "json", false, param, careersavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   function fn_careerselectone(no) {
      
      //alert(no);
      
      var param = {
            career_code : no
      }
      
      var careerselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         careeropenpopup(returndata.careerselect);
         
         // 모달 팝업
         gfModalPop("#careerlayer1");
         
      }
      
      callAjax("/myprsm/careerselectone.do", "post", "json", false, param, careerselectoncallback) ;
      
   }
   
   
   
   function fn_projectlist() {
      
      var param = {
        resume_no :$("#resume_no").val()
        ,project_code : $("#project_code").val()
        ,project_name : $("#project_name").val()
        ,project_progress : $("#project_progress").val()
      }
      
      var projectlistcallback = function(returnvalue) {
         console.log(returnvalue);
         
         $("#projectlist").empty().append(returnvalue);
   
      }
      
      callAjax("/myprsm/projectlist.do", "post", "text", false, param, projectlistcallback) ;
         
   }

   
   
   function fn_projectopenpopup() {

      projectopenpopup();

      // 모달 팝업
      gfModalPop("#projectlayer1");

   }
   
   function projectopenpopup(object) {
      

      if (object == "" || object == null || object == undefined) {
         $("#resume_no").val();
         $("#project_code").val("");
         $("#project_startYear").val("");
         $("#project_startMonth").val("");
         $("#project_endYear").val("");
         $("#project_endMonth").val("");
         $("#project_progress").val("");
         $("#project_name").val("");
         $("#project_skill1").val("");
         $("#project_skill2").val("");
         $("#project_skill3").val("");
         $("#project_detail").val("");
         $("#project_link").val("");
         

         $("#btnDelete").hide();

         $("#action").val("I");
      } else {
         $("#resume_no").val();
         $("#project_code").val(object.project_code);
         $("#project_startYear").val(object.project_startYear);
         $("#project_startMonth").val(object.project_startMonth);
         $("#project_endYear").val(object.project_endYear);
         $("#project_endMonth").val(object.project_endMonth);
         $("#project_progress").val(object.project_progress);
         $("#project_name").val(object.project_name);
         $("#project_skill1").val(object.project_skill1);
         $("#project_skill2").val(object.project_skill2);
         $("#project_skill3").val(object.project_skill3);
         $("#project_detail").val(object.project_detail);
         $("#project_link").val(object.project_link);

         $("#btnDelete").show();
         $("#action").val("U");
      }
   }
   
   function fn_projectValidate() {

      var chk = checkNotEmpty([ 
                                ["project_startYear", "프로젝트 시작 연도를 입력해 주세요." ]
                         ,["project_startMonth", "프로젝트 시작 월을 입력해 주세요." ]
                         ,["project_endYear","프로젝트 종료 연도를 입력해 주세요."]
                         ,["project_endMonth","프로젝트 종료 월을 입력해 주세요."]
                         ,["project_name","프로젝트명을 입력해 주세요."]
                               ,["project_skill1","기술스택을 선택해 주세요."]
                               ,["project_skill2","기술스택을 선택해주세요."]
                               ,["project_skill3","기술스택을 선택해 주세요."]
                               ,["project_detail","프로젝트 상세내용을 기재해 주세요"]
                               ,["project_link","저장소 링크"]
      ]);

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_projectSave() {

      if (!fn_projectValidate()) {
         return;
      }

      var param = {
         action : $("#action").val()
         ,resume_no: $("#resume_no").val()
         ,project_code : $("#project_code").val()
         ,project_startYear: $("#project_startYear").val()
         ,project_startMonth: $("#project_startMonth").val()
         ,project_endYear : $("#project_endYear").val()
         ,project_endMonth : $("#project_endMonth").val()
         ,project_progress : $("#project_progress").val()
         ,project_name : $("#project_name").val()
         ,project_skill1: $("#project_skill1").val()
         ,project_skill2: $("#project_skill2").val()
         ,project_skill3: $("#project_skill3").val()
         ,project_detail: $("#project_detail").val()
         ,project_link: $("#project_link").val()

      }   
      var projectsavecallback = function(reval) {
         console.log(JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_projectlist();

         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }

      callAjax("/myprsm/resumeprojectsave.do", "post", "json", false, param, projectsavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   function fn_projectselectone(no) {
      
      //alert(no);
      
      var param = {
            project_code : no
      }
      
      var projectselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         projectopenpopup(returndata.projectselect);
         
         // 모달 팝업
         gfModalPop("#projectlayer1");
         
      }
      
      callAjax("/myprsm/projectselectone.do", "post", "json", false, param, projectselectoncallback) ;
      
   }
   
   
   function fn_academylist() {
      
      var param = {
        resume_no : $("#resume_no").val()
        ,train_code : $("#train_code").val()
        ,train_name : $("#train_name").val()
        ,train_agency : $("#train_agency").val()
      }
      
      var academylistcallback = function(returnvalue) {
         console.log(returnvalue);
         
         $("#academylist").empty().append(returnvalue);
   
      }
      
      callAjax("/myprsm/academylist.do", "post", "text", false, param, academylistcallback) ;
         
   }
   
   
   
   function fn_academyopenpopup() {

      academyopenpopup();

      // 모달 팝업
      gfModalPop("#academylayer1");

   }
   
   function academyopenpopup(object) {

      if (object == "" || object == null || object == undefined) {
        $("#resume_no").val();
         $("#train_code").val("");
         $("#train_startYear").val("");
         $("#train_startMonth").val("");
         $("#train_endYear").val("");
         $("#train_endMonth").val("");
         $("#train_name").val("");
         $("#train_agency").val("");
         $("#train_detail").val("");
         

         $("#btnDelete").hide();

         $("#action").val("I");
      } else {
        $("#resume_no").val();
         $("#train_code").val(object.train_code);
         $("#train_startYear").val(object.train_startYear);
         $("#train_startMonth").val(object.train_startMonth);
         $("#train_endYear").val(object.train_endYear);
         $("#train_endMonth").val(object.train_endMonth);
         $("#train_name").val(object.train_name);
         $("#train_agency").val(object.train_agency);
         $("#train_detail").val(object.train_detail);

         $("#btnDelete").show();
         $("#action").val("U");
      }
   }
   
   function fn_academyValidate() {

      var chk = checkNotEmpty([ 
                                ["train_startYear", "프로젝트 시작 연도를 입력해 주세요." ]
                         ,["train_startMonth", "프로젝트 시작 월을 입력해 주세요." ]
                         ,["train_endYear","프로젝트 종료 연도를 입력해 주세요."]
                         ,["train_endMonth","프로젝트 종료 월을 입력해 주세요."]
                               ,["train_name","프로젝트 명을 입력해주세요."]
                         ,["train_agency","프로젝트명을 입력해 주세요."]
                               ,["train_detail","기술스택을 선택해 주세요."]
                               
      ]);

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_academySave() {

      if (!fn_academyValidate()) {
         return;
      }

      var param = {
         action : $("#action").val()
         ,resume_no: $("#resume_no").val()
         ,train_code :$("#train_code").val()
         ,train_startYear: $("#train_startYear").val()
         ,train_startMonth: $("#train_startMonth").val()
         ,train_endYear : $("#train_endYear").val()
         ,train_endMonth : $("#train_endMonth").val()
         ,train_name : $("#train_name").val()
         ,train_agency : $("#train_agency").val()
         ,train_detail: $("#train_detail").val()

      }   
      var academysavecallback = function(reval) {
         console.log("adsfasdfasdfasdfasdfsadfs"+ JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_academylist()
         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }

      callAjax("/myprsm/academysave.do", "post", "json", false, param , academysavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   function fn_academyselectone(no) {
      
      //alert(no);
      
      var param = {
            train_code : no
      }
      
      var academyselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         academyopenpopup(returndata.academyselect);
         
         // 모달 팝업
         gfModalPop("#academylayer1");
         
      }
      
      callAjax("/myprsm/academyselectone.do", "post", "json", false, param, academyselectoncallback) ;
      
   }
   

   
   function fn_introductionlist() {
      
      var param = {
        resume_no : $("#resume_no").val()
        ,introduce_no : $("#introduce_no").val()
        ,introduce_name : $("#introduce_name").val()
        ,introduce_content : $("#introduce_content").val()
      }
      
      var introductionlistcallback = function(returnvalue) {
         console.log(returnvalue);
         
         $("#introductionlist").empty().append(returnvalue);
   
      }
      
      callAjax("/myprsm/introductionlist.do", "post", "text", false, param, introductionlistcallback) ;
         
   }
   
   
   function fn_introductionopenpopup() {

      introductionopenpopup();

      // 모달 팝업
      gfModalPop("#introductionlayer1");

   }
   
   function introductionopenpopup(object) {

      if (object == "" || object == null || object == undefined) {
        $("#resume_no").val();
         $("#introduce_no").val("")
         $("#introduce_name").val("");
         $("#introduce_content").val("");
         

         $("#btnDelete").hide();

         $("#action").val("I");
      } else {
        $("#resume_no").val();
         $("#introduce_no").val(object.introduce_no);
         $("#introduce_name").val(object.introduce_name);
         $("#introduce_content").val(object.introduce_content);

         $("#btnDelete").show();
         $("#action").val("U");
      }
   }
   
   function fn_introductionValidate() {

      var chk = checkNotEmpty([ 
                                ["introduce_name", "자기소개서 제목을 입력해 주세요." ]
                         ,["introduce_content", "자기소개서 내용을 입력해주세요." ]
                               
      ]);

      if (!chk) {
         return;
      }

      return true;
   }
   
   function fn_introductionSave() {

      if (!fn_introductionValidate()) {
         return;
      }

      var param = {
         action : $("#action").val()
         ,resume_no: $("#resume_no").val()
         ,introduce_no: $("#introduce_no").val()
         ,introduce_name: $("#introduce_name").val()
         ,introduce_content: $("#introduce_content").val()


      }   
      var introductionsavecallback = function(reval) {
         console.log(JSON.stringify(reval));

         if (reval.returncval > 0) {
            alert("저장 되었습니다.");
            gfCloseModal();
            fn_introductionlist()

         } 
         else {
            alert("오류가 발생 되었습니다.");
         }
      }

      callAjax("/myprsm/introductionsave.do", "post", "json", false, param, introductionsavecallback); //serializeserialize 폼의 값을 JSON형태로 변경

   }
   
   function fn_introductionselectone(no) {
      
//      alert(no);
      
      var param = {
            introduce_no : no
      }
      
      var introductionselectoncallback = function(returndata) {         
         console.log( JSON.stringify(returndata) );
                        
         introductionopenpopup(returndata.introductionselect);
         
         // 모달 팝업
         gfModalPop("#introductionlayer1");
         
      }
      
      callAjax("/myprsm/introductionselectone.do", "post", "json", false, param, introductionselectoncallback) ;
      
   }
   
   function ddff() {
      
      alert($('input:checkbox[id="career_inoffice"]').is(":checked") + " : " + $("#career_inoffice").val());
      
   }
   
   
</script>

</head>
<body>
	   <form id="myForm" action="" method="">
      <input type="hidden" id="action"  name="action"  />
      <input type="hidden" id="resume_no"  name="resume_no"  value="${resumenoselect}" />
      <input type="hidden" id="link_no" name="link_no" value="">
      <input type="hidden" id="degree_code" name="degree_code" value="">
      <input type="hidden" id="career_code" name="career_code" value="">
      <input type="hidden" id="project_code" name="project_code" value="">
      <input type="hidden" id="train_code" name="train_code" value="">
      <input type="hidden" id="introduce_no" name="introduce_no" value="">
      
      

      <!-- 모달 배경 -->
      <div id="mask"></div>

      <div id="wrap_area">

         <h2 class="hidden">header 영역</h2>
         <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

         <h2 class="hidden">컨텐츠 영역</h2>
         <div id="container">
            <ul>
               <li class="lnb">
                  <!-- lnb 영역 --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
               </li>
               <li class="contents">
                  <!-- contents -->
                  <h3 class="hidden">contents 영역</h3> <!-- content -->
                  <div class="content">

                     <p class="Location">
                           <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
                              <span class="btn_nav bold">마이페이지</span> 
                              <span class="btn_nav bold">이력서 등록</span> 
                           <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
                     </p>





        <!-- ------------------- 본문 내용 시작 ---------------------- -->



                <section id="resumepage_container">
        
                <section class="resumepage_head">
                    <h1 class="resumepage_head_h1">이력서 등록 📑</h1>
                </section>



                <section class="resumepage">
                    <div class="resumepage_top">
                        <input type="text" id="resume_name" name="resume_name" placeholder="이력서 타이틀을 입력해주세요." value = "${totalselect.resume_name}" />
                        
                        <div class="resumepage_picture"><i class="fa-solid fa-camera"></i> 사진 추가</div>
                        
                        <div class="name_login">
                            <dl class="name_login_dl">
                                <dt>
                                <dd><i class="fa-solid fa-person"></i>&nbsp;${myprsmModel.name} <span class="devide">|</span> &nbsp;</dd>
                                <dd><i class="fa-solid fa-envelope"></i>&nbsp;${myprsmModel.loginID}</dd>
                                </dt>
                            </dl>
                        </div>

                        <div class="name_login">
                            <dl class="name_login_dl">
                                <dt>
                                <dd><i class="fa-solid fa-calendar"></i>&nbsp;${myprsmModel.user_birthday} <span class="devide">|</span> &nbsp;</dd>
                                <dd><i class="fa-solid fa-phone"></i>&nbsp;${myprsmModel.user_hp}</dd>
                                </dt>
                            </dl>
                        </div>

                    </div>
                </section>


                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>기술스택(업무 툴/스킬) </h3>
                    </div>

                    <div id="skill_icon">
                        <select id="skill1" name="skill1" class="skill1" value="${totalselect.skill1}"></select>
                        <select id="skill2" name="skill2" class="skill2" value="${totalselect.skill2}"></select>
                        <select id="skill3" name="skill3" class="skill3" value="${totalselect.skill2}"></select>
                    </div>
                </section>

                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>링크</h3>
                        <a href="javascript:fn_linkopenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 링크 추가</span></a>
                    </div>
                    
                    <div id="caption">
                    <div id="resume_smallname"><h3>링크 제목</h3></div>
                     <div id="resume_address"><h3>링크 주소</h3></div>
                    </div>            
              
              
                 <!-- linklist GRD 구역 -->
              
                    <div id="linklist">
                       
                    </div>
        
                </section>




                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>학력 </h3>
                        <a href="javascript:fn_eduopenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 학력 추가</span></a>
                    </div>
                    
                    
                    <div id="caption">
                    <div id="resume_smallname"><h3>학교명</h3></div>
                     <div id="resume_address"><h3>학과명</h3></div>
                    </div>      
                    

         
         <!-- edulist GRD 구역 -->
   
                    <div id="edulist">
             
                    </div>
                </section>





                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>경력(업무경험) </h3>
                        <a href="javascript:fn_careeropenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 경력 추가</span></a>
                    </div>
                    
                   <div id="caption">
                    <div id="resume_smallname"><h3>회사명</h3></div>
                     <div id="resume_address"><h3>주요업무 및 성과</h3></div>
                    </div>      


                 <!-- careerlist GRD 구역 -->
                 
                    <div id="careerlist">
                         
                    </div>
                </section>


                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>프로젝트</h3>
                        <a href="javascript:fn_projectopenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 프로젝트 추가</span></a>
                    </div>

                 <div id="caption">
                    <div id="resume_smallname"><h3>프로젝트명</h3></div>
                     <div id="resume_address"><h3>프로젝트 상세내용</h3></div>
                    </div>      


                 <!-- projectlist GRD 구역 -->
                 
                    <div id="projectlist">
                           
                    </div>
                </section>




                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>교육이력</h3>
                        <a href="javascript:fn_academyopenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 교육이력 추가</span></a>
                    </div>

               <div id="caption">
                    <div id="resume_smallname"><h3>교육명</h3></div>
                     <div id="resume_address"><h3>교육기관명</h3></div>
                    </div>      


                 <!-- academylist GRD 구역 -->

                    <div id="academylist">
             
                    </div>
                </section>




                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>자기소개서</h3>
                        <a href="javascript:fn_introductionopenpopup();" name="modal"> <span id="spec_plus"><i class="fa-solid fa-plus"></i> 자기소개서 추가</span></a>
                    </div>

               <div id="caption">
                    <div id="resume_smallname"><h3>소제목</h3></div>
                     <div id="resume_address"><h3>내용</h3></div>
                    </div>      


             <!-- introductionlist GRD 구역 -->
             
                    <div id="introductionlist">

                 </div>
                </section>

                <section class="end_button">
                    <a href="" id="totalSave" name="btn"><span id="savebutton">저장</span></a>
                    <a href="" id="totalDelete" name="btn"><span id="savebutton1">삭제</span></a> 
                </section>

          </section>	
            
   
      <!-- ------------------- 본문 내용 끝 ---------------------- -->
      
<style>

div.layerType2 > dl dd table.row > tbody > tr > th {
    background: #c4dcff;
    font-size: 14px;
    padding-top: 8px;
    padding-bottom: 8px;
    line-height: 1.5;
    text-align: left;
    width: 25%;
}

table.row > tbody > tr > td {
    height: 27px;
    padding: 5px 10px;
    border: 1px solid #e5e5e5;
    color: #868686;
    width: 100%;
}

.content input, .content select {
	border: 1px solid #bbc2cd;
    padding-left: 2px;
    height: 30px;
    border-radius: 5px;
    margin-right: 5px;
    margin-top: 5px;
}

.career_introduction {
	margin-top: 10px;
}

table.row {
    width: 100%;
    text-align: -webkit-auto;
}

.row_career {
	    width: 150px;
}

.career_inoffice {
	font-size: 13px;
}

textarea#career_introduction {
    margin-top: 5px;
}

#project_detail {
	margin-top: 5px;
}

.project_th {
	background: #c4dcff;
    font-size: 14px;
    padding-top: 8px;
    padding-bottom: 8px;
    line-height: 1.5;
    text-align: left;
    width: 105px;
}

#career_skill1, #career_skill2, #career_skill3, #project_skill1, #project_skill2, #project_skill3 {
	width: 120px;
}

.career_period {
    display: flex;
}

.project_period {
	display: flex;
}

input#project_link {
    width: 99%;
}

.project_progress {
	font-size: 13px;
}

#train_name, #train_agency, #train_detail {
	width: 100%;
}

#introduce_name {
	width: 100%;
}

#introduce_content {
	width: 100%;
	height: 300px;
}

</style>
      
      
      <!-- ------------------- 모달 팝업창 구역 ---------------------- -->


      <div id="linklayer1" class="layerPop layerType2" style="width:600px;height:260px;">
         <dl>
            <dt>
               <strong>링크 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row">링크 제목을<br> 입력해주세요</th>
                        <td colspan="3">
                           <input type="text" class="inputTxt p100" name="link_name" id="link_name" />
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">링크 주소를<br> 입력해주세요</th>
                        <td colspan="3">
                           <input type="text" class="inputTxt p100" name="link_address" id="link_address" placeholder="http://, https://를 포함해 작성해주세요." />
                        </td>
                     </tr>

                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="linkbtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="linkbtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>

      <div id="edulayer1" class="layerPop layerType2" style="width:600px;height:300px;">
         <dl>
            <dt>
               <strong>학력 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row">학력을<br> 입력해주세요</th>
                        <td colspan="3">
                           <input type="text" placeholder="YYYY" id="graduation_year" name="graduation_year" maxlength="4" value="" style="width: 40px;" />.
                           <input type="text" placeholder="MM" id ="graduation_month" name="graduation_month" maxlength="2" value="" style="width: 30px;" />
                           <select id="degree_dropout" name="degree_dropout" style="width :100px;">
                              <option value="y"  >졸업(예정)</option>
                              <option value="n">중퇴</option>                        
                           </select>
                            <p>
                            <select id="degree_division" name="degree_division" style="width :100px;">
                               <option value="0">학력구분</option>
                              <option value="1"  >고등학교</option>
                              <option value="2">대학(2,3년)</option>
                              <option value="3">대학(4년)</option>
                              <option value="4">대학원(석사)</option>
                              <option value="5">대학원(박사)</option>                        
                           </select>
                           <input type="text"  id="degree_school" name="degree_school" placeholder="학교명을 입력해주세요" />
                           </p>
                           <p>
                               <input type="text" id="degree_major" name="degree_major" placeholder="학과명을 입력해주세요" />
                           </p>
                           <p>
                               <input type="text" id="degree_grade" name="degree_grade" placeholder="학점" style="width: 40px;" />/
                              <select id="degree_credit" name="degree_credit" style="width :100px;">
                                 <option value="0">기준학점</option>
                                 <option value="4.5" >4.5</option>
                                 <option value="4.0">4.0</option>                        
                              </select>
                           </p>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="edubtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="edubtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>

      <div id="careerlayer1" class="layerPop layerType2" style="width:600px;height:380px;">
         <dl>
            <dt>
               <strong>경력 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody class="tr_career">
                     <tr class="tr_career">
                        <th class="row_career">경력을 <br>입력해주세요</th>
                        <td id="career_td">
                        	<div class="career_period">
                            <input type="text" placeholder="YYYY" id="career_joinYear" name="career_joinYear" maxlength="4" value=""style="width: 40px;" />. 
                              <input type="text" placeholder="MM" id="career_joinMonth"  name="career_joinMonth" maxlength="2" value=""style="width: 30px;" /> - 
                            <input type="text" placeholder="YYYY" id="career_outYear"  name="career_outYear" maxlength="4" value="" style="width: 40px;" />. 
                            <input type="text" placeholder="MM" id="career_outMonth"  name="career_outMonth" maxlength="2" value="" style="width: 30px;" />
                             <p>
                                 <input type="checkbox" id="career_inoffice" name="career_inoffice" true-value="Y"  false-value="N">
                                 <a href="javascript:ddff()" id="btnddff" name="btnddff"><label for="career_inoffice" class="career_inoffice">재직중</label></a>
                              </p> 
                              </div>
                             <input type="text" id="career_company" name="career_company"placeholder="회사명을 입력해주세요"> 
                             <p>
                                 <input type="text" id="career_department" name="career_department" placeholder="부서명" style="width: 40px;" />/
                                 <input type="text" id="career_position" name="career_position" placeholder="직책" style="width: 40px;" />
                             </p>
                              <div class="skill_icon">
                                     <select id="career_skill1" name="career_skill1" class="career_skill1"></select>
                                      <select id="career_skill2" name="career_skill2" class="career_skill2"></select>
                                      <select id="career_skill3" name="career_skill3" class="career_skill3"></select>
                                </div>
                                 
                             
                             <p>
                                 
                                 <textarea id="career_introduction" name="career_introduction" placeholder="주요업무 및 성과를 작성해주세요" ></textarea>
                             </p> 
 
                         </td>
                     </tr>
                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="careerbtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="careerbtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>
      
      
      <div id="projectlayer1" class="layerPop layerType2" style="width:600px;height:395px;">
         <dl>
            <dt>
               <strong>프로젝트 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row" class="project_th">프로젝트 내용을 입력해주세요</th>
                        <td>
                        <div class="project_period">
                            <input type="text" placeholder="YYYY" id="project_startYear" name="project_startYear" maxlength="4" value=""style="width: 40px;" />. 
                              <input type="text" placeholder="MM" id=",project_startMonth"  name=",project_startMonth" maxlength="2" value=""style="width: 30px;" /> - 
                            <input type="text" placeholder="YYYY" id="project_endYear"  name="project_outYear" maxlength="4" value="" style="width: 40px;" />. 
                            <input type="text" placeholder="MM" id="project_endMonth"  name="project_outMonth" maxlength="2" value="" style="width: 30px;" />
                             <p>
                                 <input type="checkbox" id="project_progress" name="project_progress" true-value="Y"  false-value="N">
                                 <a href="javascript:ddff()" class="" id="btnddff" name="btnddff"> <label for="project_progress" class="project_progress">진행중</label></a>
                              </p> 
                              </div>
                             <input type="text" id="project_name" name="project_name" placeholder="프로젝트명을 입력해주세요"> 
                             
                             <div class="skill_icon">
                                     <select id="project_skill1" name="project_skill1" class="project_skill1"></select>
                                      <select id="project_skill2" name="project_skill2" class="project_skill2"></select>
                                      <select id="project_skill3" name="project_skill3" class="project_skill3"></select>
                                </div>
                             
                             <p>
                                 
                                 <textarea id="project_detail" name="project_detail" placeholder="프로젝트 상세내용을 작성해주세요." ></textarea>
                                 <input type="text" id="project_link" name="project_link" placeholder="저장소 링크"/>
                             </p>
                         </td>
                     </tr>
                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="projectbtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="projectbtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>
      
      
      
      
      <div id="academylayer1" class="layerPop layerType2" style="width:600px;height:300px;">
         <dl>
            <dt>
               <strong>교육이력 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row">교육이력을 입력해주세요</th>
                        <td>
                            <input type="text" placeholder="YYYY" id="train_startYear" name="train_startYear" maxlength="4" value=""style="width: 40px;" />. 
                              <input type="text" placeholder="MM" id="train_startMonth"  name="train_startMonth" maxlength="2" value=""style="width: 30px;" /> - 
                            <input type="text" placeholder="YYYY" id="train_endYear"  name="train_endYear" maxlength="4" value="" style="width: 40px;" />. 
                            <input type="text" placeholder="MM" id="train_endMonth"  name="train_endMonth" maxlength="2" value="" style="width: 30px;" />

							<div>		
                             <input type="text" id="train_name" name="train_name" placeholder="교육과정명을 입력해주세요"> 
                              <input type="text" id="train_agency" name="train_agency" placeholder="교육기관명을 입력해주세요">
                               <input id="train_detail" name="train_detail" placeholder="교육과정 상세내용을 작성해주세요."/ >
 						</div>
                         </td>
                     </tr>
                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="academybtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="academybtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>
      
      
      <div id="introductionlayer1" class="layerPop layerType2" style="width: 550px;">
         <dl>
            <dt>
               <strong>자기소개서 등록</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row">자기소개서를<br> 입력해주세요</th>
                        <td>
                            <input type="text" id="introduce_name" name="introduce_name" placeholder="소제목을 입력해주세요." />
                           <input type="text" id="introduce_content" name="introduce_content" placeholder="자기소개서 내용을 작성해주세요." /> 
                         </td>
                     </tr>
                  </tbody>
               </table>
               <!-- e : 여기에 내용입력 -->
               <div class="btn_areaC mt30">
                  <a href="" class="btnType blue" id="introductionbtnSave" name="btn"><span>저장</span></a>
                  <a href="" class="btnType blue" id="introductionbtnDelete" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>   
      
      
                           <!-- ------------------- 모달 팝업창 구역 끝 ---------------------- -->
    
                     </div>
                    </li>
             </ul>
          </div>
       </div>
      </form> 
</body>
</html>