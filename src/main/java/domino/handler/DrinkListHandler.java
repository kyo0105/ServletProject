package domino.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.DrinkListDTO;
import domino.service.DrinkListSerivce;

public class DrinkListHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DrinkListSerivce drinkListSerivce = DrinkListSerivce.getInstance();
	    List<DrinkListDTO> drinklist = drinkListSerivce.selectDrinkList();
	      
	    request.setAttribute("drinklist", drinklist);

	    return "/menuPage/drinkList";
	}

}
