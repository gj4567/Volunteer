<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MySQL 데이터베이스 연동</title>
</head>
<body>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/volunteer?serverTimezone=UTC";
	String user = "root";
	String password = "12345";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	conn = DriverManager.getConnection(url, user, password);
%>
</body>
</html>