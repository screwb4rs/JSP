package sec01.ex01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// getParameter()메서드를 이용하여 전송된 회원 정보를 가져온다.
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		// hidden 태그로 전송된 값을 가져온다.
		String user_address = request.getParameter("user_address");
		String user_email = request.getParameter("user_email");
		String user_hp = request.getParameter("user_hp");
		
		String data="안녕하세요!<br> 로그인하셨습니다.<br><br>";
		data += "<html><body>";
		data += "아이디 : " + user_id;
		data += "<br>";
		data += "비밀번호 : " + user_pw;
		data += "<br>";
		data += "주소 : " + user_address;
		data += "<br>";
		data += "email : " + user_email;
		data += "<br>";
		data += "휴대전화 : " + user_hp;
		data += "</body></html>";
		out.print(data);
	}
}
