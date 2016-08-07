<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<h2>Create account</h2>

	<sf:form id="details" action="${pageContext.request.contextPath}/createaccount"
		method="post" commandName="user">
		<table class="formtable">

			<tr>
				<td class="label">Username:</td>
				<td><sf:input name="username" type="text" class="control"
						path="username" />
					<div class="error">
						<sf:errors path="username"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Name:</td>
				<td><sf:input name="name" type="text" class="control"
						path="name" />
					<div class="error">
						<sf:errors path="name"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Email:</td>
				<td><sf:input name="email" type="text" class="control"
						path="email" />
					<div class="error">
						<sf:errors path="email" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Password:</td>
				<td><sf:input id="password" name="password" type="text"
						class="control" path="password" />
					<div class="error">
						<sf:errors path="password" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Confirm Password:</td>
				<td><input id="confirmpass" name="confirmpass" type="text"
					class="control" />
					<div id="matchpass"></div></td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input value="create account" type="submit" class="control" /></td>
			</tr>
		</table>
	</sf:form>

