package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.service.EmailCheckService;
import net.sf.json.JSONObject;

public class EmailCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		
		EmailCheckService checkService = EmailCheckService.getInstance();
		JSONObject data = checkService.emailCheck(email);
		request.setAttribute("data", data);
		
		return "ajax/emailChkAjax";
	}

}
