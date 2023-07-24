<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${totalcnt eq 0 }">
	<tr>
		<td colspan="5">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${totalcnt > 0 }">
	<c:forEach items="${resumesearchlist}" var="list">
		<tr>
			<td><a href="javascript:fn_selectone('${list.resume_no}')">${list.resume_name}</a></td>
			<td>${list.resume_regdate}</td>
			<td>
				<label class="switch">
				<input class="switch-input" id="swin${nRow}"  name="swin${nRow}"  type="checkbox" 
					<c:if test="${list.resume_openunopen eq 'Y'}" > checked</c:if> 
					onclick="javascript:checkchange('${list.resume_no}')" />
				<span class="switch-label" data-on="공개" data-off="비공개"></span> 
				<span class="switch-handle"></span> 
				<input type="hidden" id="resume_no_pre" name="resume_no_pre" value="${list.resume_no}"/>
				</label>	
			</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="totalcnt" name="totalcnt" value="${totalcnt}" />
<input type="hidden" id="loginID" name="loginID" value="${MyprsmModel.loginID}"/>