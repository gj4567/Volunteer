<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String vol_userid = request.getParameter("vol_userid");
		String bo_subject = request.getParameter("bo_subject");
		String bo_select = request.getParameter("bo_select");
		String bo_content = request.getParameter("bo_content");
		PreparedStatement pstmt = null;
	
		try {
	
			// 사용자 no 조회
			ResultSet rs = null;
	
			String sql = "SELECT mem_no FROM member WHERE mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vol_userid);
			rs = pstmt.executeQuery();
			/* out.println("vol_userid : " + vol_userid);
			out.println("<BR />"); */
	
			int bo_no=0;
			if (rs.next()) {
				bo_no = rs.getInt("mem_no");
			} else {
				out.println("<h2>사용자 작성 글이 없습니다.</h2>");
			}
	
			//out.println("bo_no : " + bo_no + "<br/>");
	
			if (pstmt != null)
				pstmt.close();
	
			// 게시물 작성
			sql = "insert into board(bo_subject,bo_select,bo_content,vol_userid) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bo_subject);
			pstmt.setString(2, bo_select);
			pstmt.setString(3, bo_content);
			//pstmt.setString(4, vol_userid);
			
			pstmt.setInt(4, bo_no);
			pstmt.executeUpdate();
	
			out.println("글쓰기완료");
			response.sendRedirect("board_list.jsp");
		} catch (SQLException e) {
	
			out.println("글쓰기실패");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>