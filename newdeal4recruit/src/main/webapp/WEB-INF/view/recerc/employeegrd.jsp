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
       $(".fa-solid.fa-heart").css("visibility","visible");
     }).mouseout(function(){
        $(".fa-solid.fa-heart").css("visibility","hidden");
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

                   <div class="main_content-pic">

                             <ul class="main_content-ul">
                      
                               
                       <c:if test="${totalcnt eq 0 }">
                             <p>--- 작성된 글이 없습니다 ---</p>
                                </c:if>
            
                          
                          <c:if test="${totalcnt > 0 }">   
                    
                                   <c:forEach var="item" items="${adverlist }"  begin="0" end="8" step="1">
                                      <li id="main_content-li"> 
                                        <a href="/myprmg/adverselectone.do?corecruit_no=${item.corecruit_no }">                   
                                              <img src="${item.att_logpath }" class="list_pic2">
                                                
                                           <div id="main_content_piece">
                                              <p id="recruit_common_head_name">${item.corecruit_title }</p>
                                              <p id="recruit_common_title_name">${item.user_coname }</p>
                                              <p> 
                                              <c:forEach var="skillitem" items="${item.skillist }" begin="0" step="1">
                                                    <button id="recruit_common_stack_name">  ${skillitem.detail_name }</button>
                                              </c:forEach>
                                              <!-- 지역 표시 -->
                                              <p id="recruit_common_etc_name">${item.city1_name } ${item.city2_name }</p>
                                          </div>
                                        </a>
         
                                      
                                      <button class="like_button" onclick="javascript:fn_likechk('${item.corecruit_no}', '${item.userlikeyn}')">
                                              <c:choose>
                                                  <c:when test="${item.userlikeyn eq 'N'}">
                                                      <i class="fa-regular fa-heart"></i>
                                                  </c:when>
                                                  <c:when test="${item.userlikeyn eq 'Y'}">
                                                      <i class="fa-solid fa-heart"></i>
                                                  </c:when>
                                              </c:choose>
                                          </button>
                                                                                
             
                                 </li>
                                 </c:forEach>
                               </c:if>                     
               
                          </ul>
                   </div>

               <input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}" />
              