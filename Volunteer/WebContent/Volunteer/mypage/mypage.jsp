<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<% String login_id = (String) session.getAttribute("mem_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>봉사활동목록</h1>
	</header>
	<section>
		<h3>내가 지원한 봉사활동</h3>
		<div class="image">
			<div class="textfor">
				<%
					request.setCharacterEncoding("UTF-8");
					
					ResultSet rs = null;
					PreparedStatement pstmt = null;
					
					String sql = "SELECT a.information_id, i.info_no, i.info_field, i.info_title, i.info_mozip, i.info_date, i.info_date2 FROM information i LEFT JOIN application a ON i.info_no = a.information_id WHERE a.login_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, login_id);
					rs = pstmt.executeQuery();
						
					String info_no;
					String info_field;
					String info_title;
					String info_mozip;
					String info_date;
					String info_date2;
						
					while (rs.next()) {
						info_no = rs.getString("info_no");
						info_field = rs.getString("info_field");
						info_title = rs.getString("info_title");
						info_mozip = rs.getString("info_mozip");
						info_date = rs.getString("info_date");
						info_date2 = rs.getString("info_date2");
				%>
				<table border="1">
					<tr>
						<td>모집중<%=info_field %></td>
					</tr>
					<tr>
						<th><a href="../information/information_content.jsp?info_no=<%=info_no%>&mem_id=<%=login_id%>"><%=info_title %></a></th>
					</tr>
					<tr>
						<td>[모집기관]<%=info_mozip %>&nbsp;[모집기간]<%=info_date %>&nbsp;[봉사기간]<%=info_date2 %></td>
					</tr>
				</table>
				<%
					}
				%>
				<%
					if (pstmt != null)
						pstmt.close();
				%>
		<h3>내가쓴 게시글</h3>
				<%
				String sql2 = "SELECT b.bo_no, b.bo_select, b.bo_subject, b.bo_content, m.mem_name FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no where m.mem_id = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, login_id);
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
			<%
				}
			%>
			<a href="#" onclick="window.location='../home.jsp'">메인으로</a>
			</div>
		</div>
	</section>
</body>
</html>
<%
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
