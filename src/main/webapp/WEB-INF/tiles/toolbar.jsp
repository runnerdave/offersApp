<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:choose>
	<c:when test="${hasOffer}">
		
			<a href="<c:url value="/createoffer" />">Edit or delete your
				offer</a>&nbsp;|
		
	</c:when>
	<c:otherwise>
		
			&nbsp;<a href="<c:url value="/createoffer" />">Create offer</a>&nbsp;|
		
	</c:otherwise>
</c:choose>




	&nbsp;<a href="<c:url value="/newaccount" />">Create account</a>&nbsp;


<sec:authorize access="hasRole('ROLE_ADMIN')">
	
		|&nbsp;<a href="<c:url value="/admin" />">Admin</a>&nbsp;
	
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	|&nbsp;<a href="<c:url value="/messages" />">Messages (<span id="numberMessages">0</span>)</a>
</sec:authorize>