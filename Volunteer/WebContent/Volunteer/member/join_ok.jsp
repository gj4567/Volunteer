<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
	
		String mem_id = request.getParameter("mem_id");
		String mem_passwd = request.getParameter("mem_passwd");
		String mem_name = request.getParameter("mem_name");
		String mem_ssn = request.getParameter("mem_ssn");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email1")+"@"+request.getParameter("mem_email2");
		String mem_gender = request.getParameter("mem_gender");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		String mem_profile = request.getParameter("mem_profile");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into member(mem_id,mem_passwd,mem_name,mem_ssn,mem_phone,mem_email,mem_gender,mem_zipcode,mem_addr1,mem_addr2,mem_profile) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_passwd);
			pstmt.setString(3, mem_name);
			pstmt.setString(4, mem_ssn);
			pstmt.setString(5, mem_phone);
			pstmt.setString(6, mem_email);
			pstmt.setString(7, mem_gender);
			pstmt.setString(8, mem_zipcode);
			pstmt.setString(9, mem_addr1);
			pstmt.setString(10, mem_addr2);
			pstmt.setString(11, mem_profile);
			pstmt.executeUpdate();
			
			out.println("<script>alert('회원가입을 축하합니다.')</script>");
			
			response.sendRedirect("../home.jsp");
		} catch(SQLException e) {
			out.println("실패");
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>