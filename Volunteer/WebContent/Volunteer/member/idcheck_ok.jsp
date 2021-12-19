<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select mem_id from member where mem_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		
		String mem_rid = "";
		
		if (rs.next()) {
			mem_rid = rs.getString("mem_id");
		}
		
		if (mem_id.equals(mem_rid)) {
	%>
			검색된 아이디는 <%=mem_id %>이며 중복된 아이디로 사용할 수 없습니다.<br>
			아이디를 다시검색해주세요.<br>
			<input type="button" value="닫기" onclick="window.close()">
	<%
		} else {
	%>
			검색된 아이디는 <%=mem_id %>이며 사용가능한 아이디입니다.<br>
			<input type="button" value="닫기" onclick="window.close()">
	<%
		}
	%>
	<%
		if(rs != null)rs.close();
		if(pstmt != null)pstmt.close();
		if(conn != null)conn.close();
	%>
</body>
</html>