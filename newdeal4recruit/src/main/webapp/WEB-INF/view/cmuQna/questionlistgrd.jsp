<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="5">Qna가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalcnt > 0 }">
								<c:forEach items="${questionsearchlist}" var="list">
									<tr>
										<%-- <td>${list.qna_no}</td>  --%>
										<td>	
										<a href="javascript:fn_selectone('${list.qna_no}')">${list.qna_title}</a></td>
										<td>${list.qna_uploaddate}</td>						
											
										 <c:choose>					
									     <c:when test="${empty list.name}">
									          <td>${list.user_coname} </td>
									      </c:when>
									      <c:otherwise>
									          <td>${list.name} </td>
									      </c:otherwise> 
									  	</c:choose>  
										 <td><a href="javascript:fn_declarepopup('${list.qna_no}')">
										<i class="fa-solid fa-bomb"></i></a></td>
									</tr>
									</c:forEach>
									
 									
									<%-- <!-- userNm 값이 null인 경우에는 user_coname을 보여줌 -->
									  <c:set var="name" value="${list.name}" />
									  <c:set var="userConame" value="${list.user_coname}" />
									  <c:choose>
									      <c:when test="${empty list.name}">
									          <td>${list.user_coname} </td>
									      </c:when>
									      <c:otherwise>
									          <td>${list.name} </td>
									      </c:otherwise>
									  </c:choose>  --%>
								
							</c:if>
							
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>