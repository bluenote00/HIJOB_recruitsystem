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

.paging {
    height: 33px;
    padding: 0 5px;
    line-height: 33px;
    vertical-align: middle;
}

.resume_content {
    margin: 20px;
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
	padding-top: 6px;
	padding-bottom: 2px;
}

.main_content-pic {
    padding-top: 20px;
    padding-bottom: 50px;
    display: flex;
    flex-wrap: wrap;
	}
	
	
.resumebox {
	display: inline-block;
    width: 220px;
    height: 150px;
    cursor: pointer;
    background-color: #eeeeee;
    border-radius: 20px;
    margin-left: 15px;
    margin-right: 10px;
    border: 2px solid #777777;
    margin-bottom: 20px;
}



.resume_first {
    font-size: 13px;
    font-weight: 600;
    color: rgb(78, 125, 255);
    padding-bottom: 10px;
    padding-top: 20px;
    margin-left: 20px;
}


.resume_secondh3 {
	font-size: 20px;
	padding-top: 45px;
    padding-left: 10px;
    color: rgb(97, 97, 97);
    margin-left: 20px;
}

.resume_firsth3 {
	font-size: 18px;
    color: rgb(97, 97, 97);
    line-height: 1.3;
    word-break: break-word;
    word-wrap: normal;
}


.resume_write {
	color: #fff;
    background-color: #51afff;
    border-radius: 15px 15px 15px 15px;
    font-size: 15px;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 600;
    font-family: "Noto Sans KR", sans-serif;
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
    font-weight: 600;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

#recruit_common_title_name {
	font-size: 17px;
}


#recruit_common_stack_name {
	font-size: 15px;
	color: #464646;
	pointer-events: none;
	box-sizing: border-box;
	border-radius: 60px 60px;
	border: none;
	padding-left: 7px;
    padding-right: 7px;
    padding-top: 4px;
    padding-bottom: 4px;
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
  color: #FF096C;
  padding: 5px 10px;
  top: 140px;
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
var pageSize = 6;     
var pageBlockSize = 5;    


$(function(){
	comcombo("stackCD","dtlcombo1","all","");
	
	
		openresumelist();

});
		  


function openresumelist(pagenum) {
				
		pagenum = pagenum || 1;
				
		var param = {
			pageSize : pageSize
			, pageBlockSize : pageBlockSize
			, pagenum : pagenum
			, dtlcombo1 : $("#dtlcombo1").val()
		}
				
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			$("#openresumelist").empty().append(returnvalue);
					
			var  totalcnt = $("#totalcnt").val();
					
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'openresumelist');
			console.log("paginationHtml : " + paginationHtml);
					 
			$("#noticePagination").empty().append( paginationHtml );
					
			$("#pageno").val(pagenum);
		}
								
		callAjax("/recors/recorsgrd.do", "post", "text", false, param, listcallback);
					
  }
  
function fn_selectone(no,action,skill1,skill2,skill3) {
	
// 	action = action || "U";
	
	
	var params = "";
	//var action = "U";
	
	
	params += "<input type='hidden' name='resume_no' id='resume_no' value='"+ no +"' />";
	params += "<input type='hidden' name='action' id='action' value='"+ action +"' />";
	params += "<input type='hidden' name='skill1' id='skill1' value='"+ skill1 +"' />";
	params += "<input type='hidden' name='skill2' id='skill2' value='"+ skill2 +"' />";
	params += "<input type='hidden' name='skill3' id='skill3' value='"+ skill3 +"' />";

	
	jQuery("<form action='/recors/resumeselectone.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();

	
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
		   		  						<li id="main_recruitlist_head_name"><h1>#🏦 이력서 리스트</h1></li>
		   		  					</ul>
							     </div>
						
						
								     <!-- 상단 필터링 + 작성 버튼 -->				
								  <div class="buttonlist">
									<div class="skill_icon">
			                   			<select id="dtlcombo1" name="dtlcodeCD" class="dtlcombo" onChange="javascript:openresumelist()"></select>
			                   		</div>
			                   			 
		  		 	       		 </div>	
		  		 	       		 
		  		 	       		 
		  		 	       	<!-- 그리드영역 (employeegrd) -->
	  	                        <div id="openresumelist">
	  	                        
	  	                        </div>
	  		 	       			
	  		 	       			
	  		 	       		<!-- 페이지네이션 -->
	  		 	       			<div class="paging"  id="noticePagination"> </div>	
	  		 	       			
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