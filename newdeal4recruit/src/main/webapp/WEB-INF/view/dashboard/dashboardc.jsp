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

#main_content_list {
   justify-content: space-between;
   padding-top: 20px;
   padding-left: 10px;
   padding-right: 10px;

}

#recruit_common_head_name {
    font-size: 18px;
    color: #464646;
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



</style>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include> 
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js" defer></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js" defer></script>


</head>
<body>
<form id="myForm" action=""  method="">

   <input type="hidden" id="currentPage" value="1">
   <input type="hidden" id="selectedInfNo" value="">
      
      
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
               
               
         
         
         <!-- 상단 광고 배너 -->
               
           <div class="carousel-wrapper">
             <div class="carousel">
                <img src="/images/home/banner1.png" alt=""/>
                  <img src="/images/home/banner2.png" alt=""/>
                  <img src="/images/home/banner3.png" alt=""/>
             </div>
           </div>
          


 <!-- css가 적용되지 않아, 부득이하게 이 구역에 작성함 -->
            
 <style>
 
 .resume_ul {
	display: flex;
    width: 800px;
    flex-wrap: wrap;
 }
 
 .resume_box {
    display: inline-block;
    width: 220px;
    height: 150px;
    cursor: pointer;
    background-color: #eeeeee;
    border-radius: 20px;
    margin-left: 5px;
    margin-right: 10px;
    border: 2px solid #777777;
    text-align: center;
}
            
.skill_button {
    margin-top: 15px;
}

.stack_skill {
    margin-right: 5px;
    font-size: 13px;
    color: #ffffff;
    pointer-events: none;
    box-sizing: border-box;
    border-radius: 5px 5px;
    border: none;
    padding-left: 7px;
    padding-right: 7px;
    padding-top: 4px;
    padding-bottom: 4px;
    margin-top: 3px;
    background-color: #204d74;
}

.resume_firsth3 {
    font-size: 18px;
    color: rgb(97, 97, 97);
    line-height: 1.3;
    word-break: keep-all;
    word-wrap: normal;
    padding: 10px;
    margin-top: 5px;
}

.resume_li {
	margin-bottom: 20px;
	margin-left: 10px;
}


</style>
            
            

         
      <!-- 추천 공고 리스트 -->
               
         <section id="main_recruitlist">   
               <div id="main_recruitlist_head">
                                <ul id="main_recruitlist_flex">
                                   <li id="main_recruitlist_head_name"><a href="/recors/openresume.do"><h1>#🏃‍♂️ 신규 인재</h1></a></li>
                                   <li id="main_recruitlist_head_plus"><a href="/recors/openresume.do"><h2>전체보기</h2></a></li>
                                </ul>
               </div>
            
                  <div id="main_content_list">
                         <div class="main_content-pic">
                
                          <ul class="resume_ul">
                       
                       	
   							<c:if test="${totalcnt eq 0 }">
     								<p>--- 작성된 글이 없습니다 ---</p>
    						</c:if>
   			
   			
   				 			<c:if test="${totalcnt > 0 }">	
    				 	
							<c:forEach var="item" items="${openresumelist}" begin="0" end="5" step="1">
            
                           <li class="resume_li"> 
                               <a href="../recors/resumeselectone.do?resume_no=${item.resume_no}">  
                               
                             <div class="resume_box">                
                                  <h3 class="resume_firsth3"> ${item.resume_name}</h3>
       										<div class="skill_button">
       												<button class="stack_skill">${item.skill1name}</button>
       					 							<button class="stack_skill">${item.skill2name}</button>
       					   							<button class="stack_skill"> ${item.skill3name}</button>
											</div>
								</div>
                               </a>

                               	</c:forEach>
			 
				 </c:if>   			
                                
                           
                       </li>
           
                      </ul>
                         
                  </div>   
            </div>   
    </section>
            

               <!-- 중간 배너 -->
         <section id="main_recruitlist_banner">
         <div id="banner_small">
                   <img src="${CTX_PATH}/images/home/blank_box_banner.gif">
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
        
         <!-- 공백용 끝 -->
        </li>   

      
   </section> 
</form>



 

</body>
</html>