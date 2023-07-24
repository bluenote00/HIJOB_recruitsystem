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

.main_content-li {
	width: 230px;
	height: 330px;
    text-wrap: wrap;
}

#main_content_piece p {
	padding-top: 6px;
	padding-bottom: 2px;
}

.main_content-pic img {
	border-radius: 15px;
	width: 220px;
	height: 180px;
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
	font-size: 20px;
	color: #464646;
	font-weight: 400;
}

#recruit_common_title_name {
	font-size: 17px;
}

#recruit_common_stack_name {
	font-size: 14px;
	color: #464646;
	pointer-events: none;
	box-sizing: border-box;
	border-radius: 60px 60px;
	border: none;
	padding-left: 6px;
    padding-right: 6px;
    padding-top: 3px;
    padding-bottom: 3px;
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
  position: relative;
  background: rgba(255, 255, 255, 0);
  outline: 0;
  font-size: 23px;
  cursor: pointer;
  color: #FF096C;
  padding: 5px 10px;
  top: -175px;
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

			// 슬라이드 배너 버튼  
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
 			   
 			    <div class="carousel-controls">
      				<button class="prev" onclick="prevSlide()"><i class="fa-solid fa-arrow-left"></i></button>
      				<button class="next" onclick="nextSlide()"><i class="fa-solid fa-arrow-right"></i></button>
    			</div>
  			</div>
    		

			
		<!-- 추천 공고 리스트 -->
					
			<section id="main_recruitlist">	
				
 	</section>
  		 	
  		 	
  		 		<!-- 중간 배너 -->
  		 <section id="main_recruitlist_banner">
			<div id="banner_small">
   			 		<img src="${CTX_PATH}/images/home/blank_box_banner.gif">
			</div>
		</section>
			
			
		<!-- 신규 공고 리스트 -->
					
			<section id="main_recruitlist">	
				
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