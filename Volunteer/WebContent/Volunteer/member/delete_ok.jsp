<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		
		PreparedStatement pstmt = null;
	
		String sql = "delete from member where mem_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		pstmt.executeUpdate();
		
		response.sendRedirect("logout.jsp");
	
		if (pstmt != null)pstmt.close();
		if (conn != null)conn.close();
	%>
</body>
</html>