package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegStepHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if ( request.getMethod().equals("GET") ) {
			
			return "member/regStep1";
			
		} else if ( request.getMethod().equals("POST") ) {
			
			return "member/regStep2";
		}
		
		return null;
	}

}
