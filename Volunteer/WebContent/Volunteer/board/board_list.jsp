<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>Insert title here</title>
<script type="text/javascript">
	function keyword_check() {
		if (document.search.ch2.value == '') { //검색어가 없을 경우  
			alert('검색어를 입력하세요'); //경고창 띄움 
			document.search.ch2.focus(); //다시 검색창으로 돌아감 
			return false;
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="image">
		<div class="textfor">
		<!-- <form>
			<fieldset>
				<legend>글 검색 하기</legend>
				<label>검색분류</label>
					<select name="f">
						<option value="bo_subject">글제목</option>
						<option value="mem_name">이름</option>
					</select>
				<label>검색어</label>
					<input type="text" name="q" value=""/>
					<input type="submit" value="검색">
			</fieldset>
		</form> -->
		<h1 align="CENTER">
		<!-- h1 사이즈로 내용 출력  -->
		글목록
		</h1>
		<form name="search" style="margin-right: 70px;" action="<%request.getContextPath();%>./search.jsp" method="post" onsubmit="return keyword_check()">
			<select name="ch1">
				<option value="bo_subject">글제목</option>
				<option value="mem_name">이름</option>
			</select>
				<input type="text" name="ch2">
				<input type="submit" value="검색하기">
		</form>
			<table border="1" width="700">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>글제목</th>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
				
					ResultSet rs = null;
					PreparedStatement pstmt = null;
	
					String sql = "SELECT b.bo_no, b.bo_subject, b.vol_userid, m.mem_name FROM board b LEFT JOIN member m ON b.vol_userid = m.mem_no";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
	
					int i = 1;
					int bo_no;
					String bo_subject;
					String mem_name;
					String bo_id;
					String vol_userid;
	
					while (rs.next()) {
						bo_no = rs.getInt("bo_no");
						bo_subject = rs.getString("bo_subject");
						mem_name = rs.getString("mem_name");
						bo_id = rs.getString("vol_userid");
				%>
				<tr>
					<td><%=i++%></td>
					<td><a href="b_content2.jsp?bo_no=<%=bo_id%>"><%=mem_name%></a></td>
					<td><a href="b_content.jsp?bo_no=<%=bo_no%>"><%=bo_subject%></a></td>
				</tr>
				<%
					}
				%>
			</table>
			<a href="#" onclick="window.location='../home.jsp'">메인으로</a>
		</div>
	</div>
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