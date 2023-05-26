<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="member_action.jsp">
			<h1 style="text-align:center">회원 가입창</h1>
			<table align="center">
				<tr height=50>
					<td align="right">아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr height=50>
					<td align="right">비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr height=50>
					<td align="right">이름
					<td><input type="text" name="name"></td>
				</tr>
				<tr height=50>
					<td align="right">이메일
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td colspan=2 align="center" height="50">
						<input type="submit" value="가입하기">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>