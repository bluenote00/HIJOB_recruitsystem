<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${blackcnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${blackcnt > 0 }" >
								<c:forEach items="${blacksearchlist}" var="blklist">
											<tr>
												<td>${blklist.blacklist_number}</td>
												<td>${blklist.loginID}</td>
												<td>${blklist.blacklist_date}</td>
												<td>${blklist.blacklist_usertype}</td>
												<td><a href=javascript:fRegisterButtonClickEventumg("${blklist.loginID}") class="btnType blue" id="btnReturn" name="btn"><span>해제</span></a></td>
												
												
																																		
											</tr>
								</c:forEach>
							</c:if>
							
							
							<input type="hidden" id="blackcnt" name="blackcnt" value ="${blackcnt}"/>