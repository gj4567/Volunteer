<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int information_id = Integer.parseInt(request.getParameter("info_no"));
		String login_id = request.getParameter("mem_id");
		int vol_personnel2 = Integer.parseInt(request.getParameter("info_personnel2"));
		String id = request.getParameter("id");
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
		
			String sql3 = "select * FROM application where information_id = ? AND login_id = ?";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, information_id);
			pstmt.setString(2, login_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			
			
	%>
				이미 신청 하셨습니다.<br>
				<input type="button" value="닫기" onclick="window.location='information_content.jsp'">
	<%
			} else {
			
			if (pstmt != null) pstmt.close();
			
			String sql1 = "update information set info_personnel2 = info_personnel2+1 where info_no = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, information_id);
			pstmt.executeUpdate();
			
			if (pstmt != null) pstmt.close();
			
			String sql2 = "insert into application(information_id,login_id) values (?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, information_id);
			pstmt.setString(2, login_id);
			pstmt.executeUpdate();

			
			response.sendRedirect("information_content.jsp?info_no="+information_id+"&info_id="+login_id);
			}
		} catch (SQLException e) {
			out.println("신청실패");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>