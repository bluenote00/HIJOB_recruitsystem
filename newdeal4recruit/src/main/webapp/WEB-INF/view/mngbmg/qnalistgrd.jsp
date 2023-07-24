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
								<c:forEach items="${qnasearchlist}" var="list">
									<tr>
										<td><a href="javascript:fn_selectone('${list.qna_no}')">${list.qna_no}</a></td>
										<td><a href="javascript:fn_selectone('${list.qna_no}')">${list.qna_title}</a></td>
										<td><fmt:formatDate value="${list.qna_uploaddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${list.qna_uploader}</td>
										<td>${list.qna_status}</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>