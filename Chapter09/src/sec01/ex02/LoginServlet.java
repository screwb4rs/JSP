package sec01.ex02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

@WebServlet("/Login2")
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
		data += "아이디 : " + user_id + "<br>";
		data += "비밀번호 : " + user_pw + "<br>";
		data += "주소 : " + user_address + "<br>";
		data += "email : " + user_email + "<br>";
		data += "휴대전화 : " + user_hp;
		data += "</body></html>";
		out.print(data);
		
		// GET방식으로 한글 전송하기 위해 인코딩.
		user_address = URLEncoder.encode(user_address, "utf-8");
		
		// 아이디, 비밀번호, 주소 정보를 가지고 두번째 서블릿으로 이동
		out.print("<a href='/Chapter09/Second?user_id=" + user_id
				+ "&user_pw=" + user_pw
				+ "&user_address=" + user_address
				+ "'><br><br>두 번째 서블릿으로 보내기</a>");
		data = "</body></html>";
		out.print(data);
	}
}
