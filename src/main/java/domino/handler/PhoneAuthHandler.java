package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.service.PhoneAuthService;
import net.sf.json.JSONObject;

public class PhoneAuthHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equals("GET")) {
			return "member/phoneAuth";

		} else if (request.getMethod().equals("POST")) {
			
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String tel = String.format("%s-%s-%s", tel1, tel2, tel3);	// 핸드폰 번호

			PhoneAuthService authService = PhoneAuthService.getInstance();
			JSONObject data = authService.memberCheck(tel);
			request.setAttribute("data", data);
			
			return "ajax/phoneAuthAjax";
		}
		
		return null;
	}

}
