<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<h2>Send Message</h2>



	<sf:form method="post" commandName="message">
	
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
		<input type="hidden" name="_eventId" value="send" />
		
	
		<table class="formtable">
			<tr>
				<td class="label">Your name:</td>
				<td><sf:input name="name" type="text" class="control"
						path="name" value="${fromName}"/>
					<div class="error">
						<sf:errors path="name" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Email:</td>
				<td><sf:input name="email" type="text" class="control"
						path="email" value="${fromEmail}"/>
					<div class="error">
						<sf:errors path="email" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Subject:</td>
				<td><sf:input type="text" class="control" path="subject" />
					<div class="error">
						<sf:errors path="subject"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Your message:</td>
				<td><sf:textarea name="content" type="text" class="control"
						path="content" />
					<div class="error">
						<sf:errors path="content"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input value="Send message" type="submit" class="control" /></td>
			</tr>
		</table>
	</sf:form>

