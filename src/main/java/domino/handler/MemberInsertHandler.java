package domino.handler;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.AgreeDTO;
import domino.dto.MemberDTO;
import domino.service.MemberInsertService;

public class MemberInsertHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("confirmpw");
		int birth_type = Integer.parseInt( request.getParameter("birth_fl") ); // 1:양력, 0:음력
		Date birth = Date.valueOf( request.getParameter("birth") );
		String tel= request.getParameter("tel"); 
		String email = request.getParameter("email"); 
		String gender = request.getParameter("sex"); 
		int info_date = Integer.parseInt( request.getParameter("info_years") ); // 개인정보 유효기간
		
		MemberDTO mdto = new MemberDTO();
		
		mdto.setMember_id(member_id);
		mdto.setName(name);
		mdto.setPw(pw);
		mdto.setBirth_type(birth_type);
		mdto.setBirth(birth);
		mdto.setTel(tel);
		mdto.setEmail(email);
		mdto.setGender(gender);
		mdto.setInfo_date(info_date);
		
		int message = Integer.parseInt( request.getParameter("ds_fl") );	// 문자
		int aEmail = Integer.parseInt( request.getParameter("dm_fl") );		// 이메일
		int mail = Integer.parseInt( request.getParameter("o_dm_fl") );		// 우편
		
		AgreeDTO adto = new AgreeDTO();
		
		adto.setMember_id(member_id);
		adto.setMessage(message);
		adto.setEmail(aEmail);
		adto.setMail(mail);
		
		MemberInsertService insertService = MemberInsertService.getInstance();
		try {
			insertService.memberInsert(mdto, adto); 			
		} catch (RuntimeException e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>");
			writer.close();
		}

		return "member/regStep2Proc";
	}

}
