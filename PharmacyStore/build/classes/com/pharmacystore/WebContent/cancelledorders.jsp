<%@page import="com.nttdatafinalcase.daoimpl.UserDaoImpl"%>
<%@page import="com.nttdatafinalcase.dto.Order"%>
<%@page import="com.nttdatafinalcase.dao.UserDao"%>
<%@page import="com.nttdatafinalcase.dto.User"%>
<%@page import="com.nttdatafinalcase.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.nttdatafinalcase.daoimpl.ProductDaoImpl"%>
<%@page import="com.nttdatafinalcase.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancelled Order</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<style>
#new{
background-color:#1977cc;

}
#head{
color:white;
}
</style>

</style>
<body>



<%
	if(!session.isNew() || session.getAttribute("USER") != null)
	{
	%>
	
			<nav class="navbar " id="new">
				<div class="container-fluid">
					<div class="navbar-header">
					<a href="userhome.jsp" class="navbar-brand" id="head"> USER HOME </a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userlogout.jsp" id="head"><span class="glyphicon glyphicon-log-out" id="head"></span> Logout</a></li>
				</ul>
				</div>
			</nav>
	<div class="container">
		<div class="table-wrapper">
            	<div class="table-title">
                	<div class="row">
                    	<div class="col-sm-6">
                        	<h2> Your Cancelled Orders</h2>
                        	
                    	</div>
                	</div>
            	</div>
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Order ID</th>
                   		<th>Product iD</th>
                        <th>Ordered Units</th>
                        <th> Accepted</th>
                        <th> Cancelled</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                    String uid = (String) session.getAttribute("USER");
                    
					User u = new User();
                    u.setCustomerId(uid);
                    UserDao udao = new UserDaoImpl();
                    
                    List<Order> lst = udao.displaymycancelledorder(u);

                    if(lst.size() > 0)
                    {
                    for (Order o : lst) {
                    %>
                    <tr>

                        <td><%=o.getOrderid()%></td>

                        
                        <td>
                            <%=o.getProductid()%>
                        </td>
                        <td>
                            <%=o.getOrderedunits()%>
                        </td>
                       
                        <td><%=o.isAccepted()%></td>
                        <td><%=o.isCancelled()%></td>
                       
                        
                        
                           
                         
            			
                        
                                             
                   </tr>
                <%}}
				%>
                </tbody>
            </table>
        </div>
         </div>
		<div class="clearfix">
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item "><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
            </div>
            
            <%
				
			}
			else{
		%>
			<p style=color:red> You need to login first !!! </p>
			<jsp:include page="adminlogin.html"></jsp:include>
		<%				
			}
		%>
       
       
              

</body>
</html>