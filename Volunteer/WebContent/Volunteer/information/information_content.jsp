<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<% 
	String info_no = request.getParameter("info_no");
	String info_id = (String) session.getAttribute("mem_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>봉사활동안내</h1>
	</header>
	<section>
		<div class="image">
			<div class="text">
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;
	
					String sql = "select info_no,info_title,info_date,info_time,info_date2,info_week,info_personnel1,info_personnel2,info_field,info_age,info_mozip,info_application,info_place,info_people,info_content from information where info_no="+info_no;
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
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
					String info_content;

					if (rs.next()) {
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
						info_content = rs.getString("info_content");
				%>
					<b><%=info_title%></b>
					
					<table border="1">
						<tr>
							<td>봉사기간</td>
							<td><%=info_date%></td>
						</tr>
						<tr>
							<td>봉사시간</td>
							<td><%=info_time%></td>
						</tr>
						<tr>
							<td>모집기간</td>
							<td><%=info_date2%></td>
						</tr>
						<tr>
							<td>활동요일</td>
							<td><%=info_week%></td>
						</tr>
						<tr>
							<td>모집인원</td>
							<td><%=info_personnel1%>명/일</td>
						</tr>
						<tr>
							<td>신청인원</td>
							<td>
								<%=info_personnel2%>명<input type="button" value="신청하기" onclick="location.href='i_application.jsp?info_no=<%=info_no%>&mem_id=<%=info_id%>&info_personnel2=<%=info_personnel2%>'">
							</td>
						</tr>
						<tr>
							<td>봉사분야</td>
							<td><%=info_field%></td>
						</tr>
						<tr>
							<td>봉사자유형</td>
							<td><%=info_age%></td>
						</tr>
						<tr>
							<td>모집기관</td>
							<td><%=info_mozip%></td>
						</tr>
						<tr>
							<td>등록기관</td>
							<td><%=info_application%></td>
						</tr>
						<tr>
							<td>봉사장소</td>
							<td><%=info_place%></td>
						</tr>
						<tr>
							<td>봉사대상</td>
							<td><%=info_people%></td>
						</tr>
					</table>
							<pre><%=info_content %></pre>
					<%
						}
					%>
		<a href="#" onclick="window.location='information_list.jsp'">목록으로</a>
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