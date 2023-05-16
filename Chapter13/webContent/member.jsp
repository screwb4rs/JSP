<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*, sec01.ex01.*"
    pageEncoding="UTF-8"%>
<%
	// memberForm.html에서 입력받은 값 요청해서 가져옴.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	//MemberBean에 입력받은 값 넣어서 보낸걸 m에 저장
	MemberBean m = new MemberBean(id, pwd, name, email);
	//MemberDAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	//MemberDAO에 m추가
	memberDAO.addMember(m);
	//MemberDAO에서 가져온 값을 list객체생성후 저장
	List membersList = memberDAO.listMembers();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 목록창</title>
	</head>
	<body>
		<table align="center" width="100%">
			<tr align="center" bgcolor="#99ccff">
				<td width="%7">아이디</td>
				<td width="%7">비밀번호</td>
				<td width="%5">이름</td>
				<td width="%11">이메일</td>
				<td width="%5">가입일</td>
			</tr>
			<%
				if(membersList.size() == 0){
			%>
					<tr>
						<td colspan="5">
							<p align="center">
								<b>등록된 회원이 없습니다.</b>
							</p>
						</td>
					</tr>
			<%
				} else {
					for(int i=0; i<membersList.size(); i++){
						MemberBean bean = (MemberBean) membersList.get(i);
			%>
						<tr align="center">
							<td><%= bean.getId() %></td>
							<td><%= bean.getPwd() %></td>
							<td><%= bean.getName() %></td>
							<td><%= bean.getEmail() %></td>
							<td><%= bean.getJoinDate() %></td>
						</tr>
			<%
					}	// end for
				}	//end if
			%>
			<tr height="1" bgcolor="#99ccff">
				<td colspan="5"></td>
			</tr>
		</table>
	</body>
</html>