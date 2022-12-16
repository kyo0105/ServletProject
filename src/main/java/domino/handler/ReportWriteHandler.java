package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.ReportDTO;
import domino.service.ReportWriteService;


public class ReportWriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equals("GET")){
			//포워드
			return "faq/reportWrite";

		}else if (request.getMethod().equals("POST")) {

			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String category = request.getParameter("category");
			String shop_loc = request.getParameter("shop_loc");
			String shop_name = request.getParameter("shop_name");
			String content = request.getParameter("content");
			String member_id = request.getParameter("member_id");

			System.out.println(name);
			System.out.println(tel);
			System.out.println(email);
			System.out.println(category);
			System.out.println(shop_loc);
			System.out.println(shop_name);
			System.out.println(content);
			System.out.println(member_id);

			ReportDTO dto = new ReportDTO();

			dto.setName(name);
			dto.setTel(tel);
			dto.setEmail(email);
			dto.setCategory(category);
			dto.setShop_loc(shop_loc);
			dto.setShop_name(shop_name);
			dto.setContent(content);
			dto.setMember_id(member_id);


			ReportWriteService reportwriteService = ReportWriteService.getInstance();

			int rowCount = reportwriteService.write(dto);

			if (rowCount == 1 ) {
				 String location = "newsList.do?type=N";
				response.sendRedirect(location);

			}

		}
		return null;

	}
}
