<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

							<c:if test="${questioncnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							
							<c:if test="${questioncnt > 0 }">
								<c:forEach items="${questionsearchlist}" var="qalist">
									
												<tr>
													<td><a href="javascript:fn_selectone('${qalist.qna_no}')">${qalist.qna_no}</a></td>
													<td><a href="javascript:fn_selectone('${qalist.qna_no}')">${qalist.qna_title}</a></td>
													<input type="hidden" id="qacont" name="qacont" value = ${qalist.qna_content}/>
													<td>${qalist.qna_uploaddate}</td>
													<td>${qalist.qna_uploader}</td>										
												</tr>
								</c:forEach>
							</c:if>
							
							
							<input type="hidden" id="questioncnt" name="questioncnt" value ="${questioncnt}"/>