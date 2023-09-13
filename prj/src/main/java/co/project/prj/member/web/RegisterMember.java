package co.project.prj.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.project.prj.common.Sha256;
import co.project.prj.common.ViewResolve;
import co.project.prj.member.service.MemberService;
import co.project.prj.member.service.MemberVO;
import co.project.prj.member.serviceImpl.MemberServiceImpl;


@WebServlet("/registerMember.do")
public class RegisterMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterMember() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setMemberId(request.getParameter("id"));
		vo.setMemberName(request.getParameter("name"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("password")));
		vo.setMemberTel(request.getParameter("tel"));
		int i = dao.memberInsert(vo);
		if(i != 0) {
			request.setAttribute("message", "회원가입 성공");
		}
		else {
			request.setAttribute("message", "회원가입 실패");
		}
		
		String page = "member/memberlogin.jsp";
		ViewResolve.forward(request, response, page);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
