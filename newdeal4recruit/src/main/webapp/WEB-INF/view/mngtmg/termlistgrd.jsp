<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${totalcnt > 0}">
  <c:set var="counter" value="0" />
  <c:forEach items="${termsearchlist}" var="item">
    <tr>
      <c:set var="counter" value="${counter + 1}" />
      <td>${item.session_code}</td>
      <td>${item.session_name}</td>
      <td>${item.session_zipcode}</td>
      <td>${item.session_eventaddr}</td>
      <td>${item.session_eventdtladdr}</td>
      <td>${item.session_evstrdate}</td>
      <td>${item.session_evenddate}</td>
    </tr>
  </c:forEach>
</c:if>

<input type="hidden" id="totalcnt" name="totalcnt" value="${totalcnt}"/>
