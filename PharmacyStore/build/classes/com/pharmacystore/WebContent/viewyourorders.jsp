<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDAO"%>
<%@page import="com.pharmacystore.model.User"%>
<%@page import="com.pharmacystore.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.UserDAOImpl"%>
<%@page import="com.pharmacystore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>View Your Orders</title>
</head>

<style>
.navbar {
background-color:#1997cc;

}

#nav{
color:white;
}
</style>
<body>

<%
	if(!session.isNew() || session.getAttribute("USER") != null)
	{
	%>
	
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
					<a href="userhome.jsp" class="navbar-brand" id="nav"> USER HOME </a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userlogout.jsp" id="nav"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
				</ul>
				</div>
			</nav>
	<div class="container">
		<div class="table-wrapper">
            	<div class="table-title">
                	<div class="row">
                    	<div class="col-sm-6">
                        	<h2> Your Orders</h2>
                        	<h4><a href="cancelledorders.jsp"> Cancelled Orders</a></h4>
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
					u.setUserid(uid);
                    OrderDAO odao = new OrderDAOImpl();
                    
                    List<Order> lst = 
                    		odao.getAllOrdersForUser(uid);

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
                       
                        
                        
                         <td>
                        	<button id="myBtn" class="btn btn-danger"
                        	onclick="openMyDialog(<%=o.getOrderid()%>)">
                        	Cancel This Product</button>
                        </td>   
                         
            			
                        
                                             
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
           
  <!-- Start Of The Modal Design-->
            
            
<div class="container" align="center">
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table class="table table-hover">
        <tr>
            <th align="center"> <b>Are you sure you want to cancel </b></th>
        </tr>
        
        
        <tr>
            <td><button id="btnRaise" class="btn btn-danger" onclick="cancelOrder()">
            		Cancel Order
            	</button>
            </td>
        </tr>
    </table>
  </div>
</div>
</div>
<!-- End Of The Modal Design1-->



 
        
        <script>

									// Get the modal
									var modal = document
											.getElementById("myModal");

									// Get the button that posts complaint
									var btnRaise = document
											.getElementById("btnRaise");

									// Get the <span> element that closes the modal
									var span = document
											.getElementsByClassName("close")[0];

									var orderid = 0;

									// When the user clicks the button, open the modal 
									function openMyDialog(id) {
										modal.style.display = "block";
										orderid = id;
									}

									function cancelOrder() {

										

										var url = "cancelorder.jsp?orderid="
												+ orderid;

										modal.style.display = "none";

										if (window.XMLHttpRequest) {
											request = new XMLHttpRequest();
										} else if (window.ActiveXObject) {
											request = new ActiveXObject(
													"Microsoft.XMLHTTP");
										}

										try {
											request.onreadystatechange = getProductResponse;
											request.open("GET", url, true);
											request.send();
										} catch (e) {
											alert("Unable to connect to server");
										}
									}

									function getProductResponse() {
										if (request.readyState == 4) {
											var val = request.responseText;
											if (val.trim() == "success") {
												alert("Order Cancelled");
												window.location.reload(true);
											} else {
												alert("Unable to cancel order Try Again");
												
											}
										}
									}

									// When the user clicks on <span> (x), close the modal
									span.onclick = function() {
										modal.style.display = "none";
										alert(productid);
									}

									// When the user clicks anywhere outside of the modal, close it
									window.onclick = function(event) {
										if (event.target == modal) {
											modal.style.display = "none";
										}
									}
									
									
									
								</script>
		<%
				
			}
			else{
		%>
			<p style=color:red> You need to login first !!! </p>
			<jsp:include page="userlogin.html"></jsp:include>
		<%				
			}
		%>

</body>
</html>