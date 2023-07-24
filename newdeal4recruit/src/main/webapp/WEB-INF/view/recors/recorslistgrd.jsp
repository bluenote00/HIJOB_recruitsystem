<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

//좋아요 버튼 - mouseover / out 기능
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


</script>

<style>

	
</style>
   
<div class="main_content-pic">
   		 		
   	<c:if test="${totalcnt eq 0 }">
     	<p>--- 작성된 글이 없습니다 ---</p>
    </c:if>
   			
     							
     <c:if test="${totalcnt > 0 }">	
    				 	
			<c:forEach var="item" items="${openresumelist}"  begin="0" end="5" step="1">
			   	<div class="resumebox">
			   		<div class="resume_content">
       					<h3 class="resume_firsth3"> <a href="/recors/resumeselectone.do?resume_no=${item.resume_no}">${item.resume_name}</h3></a>
       						<div class="skill_button">
       							<button class="stack_skill">${item.skill1name}</button>
       					 		<button class="stack_skill">${item.skill2name}</button>
       					   		<button class="stack_skill"> ${item.skill3name}</button>
							</div>
					</div>
			</div>
			 </c:forEach>
			 
	 </c:if>   						
    						        
 </div>

<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>
   		     