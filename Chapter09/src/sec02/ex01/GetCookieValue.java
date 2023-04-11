package sec02.ex01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

@WebServlet("/Get")
public class GetCookieValue extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// getCookies() 메소드를 호출 해 브라우저에게 ㅜ키 정보를 요청한 후 쿠키 정보를 배열로 가져 옴.
		Cookie[] allValues = request.getCookies();
		
		// 배열에 저장할 때 사용한 쿠키 이름인 cookieTest로 검색해 쿠키 값을 가져 옴.
		for(int i=0; i < allValues.length; i++) {
			if(allValues[i].getName().equals("cookieTest")) {
				out.println("<h2>Cookie 값 가져오기 : "
						+URLDecoder.decode(allValues[i].getValue(), "utf-8"));
			}
		}
	}

}
