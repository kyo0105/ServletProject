package domino.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.NoticeDTO;
import domino.service.NoticeViewService;

public class NoticeViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String type = request.getParameter("type");	// 도미노뉴스, 보도자료
		int seq = Integer.parseInt(request.getParameter("seq"));		
		int totalRecords = Integer.parseInt(request.getParameter("totalRecords"));	// 총게시글수
		int notice_code = Integer.parseInt(request.getParameter("notice_code"));	
		
		int currentPage = (totalRecords - seq) / 5 + 1;
		
		String searchCondition = request.getParameter("searchCondition"); // title, content, all
		String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") ;	// 검색어
		
		NoticeViewService noticeViewService = NoticeViewService.getInstance();
		
		List<NoticeDTO> list = null;
		
		try {
			if (searchWord.equals("")) {
				list = noticeViewService.select(type, notice_code);
			}
			else {
				list = noticeViewService.select(type, notice_code, searchCondition, searchWord);
			}
			
		} catch (RuntimeException e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
			writer.close();
			return null;
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("list", list);
		
		return "notice/newsView";
	}

}
