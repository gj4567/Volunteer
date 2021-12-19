<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_ssn = request.getParameter("mem_ssn");
		String mem_email = request.getParameter("mem_email1")+"@"+request.getParameter("mem_email2");
		String mem_gender = request.getParameter("mem_gender");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		String mem_profile = request.getParameter("mem_profile");
		
		PreparedStatement pstmt = null;
		
		String sql = "update member set mem_name=?,mem_ssn=?,mem_email=?,mem_gender=?,mem_zipcode=?,mem_addr1=?,mem_addr2=?,mem_profile=? where mem_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_name);
		pstmt.setString(2, mem_ssn);
		pstmt.setString(3, mem_email);
		pstmt.setString(4, mem_gender);
		pstmt.setString(5, mem_zipcode);
		pstmt.setString(6, mem_addr1);
		pstmt.setString(7, mem_addr2);
		pstmt.setString(8, mem_profile);
		pstmt.setString(9, mem_id);
		pstmt.executeUpdate();
		
		response.sendRedirect("../home.jsp");
		
		if (pstmt != null)pstmt.close();
		if (conn != null)conn.close();
	%>
</body>
</html>