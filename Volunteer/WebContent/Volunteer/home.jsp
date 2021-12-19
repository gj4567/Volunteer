<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css" />
<title>늘푸른 봉사활동</title>
</head>
<body>
	<header>
		<table>
			<tr>
				<td width="30%"><h1>늘푸른 봉사활동</h1></td>
				<td width="50%">&nbsp;</td>
				<td width="20%"><%@ include file="/Volunteer/member/login.jsp" %></td>
			</tr>
		</table>
	</header>
	<nav>
		<ul>
			<li><a href="before.jsp">봉사활동을시작하기에앞서</a></li>
			<li><a href="./information/information_list.jsp?mem_id=<%=mem_id%>">봉사활동정보&참여</a></li>
			<li class="my"><a href="./mypage/mypage.jsp?mem_id=<%=mem_id%>">나의자원봉사</a></li>
			<li><a href="./board/board.jsp?mem_id=<%=mem_id%>">봉사활동게시판</a></li>
		</ul>
	</nav>
	<section class="sec">
		<img src="./images/1.png">
	</section>
	<footer> Copyright &copy; 2021.10 CSM All rights reserved </footer>
</body>
</html>