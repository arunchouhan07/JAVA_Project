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
                
                <form action="deletecategory.jsp" method="post" id="fileForm" role="form">
                <fieldset><legend class="text-center">All Fields <span class="req"><small> required *</small></span></legend>
    
                    <div class="form-group">	
                        <label for="categoryid"><span class="req">* </span> Select Category </label>
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
                    	<input class="btn btn-success" type="submit" name="submit_reg" value="Delete Category">
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
	<p style="color:red">You need to login first to add category</p>
	<jsp:include page="adminlogin.html"></jsp:include>
<% 
}
%>




</body>
</html>