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
    background-color: #eeeeee;
    border-radius: 20px;
    margin-left: 5px;
    margin-right: 10px;
    border: 2px solid #777777;
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
    padding : 10px;
    margin-top: 5px;
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

.resume_write {
	color: #fff;
    background-color: #51afff;
    border-radius: 15px 15px 15px 15px;
    font-size: 15px;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 10px;
    padding-bottom: 8px;
    font-weight: 600;
    font-family: "Noto Sans KR", sans-serif;
    position: relative;
    bottom: -15px;
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
  						   						  <h1>나의 지원 😋</h1>				  
             						 </div>
								</a>
								
        						<div class="applylistsection">
         							<ul class="applylist">
         								   <li class="applylist_content">
             								   <dl class="apply_dl">
                    								<a href="/myppage/myppage_recruit.do">
                      								  <dt class="apply_dt">지원완료</dt>
                      								  

                      								  <dd class="apply_dd">${Papplycompanycount}</dd>
                  									  </a>
                								</dl>
           									</li>

       								   <li class="applylist_content">
       								   		 <dl class="apply_dl">
                  							  <a href="/myppage/myppage_recruitGrd2.do">
                      							  <dt class="apply_dt">서류통과</dt>
                        						<dd class="apply_dd">${Papplypaperpasscount}</dd>
                  							  </a>
               							 </dl>
            						</li>

         							 <li class="applylist_content">
       								   		 <dl class="apply_dl">
                  							  <a href="/myppage/myppage_recruitGrd3.do">
                      							  <dt class="apply_dt">최종합격</dt>
                        						<dd class="apply_dd">${Papplypasscount}</dd>
                  							 	</a>
                							</dl>
            							</li>

            					<li class="applylist_content">
              							  <dl class="apply_dl">
                    						<a href="/myppage/myppage_recruitGrd4.do">
                     					   <dt class="apply_dt">불합격</dt>
                        					<dd class="apply_dd">${Papplyfailcount}</dd>
                    						</a>
               							 </dl>
            						</li>

        					</ul>
    				</div>
			</section>


		 <!-- 이력서 -->
<section class="myapply">
    <div class="mypage_head">
        <h1>나의 이력서 📚</h1>
        <a href="../myprsm/resumeForm.do"><span class="resume_write">이력서 작성</span></a>
    </div>

<div class="applylistsection">


    <c:forEach var="item" items="${resumelist}"  begin="0" end="2" step="1">
    
    <a href="../recors/resumeselectone.do?resume_no=${item.resume_no}">
	    <div class="resumebox">
	    				<h3 class="resume_firsth3">${item.resume_name}</h3>
	       			 
	       			<div class="skill_button">
       							<button class="stack_skill">${item.skill1name}</button>
       					 		<button class="stack_skill">${item.skill2name}</button>
       					   		<button class="stack_skill"> ${item.skill3name}</button>
					</div>	
	    </div>
	    </a>
		</c:forEach>

</div>
</section>

    				 	



    <!-- 좋아요 -->
<section class="myapply">
    <div class="mypage_head">
        <h1>좋아요 누른 공고 😍</h1>
        <h3 class="alllist">전체보기</h3>
    </div>

		<div class="applylistsection">
 			<ul class="applylist2">
    			<li class="applylist_content">
    			</li>
			</ul>
		</div>
</section>


		 <!-- QnA -->
		<section class="myapply">
  				  <div class="mypage_head">
       					 <h1>QnA 내역 ❓</h1>
       							 <h3 class="alllist">전체보기</h3>
    			</div>

				<div class="applylistsection">
 						<ul class="applylist3">
    						<li class="applylist_content2">
    						</li>

    						<li class="applylist_content2">
    						</li>

    					<li class="applylist_content2">
    					</li>

    					<li class="applylist_content2">
    					</li>

    					<li class="applylist_content2">
    					</li>
					</ul>
				</div>
		</section>




</section>

</form>
</body>			   
			   
			             

</html>