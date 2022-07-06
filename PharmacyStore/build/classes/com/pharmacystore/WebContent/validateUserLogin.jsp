<%@page import="com.pharmacystore.daoimpl.UserDAOImpl"%>
<%@page import="com.pharmacystore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
<%
		String uid = request.getParameter("txtUid");
		String pass = request.getParameter("txtPassword");
%>
		<jsp:useBean id="user" class="com.pharmacystore.model.User">
			<jsp:setProperty property="userid" value="<%=uid %>" name="user"></jsp:setProperty>
			<jsp:setProperty property="password" value="<%=pass %>" name="user"></jsp:setProperty>
		</jsp:useBean>

<%
		UserDAO daoImpl = new UserDAOImpl();
		if(daoImpl.checkUser(user)){
			session.setAttribute("USER", uid);
			response.sendRedirect("userhome.jsp");
		}
		else{
%>
		<p style="color:red">userid or password didn't match !!!</p>
		<jsp:include page="userlogin.html"></jsp:include>
<%			
		}	
%>
</div>	
</body>
</html>