<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../mystyle.css"
	href="../join.css" />
<script>
	function search_id(mem_id) {
		if (mem_id == "") {
			alert("중복 체크할 아이디를 입력하세요!");
			join.mem_id.focus();
			return false;
		}
		url = 'idcheck_ok.jsp?mem_id=' + mem_id;
		window.open(url, '_blank', 'width=400,height=400,left=0,top=0');
	}
	function search_addr() {
		window.open('jusoPopup.jsp', '_blank',
				'width=570,height=420,left=0,top=0');
	}
	function jusoCallBack(mem_zipcode, mem_addr1, mem_addr2) {
		join.mem_zipcode.value = mem_zipcode;
		join.mem_addr1.value = mem_addr1;
		join.mem_addr2.value = mem_addr2;
	}
	function check() {
		if (!join.mem_id.value) {
			alert("아이디를 입력하세요");
			join.mem_id.focus();
			return false;
		}
		if (!join.mem_passwd.value) {
			alert("비밀번호를 입력하세요");
			join.mem_passwd.focus();
			return false;
		}
		if (!join.mem_passwd2.value) {
			alert("비밀번호를 확인하세요");
			join.mem_passwd2.focus();
			return false;
		}
		if (join.mem_passwd.value != join.mem_passwd2.value) {
			alert("패스워드가 같지 않습니다")
			return false;
		}
		if (!join.mem_name.value) {
			alert("이름을 입력하세요");
			join.mem_name.focus();
			return false;
		}
		if (!join.mem_ssn.value) {
			alert("생년월일을 입력하세요");
			join.mem_ssn.focus();
			return false;
		}
		if (!join.mem_phone.value) {
			alert("핸드폰번호를 입력하세요");
			join.mem_phone.focus();
			return false;
		}
		if (!join.mem_email1.value) {
			alert("이메일을 입력하세요");
			join.mem_email1.focus();
			return false;
		}
		if (!join.mem_email2.value) {
			alert("이메일을 확인하세요");
			join.mem_email2.focus();
			return false;
		}
		alert('회원가입이 완료되었습니다');
		join.submit();
	}
</script>
</head>
<body>
	<div class="image">
		<div class="text">
			<form name="join" method="post" action="join_ok.jsp">
				<div class="container">
					<div class="insert">
						<table>
							<caption>
								<h2>회원가입</h2>
							</caption>
							<tr>
								<td class="col1">*는 필수입력 항목</td>
							</tr>
							<tr>
								<td class="col1">* 아이디</td>
								<td class="col2"><input type="text" name="mem_id">
									<input class="but1" type="button" value="중복검사"
									onclick="search_id(join.mem_id.value)"></td>
							</tr>
							<tr>
								<td class="col1">* 비밀번호</td>
								<td class="col2"><input type="password" name="mem_passwd"
									size="20"></td>
							</tr>
							<tr>
								<td class="col1">* 비밀번호 확인</td>
								<td class="col2"><input type="password" name="mem_passwd2"
									size="20"></td>
							</tr>
							<tr>
								<td class="col1">* 이름</td>
								<td class="col12"><input type="text" name="mem_name"></td>
							</tr>
							<tr>
								<td class="col1">* 생년월일</td>
								<td class="col2"><input type="text" name="mem_ssn"></td>
							</tr>
							<tr>
								<td class="col1">* 핸드폰번호</td>
								<td class="col2"><input type="text" name="mem_phone"></td>
							</tr>
							<tr>
								<td class="col1">* 이메일</td>
								<td class="col2"><input type="email" name="mem_email1"
									size="20"> <span class="a">@</span> <input type="text"
									name="mem_email2" size="20"></td>
							</tr>
							<tr>
								<td class="col1">* 성별</td>
								<td class="col2"><input type="radio" name="mem_gender"
									value="남">남 <input type="radio" name="mem_gender"
									value="여">여</td>
							</tr>
							<tr>
								<td class="col1">* 우편번호</td>
								<td class="col2"><input type="text" name="mem_zipcode"
									size="5" readonly> <input class="but1" type="button"
									value="우편번호검색" onclick="search_addr()"></td>
							</tr>
							<tr>
								<td class="col1">* 주소</td>
								<td class="col2"><input type="text" name="mem_addr1"
									readonly></td>
							</tr>
							<tr>
								<td class="col1">* 상세주소</td>
								<td class="col2"><input type="text" name="mem_addr2"></td>
							</tr>
							<tr>
								<td class="col1">자기소개 및 취미와 특기</td>
								<td class="col2"><textarea cols="40" rows="5"
										name="mem_profile" placeholder="봉사활동 이력이 있으시면 입력해주세요"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="create">
						<input class="but4" type="button" value="회원가입" onclick="check(this.form)">&nbsp;&nbsp;
						<input class="but3" type="reset" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>