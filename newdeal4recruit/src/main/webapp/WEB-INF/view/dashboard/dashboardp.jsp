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

#main_content_piece:hover {
     color: #0093ff;
    }

#main_content_list {
	padding-top: 20px;
	margin-left: 20px;
}

.main_content-li {
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
  /* visibility: hidden; */
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

.main_content-ul {
	display: flex;
	text-align: top;
	vertical-align: top;
}
 

</style>

<script type="text/javascript">

	// 좋아요 버튼 - mouseover / out 기능
		  $(function(){
			  $(".list_pic1").mouseover(function(){
			    $(".fa-regular.fa-heart").css("visibility","visible");
			  }).mouseout(function(){
			    $(".fa-regular.fa-heart").css("visibility","hidden");
			  });
			});
		  
		  $(function(){
			  $(".list_pic2").mouseover(function(){
			    $(".fa-regular.fa-heart").css("visibility","visible");
			  }).mouseout(function(){
			    $(".fa-regular.fa-heart").css("visibility","hidden");
			  });
			});
		  
		// 좋아요 버튼 - click 기능  
		  $(function(){
			    $(".like_button").click(function(){
			      var heartIcon = $(this).find(".fa-regular.fa-heart");
			      heartIcon.toggleClass("fa-regular");
			      heartIcon.toggleClass("fa-solid");
			      

			    });
			  });

		  		
		  var carousel = document.querySelector('.carousel');
		    var prevButton = document.querySelector('.prev');
		    var nextButton = document.querySelector('.next');
		    var imageWidth = 800;
		    var index = 0;
		    
		    function prevSlide() {
		      if (index === 0) {
		        index = 2;
		      } else {
		        index--;
		      }
		      carousel.style.transform = 'translateX(-' + (imageWidth * index) + 'px)';
		    }
		    
		    function nextSlide() {
		      if (index === 2) {
		        index = 0;
		      } else {
		        index++;
		      }
		      carousel.style.transform = 'translateX(-' + (imageWidth * index) + 'px)';
		    }
		    
		    var savecallback = function(reval) {
	            console.log( JSON.stringify(reval) );
	            
	            if(reval.returncval > 0) {
	               alert("지원이 완료되었습니다.");
	            } if (reval.returncval == 0) {
	               alert("이미 지원한 공고입니다.");
	            } if (reval.returncval < 0) {
	               alert("오류가 발생하였습니다.");
	            }
	       
	         
	            callAjax("/myprmg/adverapply.do", "post", "json", false, param , savecallback);
	         
	   }
			
		    function fn_liked(no) {
		    event.preventDefault();

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
	    	

</script>

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
 			     			
			
		<!-- 추천 공고 리스트 -->
					
			<section id="main_recruitlist">	
					<div id="main_recruitlist_head">
   			 						 <ul id="main_recruitlist_flex">
   		  								<li id="main_recruitlist_head_name"><a href="#"><h1>#😍 ${sessionScope.userNm}님을 위한 추천 포지션</h1></a></li>
   		  								<!-- <li id="main_recruitlist_head_plus"><a href="#"><h2>전체보기</h2></a></li> -->
   		  							</ul>
					</div>
				
   					<div id="main_content_list">
   		 					<div class="main_content-pic">
   		 		
   		 		 			<ul class="main_content-ul">

			<c:choose>
    						<c:when test="${empty adverlist_like}">
     						<p>--- 작성된 글이 없습니다 ---</p>
     						</c:when>
     			
     						<c:otherwise>
    						<c:forEach var="item" items="${adverlist_like }" begin="0" end="5" step="1">


  				 				<li class="main_content-li"> 
  				  					<a href="/myprmg/adverselectone.do?corecruit_no=${item.corecruit_no }">  				  	
  				  							<img src="${item.att_logpath }" class="list_pic1">
   				   							
   				    					<div id="main_content_piece">
       										<p id="recruit_common_head_name">${item.corecruit_title }</p>
       										<p id="recruit_common_title_name">${item.user_coname }</p>
       										
       										<c:forEach var="skillitem" items="${item.skillist }" begin="0" step="1">
												<button id="recruit_common_stack_name">  ${skillitem.detail_name }</button>
       										</c:forEach>
   											<!-- 지역 표시 -->
       										<p id="recruit_common_etc_name">${item.city1_name } ${item.city2_name }</p>
      								   </div>
      								 </a>

										 
      									<button class="like_button" onclick="javascript:fn_liked('${item.corecruit_no}')" >
			  													<i class="fa-regular fa-heart"></i>
										</button>
									
     						</li>
     			</c:forEach>
     					
					</c:otherwise>
			</c:choose> 
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
			
			
		<!-- 신규 공고 리스트 -->
					
			<section id="main_recruitlist">	
					<div id="main_recruitlist_head">
   			 						 <ul id="main_recruitlist_flex">
   		  								<li id="main_recruitlist_head_name"><a href="/recerc/employee.do"><h1>#✨ 신규 공고</h1></a></li>
   		  								<li id="main_recruitlist_head_plus"><a href="/recerc/employee.do"><h2>전체보기</h2></a></li>
   		  							</ul>
					</div>
				
   					<div id="main_content_list">
   		 					<div class="main_content-pic">
   		 		
   		 		 			<ul class="main_content-ul">
   		 		 		
						<c:choose>
    							<c:when test="${empty adverlist_new }">
     								<p>--- 작성된 글이 없습니다 ---</p>
     								</c:when>
     			
     							<c:otherwise>
    					<c:forEach var="item" items="${adverlist_new }" begin="0" end="5" step="1">

  				 				<li class="main_content-li"> 
  				  					<a href="/myprmg/adverselectone.do?corecruit_no=${item.corecruit_no }">  				  	
  				  							<img src="${item.att_logpath }" class="list_pic2">
   				   							
   				    					<div id="main_content_piece">
       										<p id="recruit_common_head_name">${item.corecruit_title }</p>
       										<p id="recruit_common_title_name">${item.user_coname }</p>
       										
       										<c:forEach var="skillitem" items="${item.skillist }" begin="0" step="1">
       										<button id="recruit_common_stack_name">  ${skillitem.detail_name }</button>
       										</c:forEach>
       										<!-- 지역 표시 -->
       										<p id="recruit_common_etc_name">${item.city1_name } ${item.city2_name }</p>
      								   </div>
      								 </a>

									<button class="like_button" type="button" onclick="javascript:fn_liked('${item.corecruit_no}')" >
			  														<i class="fa-regular fa-heart"></i>
													</button>
									
     						</li>
     						
     						</c:forEach>
     					
					</c:otherwise>
			</c:choose>
   						 </ul>
   					 		
  		 			</div>	
  		 	</div>	
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
        
      	<!-- 공백용 끝 -->

        </li>	


  
         
   </section> 
</form>



 

</body>
</html>