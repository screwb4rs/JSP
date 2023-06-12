package sec01.ex01;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/movie.do")
public class MovieController extends HttpServlet {
	MovieDAO movieDAO;
	
	public void init(ServletConfig config) throws ServletException {
		movieDAO = new MovieDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<MovieVO> movieList = movieDAO.listmovies();
		request.setAttribute("movieList", movieList);
		RequestDispatcher dispatch = request.getRequestDispatcher("/movie/movies.jsp");
		dispatch.forward(request, response);
	}

}
