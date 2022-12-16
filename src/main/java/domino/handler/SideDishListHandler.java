package domino.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.SideDishListDTO;
import domino.service.SideDishListService;

public class SideDishListHandler implements CommandHandler{

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SideDishListService sideDishListSerivce = SideDishListService.getInstance();
	    List<SideDishListDTO> sidelist = sideDishListSerivce.selectSideDishList();
	      
	    request.setAttribute("sidelist", sidelist);

	    return "/menuPage/sidedishList";
	}

}
