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
								<c:forEach items="${revsearchlist}" var="list">
									<tr>
										<td><a href="javascript:fn_selectone('${list.rev_no}')">${list.rev_no}</a></td>
										<td><a href="javascript:fn_selectone('${list.rev_no}')">${list.rev_title}</a></td>
										<td>${list.rev_date}</td>
										<td>${list.rev_uploader}</td>
										<td>${list.rev_status}</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>