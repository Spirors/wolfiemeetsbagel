<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width:device-width, initial-scale=1">
		<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/style_main.css" rel="stylesheet" />
	</head>
	<body>

	<br/>
		<h2 style="text-align: center">Find Users who have dated this User</h2>

		<div class="container">
			<h3>Search Options:-</h3>
			<br/>
			<div class="row">
				<div class="col">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Search by Customer</h5>
    					<div class="container">
							<form method="POST" action="searchDatedUsersByCustomerName">
								<label for="customerName">Customer Name:</label>
	    						<input type="text" class="form-control" id="customerName" name="customerName" placeholder="Type Customer SSN">
								<br/>
								<input type="submit" value="Search" class="btn btn-primary btn-bet"/>
							</form>
						</div>
					  </div>
					</div>
				</div>
				
			</div>				
		</div>
		<div class="container pt-1">
			<form action="home.jsp">
				<input type="submit" value="Home" class="btn btn-success" style="width: 20% !important; display: table; margin: auto"/>
			</form>
		</div>
		
		<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/4.1.3/bootstrap.min.js"></script>
	</body>
</html>
