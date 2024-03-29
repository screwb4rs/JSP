package sec03.ex01;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class SetServletContext
 */
@WebServlet("/cset")
public class SetServletContext extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		
		List member = new ArrayList();
		member.add("이순신");
		member.add(30);
		
		context.setAttribute("member", member);
		
		out.println("<html><body>");
		out.println("이순신 30");
		out.println("</body></html>");
	}

}
