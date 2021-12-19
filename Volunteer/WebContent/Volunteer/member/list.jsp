<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<%@ include file = "admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보목록</title>
</head>
<body>
	<h3>회원정보출력</h3>
	<table border=1 width="500">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>성별</th>
		</tr>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select mem_id, mem_ssn, mem_email, mem_gender from member order by mem_no desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int i = 1;
		String mem_ssn;
		String mem_email;
		
		
		while(rs.next()) {
			mem_id = rs.getString("mem_id");
			mem_ssn = rs.getString("mem_ssn");
			mem_email = rs.getString("mem_email");
			
	%>
			<tr>
				<td><%=i++ %></td>
				<td><a href="content.jsp?mem_id=<%=mem_id%>"><%=mem_id %></a></td>
				<td><%=mem_ssn %></td>
				<td><%=mem_email %></td>
				<td><%=rs.getString("mem_gender") %></td>
			</tr>
	<%
		}
	%>
	</table>	
</body>
</html>
<%
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
%>