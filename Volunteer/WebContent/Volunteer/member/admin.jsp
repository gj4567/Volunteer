<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 접근불가</title>
</head>
<body>
	<%
		String mem_id = "";
	
		if (session.getAttribute("mem_id")!=null){
			mem_id=(String)session.getAttribute("mem_id");
		}
		if (!mem_id.equals("admin")) {
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>