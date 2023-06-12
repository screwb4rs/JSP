<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  

<%
	request.setCharacterEncoding("UTF-8");
%>
  
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>영화리스트</title>
		<style>
			    .cls1 {
			      font-size:40px;
			      text-align:center;
			    }
			   
			    .cls2 {
			      font-size:20px;
			      text-align:center;
			    }
			</style>
	   	<link rel="stylesheet" href="../css/layout.css">
	</head>
	<body>
		<form method="post" action="${contextPath }/movie/movies.do">
	   <div>
		   <header>
		   		<hgroup>
		   			<h1>KGV</h1>
		   		</hgroup>
		   </header>
		   
		   <nav>
				<ul>
				   	<li><a href="../movie/movies.jsp">영화</a></li>
					<li><a href="#">극장</a></li>
					<li><a href="#">예매</a></li>
					<%
						if(session == null || !request.isRequestedSessionIdValid()){
					%>
					<li><a href="../movieMember/loginForm.jsp">로그인</a></li>
					<li><a href="../movieMember/newMemberForm.jsp">회원가입</a></li>
					<%
						}
						else{
					%>
					<li><a href="../movieMember/logout.jsp">로그아웃</a></li>
					<%
						}
					%>
					<li><a href="${contextPath}/member/members.do">회원정보</a>
		 		</ul>
		   </nav>
		   
		   <section>
		   		<table align="center" border="1" >
			   		<article>
						<tr align="center" bgcolor="lightgreen">
							<td width="7%" ><b>번호</b></td>
							<td width="7%" ><b>제목</b></td>
							<td width="7%" ><b>내용</b></td>
							<td width="7%" ><b>작성자</b></td>
			       		</tr>
			   		</article>
			   		<article>
			   			<c:choose>
			   				<c:when test="${empty movieList}">
			   					<tr>
			   						<td colspan=5>
			   							<b>등록된 영화가 없습니다.</b>
			   						</td>
			   					</tr>
			   				</c:when>
			   				<c:when test="${!empty movieList}">
				   				<c:forEach  var="mov" items="${movieList }" >
									<tr align="center">
										<td>${mov.movie_num }</td>
										<td>${mov.movie_name }</td>
										<td>${mov.movie_content}</td>
										<td>${mov.member_id }</td>
									</tr>
								</c:forEach>
			   				</c:when>
			   			</c:choose>
			   		</article>
			   	</table>
		   </section>
		   
		   <aside>
		   <%
		 		if(session.getAttribute("sessionID") != null){
		   %>
		   		<h2 align="center">반갑습니다.<%= session.getAttribute("sessionID") %>님</h2>
			<%
		 		}
			%>
		   </aside>
		   
		   <footer>
		   </footer>
	   </div>
	   </form>
	</body>	
</html>