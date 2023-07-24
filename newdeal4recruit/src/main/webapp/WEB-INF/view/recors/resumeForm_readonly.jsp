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
      
      fn_linklist();
	  fn_edulist();
	  fn_careerlist();
	  fn_projectlist();
	  fn_academylist();
	  fn_introductionlist();

   });


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
                        <input type="text" id="resume_name" name="resume_name" placeholder="이력서 타이틀을 입력해주세요." value = "${totalselect.resume_name}" readonly/>
                        
                        <div class="resumepage_picture"><i class="fa-solid fa-camera"></i> 사진 추가</div>
                        
                        <div class="name_login">
                            <dl class="name_login_dl">
                                <dt>
                                <dd><i class="fa-solid fa-person" re></i>&nbsp;${userinfo.name} <span class="devide">|</span> &nbsp;</dd>
                                <dd><i class="fa-solid fa-envelope"></i>&nbsp;${userinfo.loginID}</dd>
                                </dt>
                            </dl>
                        </div>

                        <div class="name_login">
                            <dl class="name_login_dl">
                                <dt>
                                <dd><i class="fa-solid fa-calendar"></i>&nbsp;${userinfo.user_birthday} <span class="devide">|</span> &nbsp;</dd>
                                <dd><i class="fa-solid fa-phone"></i>&nbsp;${userinfo.user_hp}</dd>
                                </dt>
                            </dl>
                        </div>

                    </div>
                </section>


                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>기술스택(업무 툴/스킬) </h3>
                    </div>

                    <div id="skill_icon" >
                        <select id="skill1" name="skill1" class="skill1" value="${totalselect.skill1}" disabled></select>
                        <select id="skill2" name="skill2" class="skill2" value="${totalselect.skill2}" disabled></select>
                        <select id="skill3" name="skill3" class="skill3" value="${totalselect.skill2}" disabled></select>
                    </div>
                </section>

                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>링크</h3>
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
                    </div>
                    
                   <div id="caption">
                    <div id="resume_smallname"><h3>회사명</h3></div>
                     <div id="resume_address"><h3>재직여부</h3></div>
                    </div>      


                 <!-- careerlist GRD 구역 -->
                 
                    <div id="careerlist">
                         
                    </div>
                </section>


                <section class="resumepage">
                    <div class="resumesection_head">
                        <h3>프로젝트</h3>
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
                    </div>

               <div id="caption">
                    <div id="resume_smallname"><h3>소제목</h3></div>
                     <div id="resume_address"><h3>내용</h3></div>
                    </div>      


             <!-- introductionlist GRD 구역 -->
             
                    <div id="introductionlist">

                 </div>
                </section>


          </section>	
            
   
      <!-- ------------------- 본문 내용 끝 ---------------------- -->
      
     
                     </div>
                    </li>
             </ul>
          </div>
       </div>
      </form> 
</body>
</html>