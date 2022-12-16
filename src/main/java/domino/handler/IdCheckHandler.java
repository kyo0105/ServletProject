package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.service.IdCheckService;
import net.sf.json.JSONObject;

public class IdCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");

		IdCheckService checkService = IdCheckService.getInstance();
		JSONObject data = checkService.idCheck(id);
		request.setAttribute("data", data);

		return "ajax/idChkAjax";
	}

}
