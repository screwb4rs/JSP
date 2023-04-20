package sec04.ex01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login2")
public class LoginTest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 전송 시 인코딩 작업 생략 - Filter로 처리.
		//request.setCharacterEncoding("utf-8");
		//response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		// getParameter()메서드를 이용하여 전송된 회원 정보를 가져온다.
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		// 이벤트 핸들러를 생성한 후 세션에 저장.
		LoginImpl loginUser = new LoginImpl(user_id, user_pw);
		if(session.isNew()) {
			// 세션에 바인딩 시 미리 HttpSessionBindingListener를 구현
			// LoginImpl의 valueBound() 메서드 호출.
			session.setAttribute("loginUser", loginUser);
		}
		
		out.println("<head>");
		out.println("<script type = 'text/javascipt'>");
		// 자바스크립트의 setTimeout() 함수로 5초마다 서블릿에 재요청하여 접속자수 표시.
		out.println("setTimeout('history.go(0);', 5000)");
		out.println("</script>");
		out.println("</head>");
		out.println("<html><body>");
		out.println("아이디는 " + loginUser.user_id +"<br>");
		out.println("총 접속자수는"+LoginImpl.total_user +"<br>");
		out.println("</body></html>");
	}
}
