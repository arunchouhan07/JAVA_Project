
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.pharmacystore.model.Product"%>
<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import = "java.util.logging.Logger" %>


<%@page import="com.pharmacystore.model.Order"%>
<%@page import="com.pharmacystore.daoimpl.ProductDAOImpl"%>
<%@page import="com.pharmacystore.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

	<%
	int prodid = Integer.parseInt(request.getParameter("productid"));
	String uid = (String) session.getAttribute("USER");
   	int quantity = Integer.parseInt(request.getParameter("quantity"));
   	String address = request.getParameter("address");
	
   	ProductDAO pdaoImpl = new ProductDAOImpl();
   	Product pr = pdaoImpl.searchProduct(prodid);
   	int price = pr.getPrice();
   	
   	int totalquantity = pr.getQuantity();
   	
   	int updatedq = totalquantity-quantity;
	
	
	int billamount = (quantity)*(price);
	
	
	OrderDAO odaoImpl = new OrderDAOImpl();
	Date date = Date.valueOf(LocalDate.now());
	
	//setting delivery date as  5 days after the ordered date
	Date rdate = Date.valueOf(LocalDate.now().plusDays(5));
	
	//inserting in orderdetails
	Order o = new Order();
	o.setCustomerid(uid);
	o.setAccepted(true);
	o.setOrdereddate(date);
	o.setProductid(prodid);
	o.setAddress(address);
	o.setOrderedunits(quantity);
	o.setRequesteddate(rdate);
	o.setBillamount(billamount);
	o.setCancelled(false);
	o.setConfirmed(true);
	
	if(quantity<totalquantity){
		if(odaoImpl.placeOrder(o)){
		
			pdaoImpl.updateQuantityAfterOrder(prodid,updatedq);
			out.print("success");
		}
		else
		{
			out.print("failure");	
		}
	}
	else{
		out.print("lessquantity");
	}
	%>