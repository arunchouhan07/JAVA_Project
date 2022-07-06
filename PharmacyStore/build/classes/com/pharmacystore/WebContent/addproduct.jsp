<%@page import="com.pharmacystore.dao.ProductDAO"%>
<%@page import="com.pharmacystore.model.Product"%>
<%@page import="com.pharmacystore.daoimpl.ProductDAOImpl"%>
<%@page import="com.pharmacystore.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
		int catid = Integer.parseInt(request.getParameter("categoryid"));
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String pname = request.getParameter("productname");
	
		ProductDAO daoImpl = new ProductDAOImpl();
		Product p = new Product();
		p.setCategoryid(catid);
		p.setDescription(description);
		p.setPrice(price);
		p.setProductname(pname);
		p.setQuantity(quantity);
	
		if(daoImpl.addProduct(p)){
			response.sendRedirect("ProductAdd_Success.jsp");
		}
		else
		{
			response.sendRedirect("ProductAdd_Failure.jsp");
		}
	}
%>

