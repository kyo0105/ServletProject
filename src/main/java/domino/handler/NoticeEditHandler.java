package domino.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domino.dto.EmpDTO;
import domino.dto.NoticeDTO;
import domino.service.NoticeEditContService;
import domino.service.NoticeEditService;


public class NoticeEditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equals("GET")) {
			
			HttpSession session = request.getSession();
			EmpDTO empDto = (EmpDTO) session.getAttribute("emp");
			
			if (empDto != null) {	// 관리자가 접근하는지 확인
				int notice_code = Integer.parseInt(request.getParameter("notice_code"));
				NoticeEditContService noticeEditContService = NoticeEditContService.getInstance();
				
				try {
					NoticeDTO dto = noticeEditContService.selectOne(notice_code);					
					request.setAttribute("dto", dto);
					
					return "notice/newsEdit";
					
				} catch (RuntimeException e) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter writer = response.getWriter();
					writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
					writer.close();
				}
				
			} else {
				
				return "404";
				
			}
			
		} else if(request.getMethod().equals("POST")) {
			
			int notice_code = Integer.parseInt(request.getParameter("notice_code"));
			String emp_id = request.getParameter("emp_id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			String type = request.getParameter("type");
			String seq = request.getParameter("seq");
			String currentPage = request.getParameter("currentPage");
			String searchCondition = request.getParameter("searchCondition");
			String searchWord = request.getParameter("searchWord");
			String totalRecords = request.getParameter("totalRecords");

			NoticeDTO dto = new NoticeDTO();
			dto.setNotice_code(notice_code);
			dto.setEmp_id(emp_id);
			dto.setTitle(title);
			dto.setContent(content);

			NoticeEditService noticeEditService = NoticeEditService.getInstance();
			
			try {
				int rowCount = noticeEditService.update(dto);	// 게시글 수정
				
				if (rowCount == 1) {
					String location = "newsView.do?notice_code="+notice_code + "&type="+type + "&seq="+seq + "&currentPage="+currentPage + 
									  "&searchCondition="+searchCondition + "&searchWord="+searchWord + "&totalRecords="+totalRecords;
					response.sendRedirect(location);
				} else {
					return "notice/newsEdit";
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
