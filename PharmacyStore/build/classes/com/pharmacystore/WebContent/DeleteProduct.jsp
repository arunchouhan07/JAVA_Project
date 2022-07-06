<%@page import="com.pharmacystore.dao.ProductDAO"%>
<%@page import="com.pharmacystore.daoimpl.ProductDAOImpl"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int pid = Integer.parseInt(request.getParameter("productid"));

	ProductDAO daoImpl = new ProductDAOImpl();
	
	if(daoImpl.deleteProduct(pid))
	{
		response.sendRedirect("Delete_Success.jsp");
%>
		
		<%--<jsp:forward page="Delete_Success.jsp"></jsp:forward> --%>
<%
	}
	else
	{
		response.sendRedirect("Delete_Failure.jsp");
%>
		<%--<jsp:forward page="Delete_Failure.jsp"></jsp:forward> --%>
<%		
	}
%>
</body>
</html>