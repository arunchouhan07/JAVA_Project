<%@page import="com.pharmacystore.daoimpl.ProductDAOImpl"%>
<%@page import="com.pharmacystore.dao.ProductDAO"%>
<%@page import="com.pharmacystore.model.Product"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int pid = Integer.parseInt(request.getParameter("productid"));
	int price = Integer.parseInt(request.getParameter("price"));
	int qty = Integer.parseInt(request.getParameter("qty"));
	String pname = request.getParameter("pname");
	String pdesc = request.getParameter("pdesc");
	
	ProductDAO daoImpl = new ProductDAOImpl();
	
	Product prd = new Product();
	prd.setProductid(pid);
	prd.setPrice(price);
	prd.setQuantity(qty);
	prd.setProductname(pname);
	prd.setDescription(pdesc);
	
	if(daoImpl.updateProduct(prd))
	{
		out.print("success");
		//response.sendRedirect("Update_Success.jsp");
	}
	else
	{
		out.print("failure");
		//response.sendRedirect("Update_Failure.jsp");
	}
%>