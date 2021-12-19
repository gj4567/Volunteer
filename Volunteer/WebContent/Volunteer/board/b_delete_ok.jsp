<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴처리</title>
</head>
<body>
<%	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	request.setCharacterEncoding("UTF-8");
	
	String bo_no = request.getParameter("bo_no");
	String bo_passwd = request.getParameter("bo_passwd");
	
	
	String sql1 = "SELECT * FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no where b.bo_no = ?";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, bo_no);
	rs = pstmt.executeQuery();
	
	
	if(rs.next()) {
		String bo_rpass = rs.getString("mem_passwd");
		if(bo_passwd.equals(bo_rpass)){
		
		;
			
		String sql = "delete from board where bo_no = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bo_no);
		pstmt.executeUpdate();
	
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("board.jsp");
	}
}
%>
<%	
	if(rs != null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
%>
</body>
</html>