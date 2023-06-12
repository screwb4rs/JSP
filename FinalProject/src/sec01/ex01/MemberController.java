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
import javax.servlet.http.HttpSession;

import sec01.ex01.MemberVO;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	MemberDAO memberDAO;
	
	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		// url에서 요청명을 가져옴
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		// 최초요청이거나 action값이 /homePage.do면 회원목록 출력
		if(action.equals("/homePage.do") || action == null) {
			nextPage = "../HomePage/HomePage.jsp";
		}
		// action값이 /addMember.do면 전송된 회원정보를 가져와서 테이블에 추가
		else if (action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(memberVO);
			request.setAttribute("msg", "addMember");
			nextPage = "../HomePage/HomePage.jsp";
		}
		// 멤버리스트 보기
		else if(action.equals("/members.do")){
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "../movieMember/members.jsp";
		}
		else if(action.equals("/delMember.do")){
			String id = request.getParameter("id");
			memberDAO.delMember(id);
			request.setAttribute("msg", "deleted");
			nextPage="../HomePage/HomePage.jsp";
		}
		else if(action.equals("/login.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			int check = memberDAO.loginCheck(id, pwd);
			
			if(check == -1) {
				request.setAttribute("msg", "idfalse");
				nextPage="../movieMember/loginForm.jsp";
			}
			else if(check == 0) {
				request.setAttribute("msg", "pwdfalse");
				nextPage="../movieMember/loginForm.jsp";
			}
			else{
				request.setAttribute("msg", "login");
				session.setAttribute("sessionID", id);
				nextPage="../movieMember/login.jsp";
			}
		}
		else {
			nextPage = "../HomePage/HomePage.jsp";
		}
		// nextPage에 지정한 요청명으로 다시 서블릿에 요청
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
