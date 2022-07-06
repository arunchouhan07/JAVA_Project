<%@page import="com.pharmacystore.model.Admin"%>
<%@page import="com.pharmacystore.daoimpl.AdminDAOImpl"%>
<%@page import="com.pharmacystore.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
		if(daoImpl.checkAdmin(admin)){
			
			session.setAttribute("ADMIN", aid);
			response.sendRedirect("adminhome.jsp");
		}
		else{
%>
		<p style="color:red">adminid or password didn't match !!!</p>
		<jsp:include page="adminlogin.html"></jsp:include>
<%			
		}	
%>
</div>	
</body>
</html>