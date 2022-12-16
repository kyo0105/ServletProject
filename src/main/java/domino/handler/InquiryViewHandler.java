package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.InquiryDTO;
import domino.service.InquiryViewService;

public class InquiryViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int iq_code = Integer.parseInt(request.getParameter("iq_code"));
		
		InquiryViewService inquiryViewService = InquiryViewService.getInstance();
		
		InquiryDTO dto = inquiryViewService.select(iq_code);
		request.setAttribute("dto", dto);
		
		return "myInfo/questionView";
	}

}
