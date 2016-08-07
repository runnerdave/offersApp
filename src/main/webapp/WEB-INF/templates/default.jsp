<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN-->
<meta name="_csrf_header" content="${_csrf.headerName}" />

<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/jquery.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/main.css"
	type="text/css" media="all" />

 <!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->	

<tiles:insertAttribute name="includes"></tiles:insertAttribute>

</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>

		<div class="toolbar">
			<tiles:insertAttribute name="toolbar"></tiles:insertAttribute>
		</div>

		<div class="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>

		<hr />

		<div class="footer">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/script/bootstrap.min.js"></script>
</body>
</html>