<%@page import="com.pharmacystore.dao.UserDAO"%>
<%@page import="com.pharmacystore.daoimpl.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<%
		String uid = request.getParameter("username");
		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String contact = request.getParameter("phonenumber");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
	%>	
	
	<jsp:useBean id="user" class="com.pharmacystore.model.User">
		<jsp:setProperty property="userid" value="<%=uid %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="password" value="<%=pass %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="emailid" value="<%=email %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="age" value="<%=age %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="contact" value="<%=contact %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="city" value="<%=city %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="state" value="<%=state %>" name="user"></jsp:setProperty>
		<jsp:setProperty property="pincode" value="<%=pincode %>" name="user"></jsp:setProperty>
	</jsp:useBean>
	
	<%
		UserDAO daoImpl = new UserDAOImpl();
		if(daoImpl.register(user)) {
	%>
		<p style="color:green">User registration successful !!! </p>
		<jsp:include page="index.html"></jsp:include>
	<%		
		}
		else {
	%>
		<p style="color:red">User registration failed !!! </p>
		<jsp:include page="index.html"></jsp:include>
	<%		
		}
	%>

</body>
</html>