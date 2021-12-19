<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css" />
<title>Insert title here</title>
</head>
<body>
	<%
		String vol_userid = (String) session.getAttribute("mem_id");
		String bo_no = (String) session.getAttribute("mem_no");
	%>
	<div class="image">
		<div class="text">
			<form action="board_ok.jsp" method="post" name="board">
				<input type="hidden" name="bo_no" value="bo_no">
				<input type="hidden" name="vol_userid" value="<%=vol_userid%>">
				제목 : <input type="text" name="bo_subject"><br> 
				선택 : <select name="bo_select">
					<option value="요청사항">요청사항</option>
					<option value="도움이 필요한 곳">도움이 필요한 곳</option>
					<option value="기타">기타</option> </select><br> 
				내용 : <br> <textarea rows="20" cols="100" name="bo_content"></textarea>
				<br> <input type="submit" value="글작성"> <input type="reset" value="다시작성"> 
				<input type="button" value="글목록" onclick="window.location='board_list.jsp'">
			</form>
		</div>
	</div>
</body>
</html>