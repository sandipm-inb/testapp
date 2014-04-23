<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mongo JSP Sample Page</title>
<%@ page import="com.sdm.mongo.*"  %>
</head>
<body>
<h1>Mongo DB Details</h1>
<h1>Choose Collection Name : </h1>
<%
	SMongoUtil mUtil = new SMongoUtil();
%>
<p> The No. of rows in collection <%= mUtil.getMongoDBConn()%></p>
<p> The first content in video_data <%= mUtil.getResultData()%></p>
</body>
</html>