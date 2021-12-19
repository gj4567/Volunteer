<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<% String info_id = (String) session.getAttribute("mem_id"); %>
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
		<div class="image">
			<div class="text">
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;
	
					String sql = "select info_no, info_title,info_date,info_time,info_date2,info_week,info_personnel1,info_personnel2,info_field,info_age,info_mozip,info_application,info_place,info_people from information";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
	
					String info_no;
					String info_title;
					String info_date;
					String info_time;
					String info_date2;
					String info_week;
					String info_personnel1;
					String info_personnel2;
					String info_field;
					String info_age;
					String info_mozip;
					String info_application;
					String info_place;
					String info_people;
	
					while (rs.next()) {
						info_no = rs.getString("info_no");
						info_title = rs.getString("info_title");
						info_date = rs.getString("info_date");
						info_time = rs.getString("info_time");
						info_date2 = rs.getString("info_date2");
						info_week = rs.getString("info_week");
						info_personnel1 = rs.getString("info_personnel1");
						info_personnel2 = rs.getString("info_personnel2");
						info_field = rs.getString("info_field");
						info_age = rs.getString("info_age");
						info_mozip = rs.getString("info_mozip");
						info_application = rs.getString("info_application");
						info_place = rs.getString("info_place");
						info_people = rs.getString("info_people");
				%>
				<table border="1">
					<tr>
						<td>모집중<%=info_field %></td>
					</tr>
					<tr>
						<th><a href="information_content.jsp?info_no=<%=info_no%>&mem_id=<%=info_id%>"><%=info_title %></a></th>
					</tr>
					<tr>
						<td>[모집기관]<%=info_mozip %>&nbsp;[모집기간]<%=info_date %>&nbsp;[봉사기간]<%=info_date2 %></td>
					</tr>
				</table>
				<%
					}
				%>
				<a href="#" onclick="window.location='../home.jsp'">메인으로</a>
				<input type="button" value="글작성" onclick="window.location='information.jsp'">
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