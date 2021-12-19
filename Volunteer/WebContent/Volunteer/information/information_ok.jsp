<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<%-- <%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String info_no = request.getParameter("info_no");
		String info_title = request.getParameter("info_title");
		String info_date = request.getParameter("info_date");
		String info_time = request.getParameter("info_time");
		String info_date2 = request.getParameter("info_date2");
		String info_week = request.getParameter("info_week");
		String info_personnel1 = request.getParameter("info_personnel1");
		String info_personnel2 = request.getParameter("info_personnel2");
		String info_field = request.getParameter("info_field");
		String info_age = request.getParameter("info_age");
		String info_mozip = request.getParameter("info_mozip");
		String info_application = request.getParameter("info_application");
		String info_place = request.getParameter("info_place");
		String info_people = request.getParameter("info_people");
		String info_content = request.getParameter("info_content");
	
		/*Timestamp vol_dat = new Timestamp(System.currentTimeMillis());
		Timestamp vol_date = vol_dat;
		Timestamp vol_date2 = vol_dat; */

		/* Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
		String vol_time = sf.format(now); */
		// vol_time string -> time 형변환
	

		PreparedStatement pstmt = null;

		try {
			String sql = "insert into information(info_title,info_date,info_time,info_date2,info_week,info_personnel1,info_personnel2,info_field,info_age,info_mozip,info_application,info_place,info_people,info_content) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info_title);
			pstmt.setString(2, info_date);
			pstmt.setString(3, info_time);
			pstmt.setString(4, info_date2);
			pstmt.setString(5, info_week);
			pstmt.setString(6, info_personnel1);
			pstmt.setString(7, info_personnel2);
			pstmt.setString(8, info_field);
			pstmt.setString(9, info_age);
			pstmt.setString(10, info_mozip);
			pstmt.setString(11, info_application);
			pstmt.setString(12, info_place);
			pstmt.setString(13, info_people);
			pstmt.setString(14, info_content);
			pstmt.executeUpdate();

			out.println("작성완료");
			response.sendRedirect("information_content.jsp");
		} catch (SQLException e) {
			out.println("작성실패");
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>