<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



							<c:if test="${myplilcnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
								
							</c:if>
							
							
							<c:if test="${myplilcnt > 0 }">
								<c:forEach items="${myplilList}" var="list">
								   
								   <tr>
										<input type="hidden" id="list.like_number" name="list.like_number" value ="${list.like_number}"/>
										<td>${list.re_num}</td>										
										<td>${list.corecruit_title}</td>
										<td>${list.companyuser}</td>
										<td><a href="javascript:fn_selectonelike('${list.corecruit_no}')" id="btnDeletelike" name="btnDeletelike"><i class="fa-regular fa-heart"></i></a></td>
									</tr>
								</c:forEach>
							</c:if>
				
 			
							
							<input type="hidden" id="myplilcnt" name="myplilcnt" value ="${myplilcnt}"/>
							
							
	