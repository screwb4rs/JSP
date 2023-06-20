<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "java.util.*, sec01.ex01.*"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />  

<%
	request.setCharacterEncoding("UTF-8");
%>
  
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>영화리스트</title>
		<link rel="stylesheet" href="../css/layout.css">
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
		<script type="text/javascript">
			function addmovie(){
	   			location.href="../movie/addmovieForm.jsp";
			}
		</script>
	</head>
	<body>
		<form method="post" action="${contextPath }/member/movie.do">
	   <div>
		   <header>
		   		<hgroup>
		   			<h1>KGV</h1>
		   		</hgroup>
		   </header>
		   
		   <nav>
				<jsp:include page="../include/menu.jsp"/>
		   </nav>
		   
		   <section>
		   		<%
				if(session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")){
				%>
			   	<input type="button" value="추가" onclick="addmovie()">
			   	<%
				}
			   	%>
		   		<table align="center" border="1" >
			   		<article>
						<tr align="center" bgcolor="lightgreen">
							<td width="7%" ><b>번호</b></td>
							<td width="7%" ><b>제목</b></td>
							<%
							if(session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")){
							%>
							<td width="7%" ><b>삭제</b></td>
							<%
							}
							%>
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
										<td><a href="${contextPath}/member/viewmovie.do?movie_num=${mov.movie_num }">${mov.movie_name }</a></td>
										<%
										if(session.getAttribute("sessionID") != null && session.getAttribute("sessionID").equals("admin")){
										%>
										<td><a href="${contextPath}/member/delmovie.do?movie_num=${mov.movie_num }">삭제</a></td> 
										<%
										}
										%>
									</tr>
								</c:forEach>
			   				</c:when>
			   			</c:choose>
			   		</article>
			   	</table>
			   	<div align="center">
			   		<form>
			   			<select name="option">
			   				<option value="0">제목</option>
			   				<option value="1">내용</option>
			   				<option value="2">작성자</option>
			   			</select>
			   			<input type="text" size="20" name="condition"/>&nbsp;
			   			<input type="submit" value="검색"/>
			   		</form>
			   	</div>
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