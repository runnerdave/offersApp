<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


	<script type="text/javascript">
		$(document).ready(function() {
			document.f.username.focus();
		});
	
	</script>
	<div class="container">
		<h3>Login with Username and Password</h3>
		
		<c:if test="${param.error != null}">
			<div class="alert alert-danger fade in">
			  <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
			  <strong>Login failed.</strong>
			  Check that your username or password are correct.
			</div>
		</c:if>
		
		<form name='f' action='${pageContext.request.contextPath}/login' method='POST' class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">User:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="username" id="username" placeholder="Joan Doe">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <div class="checkbox">
			        <label><input type="checkbox" name='remember-me' checked="checked"> Remember me</label>
			      </div>
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" name="submit" class="btn btn-default">Login</button>
			    </div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		
		<a href="<c:url value="/newaccount"/>" class="btn btn-info" role="button">Create account</a>
	</div>