package domino.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.NoticeDTO;
import domino.dto.PageBlock;
import domino.service.NoticeListService;
import domino.service.NoticePagingService;

public class NoticeListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeListService noticeListService = NoticeListService.getInstance();
		String type = request.getParameter("type"); // 도미노뉴스, 보도자료
		
		// 페이징
		String pCurrentPage = request.getParameter("currentPage");
		int currentPage = pCurrentPage == null ? 1 : Integer.parseInt(pCurrentPage);

		// 검색
		String searchCondition = request.getParameter("searchCondition") == null ? "title" : request.getParameter("searchCondition"); // title, content, all
		String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") ;	// 검색어
		List<NoticeDTO> list = null;

		// 페이징
		NoticePagingService noticePagingService = NoticePagingService.getInstance();
		PageBlock pageBlock = null;
		
		try {
			if (searchWord.equals("")) {
				list = noticeListService.select(type, currentPage, 5);
				pageBlock = noticePagingService.paging(type, currentPage, 5);
			} else {
				list = noticeListService.select(type, currentPage, 5, searchCondition, searchWord);
				pageBlock = noticePagingService.paging(type, currentPage, 5, searchCondition, searchWord);
			}
			
		} catch (RuntimeException e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
			writer.close();
			return null;
		}

		request.setAttribute("list", list);
		request.setAttribute("pageBlock", pageBlock);
		
		return "notice/newsList";
	}

}
