package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 로그아웃(세션 종료)
		HttpSession session = request.getSession();	
		session.invalidate();
	
		String location = "/domino/pages/main.jsp";
		response.sendRedirect(location);
		
		return null;
	}
	
}
