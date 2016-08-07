<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<a class="title" href="<c:url value='/'/>">Offers</a>

<sec:authorize access="!isAuthenticated()">
	<p>
		<a class="login" href="<c:url value='/login'/>">Login </a>
	</p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<c:url var="logoutUrl" value="/logout" />
	<div>
		<form action="${logoutUrl}" method="post">
			<input class="login" type="submit" value="Log	out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</sec:authorize>