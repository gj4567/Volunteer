<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
<%@ include file = "admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보상세출력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		mem_id = request.getParameter("mem_id");
			
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select * from member where mem_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		
		String mem_email;
		String mem_zipcode;
		String mem_addr1;
		String mem_addr2;
		String mem_profile;
		
		if(rs.next()) {
			mem_email = rs.getString("mem_email");
			mem_zipcode = rs.getString("mem_zipcode");;
			mem_addr1 = rs.getString("mem_addr1");;
			mem_addr2 = rs.getString("mem_addr2");;
			mem_profile = rs.getString("mem_profile");;	
	%>
	
	<h3>회원정보 상세출력</h3>
	<table border="1" width="400">
		<tr>
			<td>아이디</td>
			<td><a href="mailto:<%=mem_email%>"><%=mem_id %></a></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><%=mem_zipcode %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=mem_addr1 %></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><%=mem_addr2 %></td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td><%=mem_profile %></td>
		</tr>
	</table>
	<%
		}
	%>
<a href="#" onclick="history.back()">목록으로</a>
</body>
</html>
<%
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
%>