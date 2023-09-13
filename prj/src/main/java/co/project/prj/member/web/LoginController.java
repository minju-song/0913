package co.project.prj.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.project.prj.common.Sha256;
import co.project.prj.common.ViewResolve;
import co.project.prj.member.service.MemberService;
import co.project.prj.member.service.MemberVO;
import co.project.prj.member.serviceImpl.MemberServiceImpl;


@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("memberPassword")));
		
		vo = dao.memberSelect(vo);
		String page = null;
		
		if(vo != null) {
			session.setAttribute("id", vo.getMemberId());
			session.setAttribute("author", vo.getMemberAuthor());
			if(vo.getMemberAuthor().equals("ADMIN")) {
				page = "adminhome.do";
			}
			else {
				page = "home.do";
			}
			
			response.sendRedirect(page);
		}
		else {
			request.setAttribute("message", "아이디 또는 패스워드 틀림");
			String path = "member/membermessage.jsp";
			ViewResolve.forward(request, response, page);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
