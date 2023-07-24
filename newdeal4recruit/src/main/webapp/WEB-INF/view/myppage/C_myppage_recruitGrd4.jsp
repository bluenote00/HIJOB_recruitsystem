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

#section_container {
	margin-left: 30px;
	padding-bottom: 80px;
}

.myapply {
    text-align: center;
    padding-top: 50px;
    padding-left: 20px;
    padding-bottom: 20px;
}

.mypage_head > h1 {
    font-weight: 700;
    font-size: 30px;
    color: rgb(34, 34, 34);
    font-family: "Noto Sans KR", sans-serif;
}


.mypage_head {
    display: flex;
    justify-content: space-between;
    width: 700px;
    padding-bottom: 30px;
}

#myapply_recruit {
    text-align: center;
    padding-top: 50px;
    padding-bottom: 100px;
}

.mypage_head_recruit > h2 {
    font-weight: 600;
    font-size: 25px;
    color: rgb(34, 34, 34);
    font-family: "Noto Sans KR", sans-serif;
}


.mypage_head_recruit {
    display: flex;
    justify-content: space-between;
    width: 700px;
    padding-bottom: 30px;
}

.alllist {
    color: rgb(71, 71, 71);
    cursor: pointer;
    position: relative;
    bottom: -11px;
}

.applylist {
    list-style: none;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    justify-content: space-around;
    height: 140px;
    width: 700px;
    border: 1px solid rgb(0, 0, 0);
    border-radius: 8px;
}

.applylist2 {
    vertical-align: middle;
    list-style: none;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    justify-content: space-around;
    height: 370px;
    width: 700px;
    border: 1px solid rgb(0, 0, 0);
    border-radius: 8px;
}

.applylist3 {
    padding-top: 20px;
    -webkit-box-align: center;
    align-items: center;
    height: 210px;
    width: 700px;
    border: 1px solid rgb(0, 0, 0);
    border-radius: 8px;
    line-height: 2.3rem;
}


.applylist_content {
    width: 150px;
}

.apply_dl {
	vertical-align: middle;
	line-height: 2.3rem;
}

.apply_dt {
    justify-content: center;
    display: block;
    font-weight: 600;
    font-size: 19px;
}

.apply_dd {
    justify-content: center;
    font-weight: 700;
    font-size: 26px;
}

a:active {
    color:rgb(0, 140, 255);
}


.applylistsection {
    display: flex;
}

.resumebox {
    display: inline-block;
    width: 220px;
    height: 150px;
    cursor: pointer;
    background-color: rgb(245, 245, 248);
    border-radius: 20px;
    margin-left: 5px;
    margin-right: 10px;
}

.resume_first {
    font-size: 13px;
    font-weight: 600;
    color: rgb(78, 125, 255);
    padding-bottom: 10px;
    padding-top: 20px;
    margin-left: -150px;
}

.resume_secondh3 {
	font-size: 20px;
	padding-top: 45px;
    padding-left: 10px;
    color: rgb(97, 97, 97);
    margin-left: -100px;
}

.resume_firsth3 {
	font-size: 20px;
    padding-left: 20px;
    color: rgb(97, 97, 97);
    margin-left: -100px;
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

.jb-division-line {
	margin-right: 40px;
}

.applylist_content > dt > dd:active  { 
    color: rgb(0, 140, 255);
}

.recruit_list_li {
	text-align: left;
	padding: 20px 20px;
    border-bottom: 1px solid rgb(228, 228, 228);
    margin-right: 40px;
}

.applicant_dl {
	justify-content: space-between;
	vertical-align: middle;
	display: flex;
}

.applicant_name {
	font-family: "Noto Sans KR", sans-serif;
    margin-bottom: 10px;
    font-weight: 600;
    font-size: 16px;
    color: rgb(68, 68, 68);
    padding: 0px;
    overflow-wrap: break-word;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    display: flex;
}

.recruit_name {
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 700;
    font-size: 17px;
    color: rgb(0, 0, 0);
    padding: 1px 0px;
    line-height: 24px;
    overflow-wrap: break-word;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
}

.applicant_status {ar
	font-family: "Noto Sans KR", sans-serif;
    font-size: 13px;
    background-color: #eeeeee;
   	border-radius: 10px 10px 10px 10px;
   	border: 1px solid rgb(167 167 167);
   	padding-left: 10px;
    padding-right: 10px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: rgb(59 59 59);
    margin-left: 20px;
    font-weight: 600;
}


</style>

<script type="text/javascript">

		    
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
	<input type="hidden" id=loginID name="loginID" value ="${loginID}"/>	

		
		
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
					       
					     
			<section id="section_container">
					     
					     <!-- 지원 현황 -->
  						  <section class="myapply">
  						 				<a href="/myppage/myppage_recruit.do">  						  
  						 			<div class="mypage_head">
  						   						  <h1>채용현황 🙌</h1>  						   				
             						 </div>
             						 </a>

        						<div class="applylistsection">
         							<ul class="applylist">
         								   <li class="applylist_content">
             								   <dl class="apply_dl">
                    								<a href="/myppage/myppage_recruit.do">
                      								  <dt class="apply_dt">지원자 수</dt>
                      								  <dd class="apply_dd">${Capplicantcount }</dd>
                  									  </a>
                								</dl>
           									</li>

       								   <li class="applylist_content">
       								   		 <dl class="apply_dl">
                  							  <a href="/myppage/myppage_recruitGrd2.do">
                      							  <dt class="apply_dt">서류통과</dt>
                        						<dd class="apply_dd">${Capplicantpappercount }</dd>
                  							  </a>
               							 </dl>
            						</li>

         							 <li class="applylist_content">
       								   		 <dl class="apply_dl">
                  							  <a href="/myppage/myppage_recruitGrd3.do">
                      							  <dt class="apply_dt">최종합격</dt>
                        						<dd class="apply_dd">${Capplicantpasscount }</dd>
                  							 	</a>
                							</dl>
            							</li>

            					<li class="applylist_content">
              							  <dl class="apply_dl">
                    						<a href="/myppage/myppage_recruitGrd4.do">
                     					   <dt class="apply_dt">불합격</dt>
                        					<dd class="apply_dd">${Capplicantfailcount }</dd>
                    						</a>
               							 </dl>
            						</li>

        					</ul>
    				</div>
			</section>

		<section id="section_container">
			    <section id="myapply_recruit">
			    
			    
					   	<!-- 지원 현황 상세 -->
    			
           				 <div class="mypage_head_recruit">
               					 <h2>불합격 수 총 ${Capplicantfailcount }명</h2>
            			</div>
           						 <hr class="jb-division-line"></hr>
     
             				<div class="mypage_content">
                					<div class="content_list">
                							<ul class="recruit_list_ul">
                							
                							<c:forEach var="item" items="${Capplicantfaillist }" begin="0" step="1">
                							
                									<li class="recruit_list_li">
                			 							<dl class="applicant_dl">
 																<dt class="applicant_name">${item.name}</dt>
 																<dt class="applicant_status_dt">
 												
 																	<a href="/recors/resumeselectoneread.do?resume_no=${item.resume_no}&loginID=${item.loginID}" target="_blank"><span class="applicant_status">이력서 보기</span></a>
 												  					
 																</dt>		   
													</dl>
                								</li>		
                							</c:forEach>
                						</ul>
                				</div>
            			</div>

  				  </section>
		</section>

</section>

</form>
</body>			   
			   
			             

</html>