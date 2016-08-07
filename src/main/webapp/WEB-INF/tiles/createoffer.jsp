<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function onDeleteClick(event) {
	
	var doDelete = confirm("Are you sure you want to delete this offer.");
	if (doDelete == false) {
		event.preventDefault();
	}
}

function onReady() {
	$("#delete").click(onDeleteClick);
}

$(document).ready(onReady);
</script>

<sf:form action="${pageContext.request.contextPath}/docreate"
	method="post" commandName="offer">
	<sf:input type="hidden" path="id" />
	<table class="formtable">

		<tr>
			<td class="label">Your offer:</td>
			<td><sf:textarea cols="10" rows="10" name="text" class="control"
					path="text"></sf:textarea><br /> <sf:errors path="text"
					cssClass="error" /></td>
		</tr>
		<tr>
			<td class="label"></td>
			<td><input value="save offer" type="submit" class="control" /></td>
		</tr>
		<c:if test="${offer.id != 0}">
			<tr>
				<td class="label"></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input value="delete offer" type="submit" id="delete"
						class="delete control" name="delete" /></td>
			</tr>
		</c:if>
	</table>
</sf:form>
