<%@page import="com.pharmacystore.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDAOImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {

color:black;
}

#nav{
background-color:#1977cc;
color:white;
}


</style> 
<script type="text/javascript">

function validateprodid(productid) 
{
    
    var numval = productid.value
    
    curprodvar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    productid.value =  curprodvar;
    
    productid.focus;
}


function validatecatid(categoryid); 
{
    
    var numval = categoryid.value
    
    curprodvar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    categoryid.value =  curprodvar;
    
    categoryid.focus;
}
function validatequantity(quantity); 
{
    
    var numval = quantity.value
    
    curprodvar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    quantity.value =  curprodvar;
    
    quantity.focus;
}
</script>
<body>
<%
if(!session.isNew() || session.getAttribute("ADMIN") != null){
	%>
	
	<nav class="navbar navbar-default" id="nav">
					<div class="container-fluid">
						<div class="navbar-header">
						<a href="adminhome.jsp" class="navbar-brand" id="nav"> ADMIN HOME </a>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logoutadmin.jsp" id="nav"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
					</ul>
					</div>
				</nav>
				



	<div class="container">
		
		<div class="row">
		<div class="col-md-2"></div>
            <div class="col-md-6">
                
                <form action="addproduct.jsp" method="post" id="fileForm" role="form">
                <fieldset><legend class="text-center">All Fields <span class="req"><small> required *</small></span></legend>
    

                    <div class="form-group">
                        <label for="productname"><span class="req">* </span> Product Name </label>
                        <input required name="productname" type="text" class="form-control inputpass" minlength="4" maxlength="30"  id="productname" /> </p>
    				</div>
    				<div class="form-group">	
                        <label for="categoryid"><span class="req">* </span> Category Name </label>
	                        <select class="form-control" id="categoryid" name="categoryid">
	        					<%
	        						CategoryDAO daoImpl = new CategoryDAOImpl();
                        			List<Category> lst = daoImpl.getAllCategories();
                        			if(lst.size() > 0)
                        			{
                        				for(Category category : lst)
                        				{
                        		%>
                        				<option value="<%=category.getCategoryId()%>"> <%=category.getCategoryName()%></option>
                        		<%			
                        				}
                        			}
	        					%>
	      					</select>
                    </div>
                    <div class="form-group">
                        <label for="price"><span class="req">* </span> Price </label> 
                            <input class="form-control" required type="text" name="price" id = "price" />   
                                <div class="status" id="status"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="quantity"><span class="req">* </span>Quantity </label>
                        <input required type="text" name="quantity" id="quantity" class="form-control" max="60" min="18" onkeyup="validatequantity(this);" placeholder="Enter quantity to add"/> 
                    </div>
                    
                    
                    
                    <div class="form-group">
                        <label for="description"><span class="req">* </span> Description </label>
                        <input required type="textarea" name="description" id="description" class="form-control" maxlength="150"  placeholder="Description"/> 
                    </div>
    
    
                
                
    
                <div class="form-group">
                    <input class="btn btn-success" type="submit" name="submit_reg" value="Submit Product">
                </div>
                </fieldset>
           </form>
                 </div>
            
           
            </div>
            </div>
            
            <% 
}else
{
	%>
	<p style="color:red">You need to login first to add product</p>
	<jsp:include page="adminlogin.html"></jsp:include>
<% 
}
%>




</body>
</html>