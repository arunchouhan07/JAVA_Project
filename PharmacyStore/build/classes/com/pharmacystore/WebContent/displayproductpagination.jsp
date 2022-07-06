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
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="Homepage/css/button.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

#new{
background-color:#1977cc;

}
#head{
color:white;
}
.grid-container{
justify-content:space-evenly;
border-all:2px solid black;
}
.grid-item{

border:2px solid black;
padding: 10px;
font-size: 15px;
}

#myBtn:hover {
  background-color: #1997cc;
}

.page-link:hover{
background-color:#1997cc;
}

#pad{
margin-left:20px;

}
</style>
<body>


<%

if(!session.isNew() || session.getAttribute("USER") != null)
{
int pageid=Integer.parseInt(request.getParameter("page"));
int total=6;
	if(pageid==1){}
	else{
	pageid=pageid-1;
	pageid=pageid*total+1;
	}
%>
<nav class="navbar " id="new" >
  <div class="container-fluid">
    <div class="navbar-header" >
      <a class="navbar-brand" href="userhome.jsp" id="head">USER HOME</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="displayproductpagination.jsp" id="head">All Products</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
	<li><a href="userlogout.jsp"  id="head"><span
	class="glyphicon glyphicon-log-out" id="head"></span> Logout</a>
        </li>
     </ul>
  </div>
</nav>		
		
		
	 <div class="container">
        
     
            
            <%
            
            ProductDAO pdao = new ProductDAOImpl();
            
            List<Product> lst = 
            		pdao.getAllProducts(pageid, total);

            if(lst.size() > 0)
            {
            for (Product qs : lst) {
            	%>
            	<div class="border-all">
            	<div class="col-lg-4">
            		<div class="grid-container">
            			<br><br>
            			<div class="grid-item"><%=qs.getProductid()%><br><%=qs.getProductname()%><br><img src="Homepage/css/display.jpg" class="img-responsive" style="height:195px; width:100%" alt="Image"><br>Price : <%=qs.getPrice()%><br>Quantity Available <%=qs.getQuantity()%><br><button id="myBtn" class="btn btn-danger"
                        			onclick="openMyDialog(<%=qs.getProductid()%>)">Place Order</button></div>
            		
            		</div>
            
            
            	</div>	
            	</div>
            	
    
    
    	 
<%}}}else{%>

<p style=color:red> You need to login first !!! </p>
<jsp:include page="userlogin.html"></jsp:include>


	<%   }%>  
	
	
	<div class="clearfix">
                <ul class="pagination" id ="pag">
                <% 
                
                int pageid=Integer.parseInt(request.getParameter("page"));
                     if(pageid > 1){
                %>
                    <li class="page-item"><a href="displayproductpagination.jsp?page=<%=(pageid-1)%>">Previous</a></li>
                <%
                }
                %>
                    <li class="page-item"><a href="displayproductpagination.jsp?page=1" class="page-link">1</a></li>
                    <li class="page-item"><a href="displayproductpagination.jsp?page=2" class="page-link">2</a></li>
                    <li class="page-item "><a href="displayproductpagination.jsp?page=3" class="page-link">3</a></li>
                    <!-- <li class="page-item"><a href="#" class="page-link">4</a></li> -->
               <%
                if(pageid < 3){
                %>
                    <li class="page-item"><a href="displayproductpagination.jsp?page=<%=(pageid+1)%>" class="page-link">Next</a></li>
                <%
                }
                %>
                </ul>
            </div>
	</div>
	
	
	
	
	
	
	 <div class="container" align="center">
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table class="table table-hover">
        <tr>
            <th align="center"> <b>Enter Order Details To Place Order : </b></th>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="quantity">Enter quantity</label> 
                <input type="text" class="form-control" id="quantity" name="quantity"/>
            </td>
        </tr>
        <tr>
            <td>
            	<label class="control-label" for="address">Enter address</label> 
                <input type="text" class="form-control" id="address" name="address"/>
            </td>
        </tr>
        
       
        <tr>
            <td><button id="btnRaise" class="btn btn-danger" onclick="placeOrder()">
            		Place Order
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
									
									

									function placeOrder() {

										var address = document
												.getElementById("address").value;
										
										var quantity = document
										.getElementById("quantity").value;
										
										
										
										var url = "Placeorder.jsp?productid="
												+ productid
												+ "&address="
												+ address
												+ "&quantity="
												+ quantity;
									

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
												alert("Order placed ");
												window.location.reload(true);
											}
											else if(val.trim()=="lessquantity"){
												alert("Enter Less Quantity");
												window.location.reload(true);
											}
											else {
												alert("Order Failed");
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
									
									
									
									
									  links = document.getElementById("#pag").querySelectorAll("a")
									  links.forEach(function (item) {
									    item.addEventListener('click', function () {
									      //reset the color of other links
									      links.forEach(function (item) {
									        item.style.backgroundColor = '#fff'
									      })
									      // apply the style to the link
									      this.style.backgroundColor = '#1997cc'
									    });
									  })

								
								</script>
	
            
            

</body>
</html>