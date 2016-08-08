<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



    <h1><a href="<c:url value='/'/>">Offers</a></h1>
    <p>Welcome to the digital market for offers.</p>
    <sec:authorize access="!isAuthenticated()">
	    <p>
	    	<a href="<c:url value='/login'/>" class="btn btn-info" role="button">Login</a>
	    </p>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
		<c:url var="logoutUrl" value="/logout" />
		<div>
			<form action="${logoutUrl}" method="post">
				<button type="submit" class="btn btn-default btn-lg"/>Log out</button> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</sec:authorize>