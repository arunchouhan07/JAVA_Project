<%@page import="com.pharmacystore.dao.CategoryDAO"%>
<%@page import="com.pharmacystore.model.Category"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
		String catName = request.getParameter("categoryname");
	
		CategoryDAO daoImpl = new CategoryDAOImpl();
		Category category = new Category();
		category.setCategoryName(catName);
	
		if(daoImpl.addCategory(category)){
			response.sendRedirect("CategoryAdd_Success.jsp");
		}
		else
		{
			response.sendRedirect("CategoryAdd_Failure.jsp");
		}
	}
%>

