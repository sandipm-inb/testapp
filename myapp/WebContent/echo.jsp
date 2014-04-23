<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Echoing HTML request parameters</title>
</head>
<body>
	<h3>Choose the author :</h3>
	<form method="get">
		<input type="checkbox" name="author" value="Tan ah Teck">Tan
		<input type="checkbox" name="author" value="Mohd Ali">Ali
		<input type="checkbox" name="author" value="J Kumar">J. Kumar
		<input type="submit" value="Query">
	</form>
	<%
		String[] authors = request.getParameterValues("author");
		if(authors!=null){
			%>
			<h3>You have selected following authors : </h3>
			<ul>
		<%	
			for(int i=0;i<authors.length; ++i){
				%>
				<li><%= authors[i] %></li>
		<%
			}
		%>
			</ul>
			<a href="<%=request.getRequestURI() %>">BACK</a>
			<%
		}
	%>
</body>
</html>