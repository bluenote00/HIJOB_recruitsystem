<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="X-UA-Compatible" content="ie=chrome">
<title>하이잡</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>


#wrap_area {
   position: relative;
}

#container ul li.contents {
   width: 800px;
}


.paging {
    height: 33px;
    padding: 0 5px;
    line-height: 33px;
    vertical-align: middle;
}


.buttonlist {
    display: flex;
    padding-left: 20px;
    padding-top: 20px;
    padding-bottom: 30px;
}

.skill_icon {
   padding-right: 20px;
}

#city1combo {
   padding-right: 10px;
   margin-right: 20px;
}

.dtlcombo {
   width: 150px;
   height: 40px;
   border-radius: 10px;
   padding-left: 5px;
   border: 1px solid #C4C4C4;
}

.recruit_button {
   padding-top: 10px;
   padding-left: 100px;
}

#recruit_write {
   color: rgb(68, 68, 68);
   background-color: #f0f0f0;
   border-radius: 20px 20px 20px 20px;
   border: 1px solid rgb(228, 228, 228);
   font-size: 18px;
   padding-left: 25px;
    padding-right: 25px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

 .carousel-wrapper {
      width: 800px;
      height: 450px;
      overflow: hidden;
    }
    
 .carousel {
      display: flex;
      width: 2400px; /* 800px * 3 images */
      animation: slide 15s infinite;
    }
    
 .carousel img {
      width: 800px;
      height: 450px;
    }
    
@keyframes slide {
      0% { transform: translateX(0); }
      33.33% { transform: translateX(-800px); }
      66.66% { transform: translateX(-1600px); }
      100% { transform: translateX(0); }
    }

#main_recruitlist {
   padding: 20px;
   padding-top: 30px;
}

#main_recruitlist_head {
   padding-top: 30px;
}

#main_recruitlist_head_name h1 {
   font-size: 25px;
   padding-bottom: 20px;
}

#main_recruitlist_head_plus h2 {
   font-size: 18px;
}

#main_recruitlist_flex {
   display: flex;
   justify-content: space-between;
}

#main_content_piece {
   padding-top: 15px;
   line-height: 23px;
}

#main_content_piece:hover {
     color: #0093ff;
}

#main_content_list {
   padding-top: 20px;
   margin-left: 20px;
}

#main_content-li {
   text-align: top;
   vertical-align: top;
   width: 230px;
   height: 380px;
    text-wrap: wrap;
    display: inline-block;
    padding-right:14px;
    position: relative;
}

#main_content_piece p {
   padding-top: 4px;
   padding-bottom: 2px;
}

.main_content-pic img {
   border-radius: 7px;
   width: 220px;
   height: 160px;
}

 .list_pic1 {
      transition: box-shadow 0.1s ease-in-out;
    }

 .list_pic1:hover {
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
    }
    
  .list_pic2 {
      transition: box-shadow 0.1s ease-in-out;
    }

 .list_pic2:hover {
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
    }

.like_heart img {
   width: 30px;
   height: 30px;
   z-index: 10;
}

#recruit_common_head_name {
    font-size: 18px;
    font-weight: 600;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

#recruit_common_title_name {
   font-size: 16px;
}


#recruit_common_stack_name {
   font-size: 13px;
   color: #464646;
   pointer-events: none;
   box-sizing: border-box;
   border-radius: 60px 60px;
   border: none;
   padding-left: 7px;
    padding-right: 7px;
    padding-top: 4px;
    padding-bottom: 4px;
    margin-top: 3px;
}


#main_recruitlist_banner {
   padding-top: 30px;
   padding-bottom: 30px;
}


#banner_small {
   text-align: center;
   margin: auto;
}

#banner_small img {
   background-color: #AADBFF;
   width: 700px;
   height: 130px;
   text-align: center;
   margin: auto;
   border-radius: 20px;
}


#main_blank {
   padding-top: 200px;
   padding-bottom: 200px;
}

#main_blank2 {
   padding-top: 400px;
   padding-bottom: 400px;
}


button.like_button {
  position: absolute;
  background: rgba(255, 255, 255, 0);
  outline: 0;
  font-size: 23px;
  cursor: pointer;
  color: #ff0223;
  padding: 5px 10px;
  top: 120px;
  left: 172px;
  visibility: hidden;   
}

button.liked {
  color: #FF096C;
}

button.liked i{
  animation: anim 0.5s ease-in-out;
  -webkit-animation: anim 0.5s ease-in-out;
}

@keyframes anim {
  100% {
    transform: rotate(-15deg) scale(1.3);
    -webkit-transform: rotate(-15deg) scale(1.3);
    -moz-transform: rotate(-15deg) scale(1.3);
    -ms-transform: rotate(-15deg) scale(1.3);
    -o-transform: rotate(-15deg) scale(1.3);
    filter: blur(0.5px);
    -webkit-filter: blur(0.5px);
  }

  
    .fa-regular.fa-heart {
    transition: color 0.3s; 
    z-index:10;
  }
  
  .fa-solid.fa-heart {
    color: #FF096C; 
    z-index:11;
  }

#main_content-ul {
   display: flex;
   text-align: top;
   vertical-align: top;
}



 

</style>

<script type="text/javascript">

/** 공통 콤보 */

   // 페이징 설정
   var pageSize = 9;     
   var pageBlockSize = 5;    


$(function(){
   comcombo("dtlcodeCD","dtlcombo1","all","");
   comcombo("dtlcodeCD","dtlcombo2","all","");
   comcombo("dtlcodeCD","dtlcombo3","all","");
   
   comcombo("addressCD","city1combo","all","");
   
   $('#city1combo').change(function() {   
      comcombo($("#city1combo").val(),"city2combo","all","");
   });
      
      // 버튼 이벤트 등록
      writebtn();   
      employeelist();

});
        

          function writebtn() {
              if ($("#user_type").val() === "C" || $("#user_type").val() === "A") {
                  $("#btnwrite").show();
                  
              } else {
                  $("#btnwrite").hide();
              }
          }

          
          

          function employeelist(pagenum) {
        	  
        	    pagenum = pagenum || 1;

        	    var param = {
        	        pageSize: pageSize,
        	        pageBlockSize: pageBlockSize,
        	        pagenum: pagenum,        	    	
        	        city1_no : $("#city1combo").val(),
        	        city2_no : $("#city2combo").val(),
        	        dtlcombo1 : $("#dtlcombo1").val()
        	    }

        	    var listcallback = function(returnvalue) {
        	    
        	        $("#main_content_list").empty().append(returnvalue);

        	        var totalcnt = $("#totalcnt").val();
        	        
        	        console.log("totalcnt : " + totalcnt);

        	        var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'employeelist');
        	        console.log("paginationHtml: " + paginationHtml);

        	        $("#mainContentPagination").empty().append( paginationHtml );

        	        $("#pageno").val(pagenum);
        	    }

        	    callAjax("/recerc/employeegrd.do", "post", "text", false, param, listcallback);
        	}
       

         function fn_likechk(no, userlikeyn) {
             //event.preventDefault();
             console.log(no, userlikeyn)
             var userlikeyn = userlikeyn
   
            if(userlikeyn === 'N') {
               fn_liked(no)
               
            }
            else if(userlikeyn === 'Y') {
               fn_unliked(no)
               
            }   
            else   {
               alert("오류가 발생 되었습니다. userlikeyn=null");            
            }
         
      }
          

         function fn_liked(no) {
//             event.preventDefault();
             
          var param = { 
                corecruit_no : no
                }
          
          alert("좋아요 +1")
             
          var likecallback = function(revall) {         
            
            
            if(revall.returncval > 0) {
               alert("저장 되었습니다.");
               
            }  else {
               alert("오류가 발생 되었습니다.");            
            }
            
          }
          callAjax("/myplil/likeNew.do", "post", "json", false, param, likecallback) ;
      }

          
          
          function fn_unliked(no) {
          //   event.preventDefault();
             $("#action").val("D");   
          var param = { 
                corecruit_no : no,
                action : $("#action").val() 
                }
          
          alert("좋아요 -1")
             
          var likecallback = function(revall) {         
            
            
            if(revall.returncval > 0) {
               alert("저장 되었습니다.");
               
            }  else {
               alert("오류가 발생 되었습니다.");            
            }
            
          }
          callAjax("/myplil/likedelete.do", "post", "json", false, param, likecallback) ;
      }
          
         

</script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include> 
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js" defer></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js" defer></script>


</head>
<body>
<form id="myForm" >

   <input type="hidden" id="currentPage" value="1">
   <input type="hidden" id="selectedInfNo" value="">
   <input type="hidden" id="pageno"  name="pageno"  />
   <input type="hidden" id="user_type" name="user_type" value ="${user_type}"/>   
   <input type="hidden" id=corecruit_no  name="corecruit_no"  value ="${corecruit_no}" />

      
      
         <!-- 모달 배경 -->
      
    <div id="mask"></div>

   <section id="wrap_area">

         <h2 class="hidden">컨텐츠 영역</h2>
            <div id="container">
                  <ul>
                     <li class="lnb">
               
                         <!-- lnb 영역 --> 
                        <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
                     </li>

                     <li class="contents">
                        <!-- contents -->
                        <h3 class="hidden">contents 영역</h3> <!-- content -->
                  
                      <div class="content">
                       
                            <p class="Location">
                                  <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
                                 <span class="btn_nav bold">메인</span>
                                  <a href="../dashboard/dashboard.do" class="btn_set refresh">새로고침</a>
                           </p>
                      </div>
                      
                      <section id="main_recruitlist">   
                            
                            
                            <!-- 리스트 제목 -->
                            <div id="main_recruitlist_head">
                                      <ul id="main_recruitlist_flex">
                                         <li id="main_recruitlist_head_name"><a href="/recerc/employee.do"><h1>#🏦 공고 리스트</h1></a></li>
                                      </ul>
                           </div>
                  
                  
                             <!-- 상단 필터링 + 작성 버튼 -->            
                            <div class="buttonlist">
                                 <div class="skill_icon">
                                           <select id="dtlcombo1" name="dtlcodeCD" class="dtlcombo" onChange="javascript:employeelist()"></select>
                                      </div>
                                      
                                      <div class="city_combo">
                                           <select id="city1combo" name="city1_no" class="dtlcombo" onChange="javascript:employeelist()"></select>
                                        	 <select id="city2combo" name="city2_no" class="dtlcombo" onChange="javascript:employeelist()"></select>
                                   </div>
                                   
                                   <div class="recruit_button">
                                 <a href="/myprmg/adverwrite.do" id="btnwrite" name="btn"><span id="recruit_write">공고작성</span></a>
                              </div>
                                </div>   
                                
                                
                            <!-- 그리드영역 (employeegrd) -->
                            
                                <div id="main_content_list">
                                		
                                		
                                </div>
                               
                               
                            <!-- 페이지네이션 -->
                                      <div class="paging" id="mainContentPagination"> </div>   
                                      
                           </section>
                           
                      
                           
                          <!-- 하단 배너 -->
                           <section id="main_recruitlist_banner">   
                               <div id="banner_small">
                                         <img src="${CTX_PATH}/images/home/blank_box_banner2.jpg">
                               </div>
                           </section>      
                           
                                 <!-- 공백용 -->        
                           <section class="main_blank">
                              <div class="main_blank">
                                   <p>&nbsp;</p>
                                 <p>&nbsp;</p>
                                 <p>&nbsp;</p>
                             </div>
                           </section>                
                     </li>      
                  </ul>
                 

            </div>
   </section>
</form>
</body>            
            
                      

</html>