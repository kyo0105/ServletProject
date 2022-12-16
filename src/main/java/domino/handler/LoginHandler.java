package domino.handler;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domino.dto.EmpDTO;
import domino.dto.MemberDTO;
import domino.service.LoginService;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equals("GET")) {
			
			return "global/login";
			
		} else if (request.getMethod().equals("POST")) {
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String cid = request.getParameter("cid");	// 아이디 쿠키값 저장 여부

			LoginService loginService = LoginService.getInstance();
			
			try {
				MemberDTO member = loginService.loginM(id, passwd);
				EmpDTO emp = loginService.loginE(id, passwd);
				
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				session.setAttribute("emp", emp);
				
				// 아이디 쿠키값 저장 또는 삭제
				if (cid.equals("y")) {
					Cookie cookie = new Cookie("id", id);
					cookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(cookie);
				} else {
					Cookie cookie = new Cookie("id", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
				// ajax 로그인 결과
				if (member != null || emp != null)	response.getWriter().write("success");
				else								response.getWriter().write("fail");		
				
			} catch (RuntimeException e) {
				response.getWriter().write("exception");
			}
				
		}
		
		return null;
	}

}
