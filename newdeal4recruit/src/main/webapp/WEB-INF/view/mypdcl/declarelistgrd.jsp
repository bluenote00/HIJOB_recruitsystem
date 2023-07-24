<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${declarecnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${declarecnt > 0 }" >
								<c:forEach items="${declaresearchlist}" var="dclist">
											<tr>
												<td>${dclist.declare_no}</td>
												<td>${dclist.declare_name}</td>
												<td>${dclist.declare_title}</td>
												<td>${dclist.declare_date}</td>
												<td>${dclist.loginID}</td>
												<td>${dclist.report_name}</td>																						
											</tr>
								</c:forEach>
							</c:if>
							
							
							<input type="hidden" id="declarecnt" name="declarecnt" value ="${declarecnt}"/>