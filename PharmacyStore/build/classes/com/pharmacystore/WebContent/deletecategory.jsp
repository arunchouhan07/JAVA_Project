<%@page import="com.pharmacystore.dao.CategoryDAO"%>
<%@page import="com.pharmacystore.model.Category"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
		int catid = Integer.parseInt( 
				request.getParameter("categoryid"));
	
		CategoryDAO daoImpl = new CategoryDAOImpl();
	
		if(daoImpl.deleteCategory(catid)){
			response.sendRedirect("CategoryDelete_Success.jsp");
		}
		else
		{
			response.sendRedirect("CategoryDelete_Failure.jsp");
		}
	}
%>

