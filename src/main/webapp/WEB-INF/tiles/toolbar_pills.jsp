<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<ul class="nav nav-pills navbar">
	<c:choose>
		<c:when test="${hasOffer}">			
				<li><a href="<c:url value="/createoffer" />">Edit or delete your
					offer</a></li>			
		</c:when>
		<c:otherwise>			
				<li><a href="<c:url value="/createoffer" />">Create offer</a></li>			
		</c:otherwise>
	</c:choose>

	<li><a href="<c:url value="/newaccount" />">Create account</a></li>

	<sec:authorize access="hasRole('ROLE_ADMIN')">	
		<li><a href="<c:url value="/admin" />">Admin</a></li>	
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value="/messages" />">Messages (<span id="numberMessages">0</span>)</a></li>
	</sec:authorize>
</ul>