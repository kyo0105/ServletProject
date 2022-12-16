package domino.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.dto.PizzaListDTO;
import domino.service.PizzaListService;

public class PizzaListHandler implements CommandHandler{

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pizza_name = request.getParameter("pizza_name");
		System.out.println(pizza_name);
		PizzaListService pizzaListSerivce = PizzaListService.getInstance();
	    List<PizzaListDTO> list = pizzaListSerivce.selectPizzaList();
	      
	    request.setAttribute("list", list);

	    return "menuPage/pizzaList";
	}

}
