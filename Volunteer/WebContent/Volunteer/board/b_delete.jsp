<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bo_no = request.getParameter("bo_no");
	String bo_passwd = request.getParameter("mem_passwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
		function check() {
			vol_user = confirm("진짜로 작성된 글을 삭제하시겠습니까?");

			if (vol_user) {
				location.href="b_delete_ok.jsp?bo_no=<%=bo_no%>";
			}else
				history.back();
			{

			}
			member.submit();
		}
	</script>
</head>
<body>
	<form name=member action=b_delete_ok.jsp?bo_no=<%=bo_no%> method="post">
	비밀번호 : <input type="password" name="bo_passwd">
	<input type="button" value="삭제" onclick="check()" >
	</form>
</body>
</html>