<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="5">후기가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalcnt > 0 }">
								<c:forEach items="${reviewsearchlist}" var="list">
									<tr>
										
										<%-- <td>${list.rev_no}</td> --%>
										<td><a href="javascript:fn_selectone('${list.rev_no}')">${list.rev_title}</a></td>
										<td>${list.rev_date}</td>
										<%-- <td>${list.name}</td> --%>
										<c:choose>					
									     <c:when test="${empty list.name}">
									          <td>${list.user_coname} </td>
									      </c:when>
									      <c:otherwise>
									          <td>${list.name} </td>
									      </c:otherwise> 
									  	</c:choose>  
										 
										 <td><a href="javascript:fn_declarepopup('${list.rev_no}')">
												<i class="fa-solid fa-bomb"></i></a></td>
													
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>