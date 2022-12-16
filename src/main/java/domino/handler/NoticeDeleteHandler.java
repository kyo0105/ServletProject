package domino.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domino.dto.EmpDTO;
import domino.service.NoticeDeleteService;


public class NoticeDeleteHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		EmpDTO dto = (EmpDTO) session.getAttribute("emp");
		
		if (dto != null) {
			int notice_code = Integer.parseInt(request.getParameter("notice_code"));

			NoticeDeleteService noticeDeleteService = NoticeDeleteService.getInstance();
			try {
				int rowCount = noticeDeleteService.delete(notice_code);
				String type = request.getParameter("type");
				
				if (rowCount == 1) {
					String location = "newsList.do?type=" + type;
					response.sendRedirect(location);
				}
				
			} catch (RuntimeException e) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
				writer.close();
			}

		} else {
			return "404";
		}
		
		return null;
	}
}

