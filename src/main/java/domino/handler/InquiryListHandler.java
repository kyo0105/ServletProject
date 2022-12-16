package domino.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.InquiryDTO;
import domino.service.InquiryEmpListService;
import domino.service.InquiryListService;

public class InquiryListHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      InquiryListService inquiryListService = InquiryListService.getInstance();
      InquiryEmpListService inquiryEmpListService = InquiryEmpListService.getInstance();
      String member_id = request.getParameter("member_id");
      
      if (member_id.equals("admin")) {
         List<InquiryDTO> list = inquiryEmpListService.select();
         request.setAttribute("list", list); 
      } else {
         List<InquiryDTO> list = inquiryListService.select(member_id);
         request.setAttribute("list", list); 
      }
      return "myInfo/questionList";
   }

}