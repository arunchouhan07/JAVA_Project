<%@page import="com.pharmacystore.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.ProductDAOImpl"%>
<%@page import="com.pharmacystore.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>View All Product</title>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}



#nav{
background-color:#1977cc;
color:white;
}

#myBtn:hover{
background-color:#1997cc;
}
#myBtn2:hover{
background-color:#1997cc;
}


</style>
<body>

<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
	%>
			<nav class="navbar navbar-default">
				<div class="container-fluid" id="nav">
					<div class="navbar-header">
					<a href="adminhome.jsp" class="navbar-brand" id="nav"> ADMIN HOME </a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logoutadmin.jsp"id="nav"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
				</ul>
				</div>
			</nav>
			<div class="container">
		 	<div class="table-wrapper">
            	<div class="table-title">
                	<div class="row">
                    	<div class="col-sm-6">
                        	<h2> Products For You</h2><br>
                    	</div>
                	</div>
            	</div>
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th> Product Name</th>
                        <th>Category id</th>
                        <th>Quantity</th>
                        <th> Price</th>
                        <th>Description</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%

                    ProductDAO daoImpl = new ProductDAOImpl();
                    
                   List<Product> lst = 
                		   daoImpl.getAllProducts();

                    if(lst.size() > 0)
                    {
                    for (Product p : lst) {
                    %>
                    <tr>

                        <td><%=p.getProductid()%></td>

                        <td><%=p.getProductname()%></td>
                        <td>
                            <%=p.getCategoryid()%>
                        </td>
                        <td>
                            <%=p.getQuantity()%>
                        </td>
                        <td><%=p.getPrice()%></td>
                        <td><%=p.getDescription()%></td>
                        
                         <td>
                            <form action="DeleteProduct.jsp" method="post">
                            <input type="hidden" name="productid" value="<%=p.getProductid()%>"/>
                            <input class = "btn btn-danger" id="myBtn2" type="submit" value="Delete This Product"/>
                            </form>
                        </td>
                        
                        <td>
                        	<button id="myBtn" class="btn btn-danger"
                        	onclick="openMyDialog(<%=p.getProductid()%>)">Update This Product</button>
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
            
            
            
            
            <!-- Start Of The Modal Design-->
<div class="container" align="center">
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table class="table table-hover">
        <tr>
            <th align="center"> <b>Enter Product Details To Be Updated : </b></th>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="pname">Enter New Name</label> 
                <input type="text" class="form-control" id="pname" name="pname"/>
            </td>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="price">Enter price</label> 
                <input type="text" class="form-control" id="price" name="price"/>
            </td>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="quantity">Enter quantity</label> 
                <input type="text" class="form-control" id="quantity" name="quantity"/>
            </td>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="pdesc">Enter New Description</label> 
                <input type="text" class="form-control" id="pdesc" name="pdesc"/>
            </td>
        </tr>
        <tr>
            <td><button id="btnUpdate" class="btn btn-danger" onclick="updateProduct()">
            		Update Product
            	</button>
            </td>
        </tr>
    </table>
  </div>
</div>
</div>
<!-- End Of The Modal Design-->
        
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

									var productid = 0;

									// When the user clicks the button, open the modal 
									function openMyDialog(id) {
										modal.style.display = "block";
										productid = id;
									}

									function updateProduct() {

										var price = document
												.getElementById("price").value;
										
										var qty = document
										.getElementById("quantity").value;
	
										var pname = document
										.getElementById("pname").value;
										
										var pdesc = document
										.getElementById("pdesc").value;
										
										var url = "UpdateProduct.jsp?productid="
												+ productid
												+ "&price="
												+ price
												+ "&qty="
												+ qty
												+ "&pname="
												+ pname
												+ "&pdesc="
												+ pdesc;

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
												alert("product updated");
												window.location.reload(true);
											} else {
												alert("product update failed");
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
			<jsp:include page="adminlogin.html"></jsp:include>
		<%				
			}
		%>

</body>
</html>