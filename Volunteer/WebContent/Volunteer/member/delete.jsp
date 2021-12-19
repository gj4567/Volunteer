<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
		function checked() {
			user = confirm("진짜로 회원탈퇴를 하시겠습니까?");
		
			if (user) {
				location.href="delete_ok.jsp?mem_id=<%=mem_id%>";
			} else { 
				history.back();
			}
		}
	</script>
</head>
<body onload="checked()">
	<h4>회원탈퇴</h4>
</body>
