<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mongo JSP Sample Page</title>
<%-- <%@ page import="com.sdm.mongo.*"  %> --%>
<%@ page import="com.mongodb.*"  %>
</head>
<body>
<h1>Mongo DB Details</h1>
<h1>Choose Collection Name : </h1>
<table border=1 cellpadding=5>
	<tr>
		<th>Result Number</th>
		<th>Result Data</th>
	</tr>

<%
	//connect to mongodb
	MongoClient mongoClient = new MongoClient("localhost",27017);

	//Get mongodb instance
	DB mongoDB = mongoClient.getDB("geoprofile");
	
	//get collection
	DBCollection mongoColl = mongoDB.getCollection("geodata");
	DBCursor mongoCur = mongoColl.find();
	int i=1;
	while(mongoCur.hasNext()){
%>		
		<tr>
			<td><%=i %></td>
			<td><%=mongoCur.next() %></td>
		</tr>		
<%
			i++;
		} 
		mongoCur.close();
		mongoClient.close();
%>
</table>		
</body>
</html>