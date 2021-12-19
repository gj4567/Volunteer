<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String mem_id = request.getParameter("mem_id");
		String mem_passwd = request.getParameter("mem_passwd");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select mem_id, mem_passwd, mem_name, mem_no from member where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String mem_rId = rs.getString("mem_id");
				String mem_rPasswd = rs.getString("mem_passwd");
				String mem_name = rs.getString("mem_name");
				String mem_no = rs.getString("mem_no");
				out.println("mem_no : " + mem_no);
				
				if (mem_id.equals(mem_rId) && mem_passwd.equals(mem_rPasswd)) {
					session.setAttribute("mem_id", mem_id);
					session.setAttribute("mem_name", mem_name);
					session.setAttribute("mem_no", mem_no);
					response.sendRedirect("../home.jsp?mem_id="+mem_rId);
				} else {
					response.sendRedirect("./member/logout.jsp");
				}
			}
			
		} catch(SQLException e) {
			out.println("SQLExepcion: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>