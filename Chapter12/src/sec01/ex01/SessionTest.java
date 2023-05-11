package sec01.ex01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/sess")
public class SessionTest extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		// 세션객체 가져오기
		HttpSession session = request.getSession();
		// 세션객체에 name 바인딩
		session.setAttribute("name", "이순신");
		
		pw.println("<html><body>");
		pw.println("<h1>세션에 이름을 바인딩합니다.<h2>");
		pw.println("<a href='/Chapter12/session/session1.jsp'>두 번째 페이지로 이동하기</a>");
		pw.println("</body></html>");
	}

}
