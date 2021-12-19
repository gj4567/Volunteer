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
<div class="image">
	<div class="text">
		<form action="information_ok.jsp" method="post" name="information">
			<input type="hidden" name="vol_no"> 
			타이틀 : <input type="text" name="info_title"><br> 
			봉사기간 : <input type="text" name="info_date"><br> 
				봉사시간 : <input type="time" name="info_time"><br> 
				모집기간 : <input type="text" name="info_date2"><br> 
				활동요일 : <input type="text" name="info_week"><br> 
				모집인원 : <input type="text" name="info_personnel1"><br> 
				신청인원 : <input type="text" name="info_personnel2"><br> 
				봉사분야 : <input type="text" name="info_field"><br> 
				봉사자유형 : <input type="text" name="info_age"><br> 
				모집가관 : <input type="text" name="info_mozip"><br> 
				등록기관 : <input type="text" name="info_application"><br> 
				봉사장소 : <input type="text" name="info_place"><br> 
				봉사대상 : <input type="text" name="info_people"><br>
				봉사내용 :<br> <textarea rows="20" cols="100" name="info_content"></textarea><br>
				<input type="submit" value="글작성">
				<input type="reset" value="다시작성"> 
				<input type="button" value="글목록" onclick="window.location='information_list.jsp'">
		</form>
	</div>
</div>
</body>
</html>