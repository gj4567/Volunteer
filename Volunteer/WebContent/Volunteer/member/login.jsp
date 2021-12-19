<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Volunteer/conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>로그인</title>
<script>
	function check1() {
		if (!login.mem_id.value) {
			alert("아이디를 입력하세요");
			login.mem_id.focus();
			return false;
		}
		if (!login.mem_passwd.value) {
			alert("비밀번호를 입력하세요");
			login.mem_passwd.focus();
			return false;
		}
		login.submit();
	}
</script>
</head>
<body>
			<%
				request.setCharacterEncoding("UTF-8");

			String mem_id = "";
			String mem_name = "";
			if (session.getAttribute("mem_id") != null) {
				mem_id = (String) session.getAttribute("mem_id");
				mem_name = (String) session.getAttribute("mem_name");

			}
			%>

			<%
				if (mem_id.equals("admin")) {
			%>
			<p>로그인 성공</p>
			<p>관리자님 환영합니다.</p>
			<a href="logout.jsp">로그아웃</a> <a href="list.jsp">회원목록보기</a>
			<%
				} else if (!mem_id.equals("")) {
			%>
			<p>로그인 성공</p>
			<p><%=mem_name%>님 환영합니다.
			</p>
			<a href="./member/logout.jsp">로그아웃</a> <a
				href="./member/modify.jsp?mem_id=<%=mem_id%>">회원정보수정</a> <a
				href="./member/delete.jsp?mem_id=<%=mem_id%>">회원탈퇴</a>
			<%
				} else {
			%>
			<h3>로그인</h3>
			<form name="login" action="./member/login_ok.jsp" method="post">
				아이디 : <input type="text" name="mem_id"><br> 
				비밀번호 : <input type="password" name="mem_passwd"><br> 
				<input type="button" value="로그인" onclick="check1()"> 
				<input type="button" value="회원가입" onclick="window.location='./member/join.jsp'">
			</form>
			<%
				}
			%>
</body>
</html>