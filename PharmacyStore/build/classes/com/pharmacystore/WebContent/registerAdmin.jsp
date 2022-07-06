<%@page import="com.pharmacystore.daoimpl.AdminDAOImpl"%>
<%@page import="com.pharmacystore.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%
		String aid = request.getParameter("txtAid");
		String pass = request.getParameter("txtPassword");
	%>	
	
	<jsp:useBean id="admin" class="com.pharmacystore.model.Admin">
		<jsp:setProperty property="userid" value="<%=aid %>" name="admin"></jsp:setProperty>
		<jsp:setProperty property="password" value="<%=pass %>" name="admin"></jsp:setProperty>
	</jsp:useBean>
	
	<%
		AdminDAO daoImpl = new AdminDAOImpl();
		if(daoImpl.register(admin)) {
	%>
		<p style="color:green">registration successful !!! </p>
		<jsp:include page="index.html"></jsp:include>
	<%		
		}
		else {
	%>
		<p style="color:red">registration failed !!! </p>
		<jsp:include page="index.html"></jsp:include>
	<%		
		}
	%>
</div>
</body>
</html>

















