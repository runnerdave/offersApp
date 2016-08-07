<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Administration</h1>

	<table class="formtable">
		<tr>
			<td>Username</td>
			<td>Email</td>
			<td>Role</td>
			<td>Enabled</td>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td><c:out value="${user.username}" /></td>
				<td><c:out value="${user.email}" /></td>
				<td><c:out value="${user.authority}" /></td>
				<td><c:out value="${user.enabled}" /></td>
			</tr>
		</c:forEach>
	</table>