package domino.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.service.InquiryEmpService;

public class InquiryEmpHandler implements CommandHandler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      int iq_code = Integer.parseInt(request.getParameter("iq_code"));
      String emp_id = request.getParameter("emp_id");
      
      InquiryEmpService inquiryEmpService = InquiryEmpService.getInstance();
      
      int rowCount = inquiryEmpService.update(iq_code, emp_id);
      if (rowCount == 1 ) {
         String location = "questionList.do?member_id=admin";
         response.sendRedirect(location);
      } 

      return null;
   }
   

}