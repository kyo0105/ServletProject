package domino.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domino.dto.EmpDTO;
import domino.dto.NoticeDTO;
import domino.service.NoticeWriteService;

public class NoticeWriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equals("GET")) {
			
			HttpSession session = request.getSession();
			EmpDTO dto = (EmpDTO) session.getAttribute("emp"); 
			
			if (dto != null)	return "notice/newsWrite";	// 관리자일 경우
			else				return "404";
			
		} else if (request.getMethod().equals("POST")) {
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			String emp_id = request.getParameter("emp_id");

			NoticeDTO dto = new NoticeDTO();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setType(type);
			dto.setEmp_id(emp_id);

			NoticeWriteService writeService = NoticeWriteService.getInstance();
			
			try {
				int rowCount = writeService.write(dto);
				
				if (rowCount == 1) {
					String location = "newsList.do?type=" + type;
					response.sendRedirect(location);
				} else {
					return "notice/newsWrite";
				}
				
			} catch (RuntimeException e) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
				writer.close();
			}
			
		}
		
		return null;
	}

}
