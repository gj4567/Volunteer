<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/Volunteer/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>회원정보수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String bo_no = request.getParameter("bo_no");
	
		ResultSet rs = null;
		PreparedStatement pstmt = null;
	
		String sql = "SELECT b.bo_subject, b.bo_content, m.mem_name, m.mem_passwd FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no where b.bo_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bo_no);
		rs = pstmt.executeQuery();
	

		String bo_subject = "";
		String bo_content = "";
		String mem_name = "";
		String bo_passwd = "";
	
		if(rs.next()){
			bo_subject = rs.getString("bo_subject");
			bo_content = rs.getString("bo_content");
			mem_name = rs.getString("mem_name");
			bo_passwd = rs.getString("mem_passwd");
		
	%>
	<div class="image">
		<div class="text">
		<h3>회원정보수정</h3>
		<form name="board" action="b_modify_ok.jsp?bo_no=<%=bo_no %>" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="mem_name" value=<%=mem_name %> readonly></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bo_subject" value=<%=bo_subject %>></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="50" rows="10" name="bo_content" ><%=bo_content %></textarea></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="bo_passwd"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>