<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/Volunteer/conf/dbconn.jsp" %>
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
		String mem_id = request.getParameter("mem_id");
	
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select * from member where mem_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		
		String mem_rid = "";
		String mem_name = "";
		String mem_ssn = "";
		String mem_email ="";
		String mem_gender ="";
		String mem_zipcode ="";
		String mem_addr1 ="";
		String mem_addr2 ="";
		String mem_profile ="";
		
		
		
		if (rs.next()) {
			mem_rid = rs.getString("mem_id");
			mem_name = rs.getString("mem_name");
			mem_ssn = rs.getString("mem_ssn");
			mem_email = rs.getString("mem_email");
			mem_gender = rs.getString("mem_gender");
			mem_zipcode = rs.getString("mem_zipcode");
			mem_addr1 = rs.getString("mem_addr1");
			mem_addr2 = rs.getString("mem_addr2");
			mem_profile = rs.getString("mem_profile");
		}
		String[] mail = mem_email.split("@");
		
		
		
	%>
		<div class="image">
			<div class="text">
				<h3>회원정보수정</h3>
				*는 필수입력 항목입니다.
				<form name="join" action="modify_ok.jsp?mem_id=<%=mem_id %>" method="post">
					* 아이디 : <%=mem_rid %> <br>
					* 비밀번호 : <input type="password" name="mem_passwd" size="20"><br>
					* 비밀번호확인 : <input type="password" name="mem_passwd2" size="20"><br>
					* 이름 : <input type="text" name="mem_name" size="20" value="<%=mem_name%>" readonly><br>
					* 생년월일 : <input type="text" name="mem_ssn" size="8" maxlength="8" value="<%=mem_ssn%>"><br>
					* 이메일 : <input type="text" name="mem_email1" size="20" value="<%=mail[0]%>">@<input type="text" name="mem_email2" size="20" value="<%=mail[1]%>"><br>
					성별 : <input type="radio" name="mem_gender" value="남" <% if(mem_gender.equals("남")) { %> checked <% } %>>남
						 <input type="radio" name="mem_gender" value="여" <% if(mem_gender.equals("여")) { %> checked <% } %>>여<br>
					우편번호 : <input type="text" name="mem_zipcode" size="5" value="<%=mem_zipcode%>" readonly> <input type="button" value="우편번호검색" onclick="search_addr()"><br>
					주소 : <input type="text" name="mem_addr1" size="50" value="<%=mem_addr1%>" readonly><br>
					상세주소 : <input type="text" name="mem_addr2" size="50" value="<%=mem_addr2%>"><br>
					자기소개 :<br> <textarea name="mem_profile" cols="50" rows="5" placeholder="자기소개를 입력하세요~!>"><%=mem_profile%></textarea><br>
					<input type="submit" value="회원정보수정">&nbsp;&nbsp;
					<input type="reset" value="취소">
				</form>
			</div>
		</div>
	<%
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	%>
</body>
</html>