package sec04.ex01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class InitParamServlet
 */
public class InitParamServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String email = getInitParameter("email");
		String tel = getInitParameter("tel");
		
		out.print("<html><body>");
		out.print("<table><tr>");
		out.print("<td>email : </td><td>" + email + "</td></tr>");
		out.print("<tr><td>휴대전화 : </td><td>" + tel + "</td>");
		out.print("</tr></table></body></html>");
	}

}
