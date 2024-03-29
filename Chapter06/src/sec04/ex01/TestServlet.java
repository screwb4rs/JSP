package sec04.ex01;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet4
 */
@WebServlet("/LoginTest")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메소드 호출");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메소드 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pw);
		
		if(id == null || (id.length() == 0) || pw == null || (pw.length() == 0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("아이디와 비밀번호를 확인하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8090/Chapter06/test01/logintest.html'> 로그인 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		else {
			out.print("<html>");
			out.print("<body>");
			out.print(id + " 님!! 로그인 하셨습니다.");
			out.print("</body>");
			out.print("</html>");
		}
		
	}
	
	public void destroy() {
		System.out.println("destroy 메소드 호출");
	}
}
