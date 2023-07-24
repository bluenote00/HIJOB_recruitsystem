<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:if test="${totalcnt eq 0 }">
		
			<div class="resume_linklist_none">데이터가 존재하지 않습니다.</div>
		
	</c:if>

							
<c:if test="${totalcnt > 0 }">
	<c:forEach items="${resumeFormprojectlist}" var="list">
	
	<div id="list_set">
			<div id="resume_smallname"><a href="javascript:fn_projectselectone('${list.project_code}')"> ${list.project_name}</a></div>
			 <div id="resume_address">${list.project_detail}</div>
	</div>
	
	</c:forEach>
</c:if>

<input type="hidden" id="totalcnt6" name="totalcnt" value="${totalcnt}">
