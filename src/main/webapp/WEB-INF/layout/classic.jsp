<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>

	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
		prefix="tilesx"%>
	<%@ taglib uri="http://www.springframework.org/security/tags"
		prefix="security"%>
	<tilesx:useAttribute name="current" />
	<div class="container">

		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<spring:url value="/"/>">Office Managment - OM</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="${current == 'index' ? 'active' : ' '}"><a
							href='<spring:url value="/"/>'>Home</a></li>
						<security:authorize access="hasRole('ADMIN')">	
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Articles<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href='#'>Articles</a></li>
								<li><a href='#'>Articles Groups</a></li>
								<li><a href='#'>Ware groups</a></li>
							</ul></li>
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Managment<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="${current == 'units' ? 'active' : ' '}"><a href='<spring:url value="/units.html"/>'>Units</a></li>
								<li class="${current == 'stocks' ? 'active' : ' '}"><a href='<spring:url value="/stocks.html"/>'>Stocks</a></li>
							</ul></li>
											
								<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">User data<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="${current == 'users' ? 'active' : ' '}"><a
								href='<spring:url value="/users.html"/>'>Users</a></li>

							</ul></li>
						</security:authorize>
	<!-- 					<security:authorize access="! isAuthenticated()">
							<li class="${current == 'register' ? 'active' : ' '}"><a
								href='<spring:url value="/register.html"/>'>Registration</a></li>

							<li class="${current == 'login' ? 'active' : ' '}"><a
								href='<spring:url value="/login.html"/>'>Login</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${current == 'account' ? 'active' : ' '}"><a
								href='<spring:url value="/account.html"/>'>My account</a></li>
							<li><a href='<spring:url value="/logout"/>'>Logout</a></li>
						</security:authorize>
	 					<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>	-->
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<!-- <li><a href="../navbar/">Default</a></li>
						<li class="active"><a href="./">Fixed top <span
								class="sr-only">(current)</span></a></li>  -->
						
							<security:authorize access="! isAuthenticated()">
							<li class="${current == 'register' ? 'active' : ' '}"><a
								href='<spring:url value="/register.html"/>'>Registration</a></li>

							<li class="${current == 'login' ? 'active' : ' '}"><a
								href='<spring:url value="/login.html"/>'>Login</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">								
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Account<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="${current == 'account' ? 'active' : ' '}"><a
								href='<spring:url value="/account.html"/>'>My account</a></li>
							
								<!-- <li><a href="#">Something else here</a></li> -->
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Danger section</li>
								<li><a href='<spring:url value="/logout"/>'>Logout</a></li>
							</ul></li>
							</security:authorize>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<br> <br>		<br> <br>

		<tiles:insertAttribute name="body" />
		<br> <br>
		<center>
			<tiles:insertAttribute name="footer" />
		</center>
	</div>
	<!-- /container -->
</body>
</html>