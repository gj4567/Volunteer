<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String bo_no = request.getParameter("bo_no");

		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "SELECT b.bo_select, b.bo_subject, b.bo_content, m.mem_name FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no where m.mem_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bo_no);
		rs = pstmt.executeQuery();
		
		String bo_select = "";
		String bo_subject = "";
		String bo_content = "";
		String mem_name = "";

		
		while(rs.next()) {
			bo_select = rs.getString("bo_select");
			bo_subject = rs.getString("bo_subject");
			bo_content = rs.getString("bo_content");
			mem_name = rs.getString("mem_name");
	%>
	<div class="image">
		<div class="text">
		<h3>작성된글</h3>
		<table border="1" width="400">
			<tr>
				<td>이름</td>
				<td><%= mem_name %></td>
			</tr>
			<tr>
				<td>선택</td>
				<td><%= bo_select %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= bo_subject %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%= bo_content %></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>
	<%
		}
	%>
	<%
		if(rs != null)rs.close();
		if(pstmt!= null)pstmt.close();
		if(conn!= null)conn.close();
	%>