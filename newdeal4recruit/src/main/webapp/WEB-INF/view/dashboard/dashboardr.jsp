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

<script type="text/javascript">
	// Execute the function when the page is loaded
	window.addEventListener('DOMContentLoaded', fn_openpopup);
	
	function fn_openpopup() {
		  popupinit();
		  
		  // 모달 팝업
		  gfModalPop("#layer1");
		  
	}
	
	function popupinit(object) {
	  $("#msg_no").text("");
	  $("#msg_title").text("");
	  $("#msg_content").text("");
	} 


		
	function fModificationalert() {
		alert("가입 정보를 불러옵니다.");
	}
</script>

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
	
	
	#modalPopup {
	  display: none;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: white;
	  border-radius: 8px;
	  padding: 20px;
	  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	}
	
	#modalPopup p {
	  font-size: 18px;
	  margin-bottom: 20px;
	  text-align: center;
	}
	
	#modalPopup button {
	  display: block;
	  margin: 0 auto;
	  padding: 10px 20px;
	  background-color: #007bff;
	  color: white;
	  border: none;
	  border-radius: 4px;
	  font-size: 16px;
	  cursor: pointer;
	}


</style>


<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include> 
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js" defer></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js" defer></script>

</head>
<body>
<form id="myForm" action=""  method="post">

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
 			<button class="prev" onclick="prevSlide()"><img src="${CTX_PATH}/images/home/arrow-left2.png"></button>
   			<button class="next" onclick="nextSlide()"><img src="${CTX_PATH}/images/home/arrow-right2.png"></button>
 		</div>
 			     			
			
  		 	
  		 <!-- 중간 배너 -->
  		 <section id="main_recruitlist_banner">
			<div id="banner_small">
   			 	<img src="${CTX_PATH}/images/home/blank_box_banner.gif">
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
        </ul>
      </div>
    </section>
    
    <div id="layer1" class="layerPop layerType2" style="width: 600px; border: 3px solid #3cb3eb;">
		<dl>
			<dt style="background-color: #3cb3eb">
				<strong style="color: #fbe441;">※ 승인이 반려 되었습니다.</strong>
			</dt>
			<dd class="content" style="padding:20px 20px; font-weight: bold;">
				<p style="margin-bottom:10px;">가입 승인 반려로 인해 일부 기능이 <span style="color:red;">제한</span> 됩니다.</p>
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<c:choose>
    				<c:when test="${empty messages }">
     					<p>--- 작성된 글이 없습니다 ---</p>
     				</c:when>

     			
     						<c:otherwise>
    						<c:forEach var="item" items="${messages }" begin="0" step="1">

					<tbody>
						<tr>
						
							<th scope="row" style="font-size:11px">제목</th>
							<td colspan="3" style="font-size:11px">
							${item.msg_title }
							</td>
						</tr>
						<tr>
							<th scope="row" style="font-size:11px">내용</th>
							<td colspan="3" style="font-size:11px">
							    
							    ${item.msg_content }
							</td>
						</tr>
					</tbody>
					</c:forEach>
					</c:otherwise>
					</c:choose> 
				</table>

				<p style="margin-top:20px;">내용을 확인하여 다시 가입신청을 해주세요.</p>
				<p style="margin-top:5px;">문의사항이 있을 시 관리자에게 문의바랍니다.</p>
				<div class="btn_areaC mt30">
					<a href="javascript:fModificationalert(); javascript:fModification();"	class="btnType blue"  id="btnClose" name="btn"><span>확인</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
</form>
</body>
</html>