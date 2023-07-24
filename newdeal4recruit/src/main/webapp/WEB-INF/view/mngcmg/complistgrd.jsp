<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${totalcnt > 0}">
  <c:set var="counter" value="0" />
  <c:forEach items="${compsearchlist}" var="list">
    <c:choose>
      <c:when test="${empty delyn || list.user_type eq delyn}">
        <c:set var="counter" value="${counter + 1}" />
        <tr>
          <td>${counter}</td>
          <td><a href="javascript:fn_selectone('${list.user_no}')">${list.user_coname}</a></td>
          <td>${list.user_businesstype}</td>
          <td><fmt:formatDate value="${list.user_regdate}" pattern="yyyy-MM-dd" /></td>
          <td>${list.user_rpname}</td>
          <td>${list.user_manager}</td>
          <td>${list.user_status}</td>
          <td>${list.user_type}</td>
        </tr>
      </c:when>
    </c:choose>
  </c:forEach>
</c:if>



<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>