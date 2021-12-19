<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String bo_no = request.getParameter("bo_no");
		String bo_subject = request.getParameter("bo_subject");
		String bo_content = request.getParameter("bo_content");
		String bo_passwd = request.getParameter("bo_passwd");
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql1 = "SELECT m.mem_passwd FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no where b.bo_no = ?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, bo_no);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			String bo_rpass = rs.getString("mem_passwd");
			if(bo_passwd.equals(bo_rpass)){
			
			String sql = "update board set bo_subject=?, bo_content=? where bo_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bo_subject);
			pstmt.setString(2, bo_content);
			pstmt.setString(3, bo_no);
			pstmt.executeUpdate();
			
				response.sendRedirect("board_list.jsp");
			}else{
				response.sendRedirect("board.jsp");
			}
		}
%>
<%				
			if(rs != null)conn.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			
%>
	%>
</body>
</html>