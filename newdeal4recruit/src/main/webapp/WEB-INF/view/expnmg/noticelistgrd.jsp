<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>

							<c:if test="${totalcnt > 0 }">
								<c:forEach items="${noticesearchlist}" var="list">
									<tr>
										<td>${list.notice_no}</td>
										<td><a href="javascript:fn_selectone('${list.notice_no}')">${list.notice_title}</a></td>
										<td><fmt:formatDate value="${list.notice_uploaddate}" pattern="yyyy-MM-dd"/></td>
										<td>${list.notice_uploader}</td>
										<td>${list.notice_del_yn}</td>
									</tr>
								</c:forEach>
							</c:if>		
							
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>												