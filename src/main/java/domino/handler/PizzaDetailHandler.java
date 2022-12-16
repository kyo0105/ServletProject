package domino.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domino.dto.DowListDTO;
import domino.dto.DrinkListDTO;
import domino.dto.PizzaListDTO;
import domino.dto.SideDishListDTO;
import domino.dto.ToppListDTO;
import domino.service.DowListService;
import domino.service.DrinkListSerivce;
import domino.service.PizzaDetailService;
import domino.service.SideDishListService;
import domino.service.ToppListService;


public class PizzaDetailHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if ( request.getMethod().equals("GET") ) {		

			String pizza_name = request.getParameter("pizza_name");
			String topp_type = request.getParameter("topp_type");

			PizzaDetailService pizzaDetailService = PizzaDetailService.getInstance();
			DowListService dowListService = DowListService.getInstance();
			DrinkListSerivce drinkListService = DrinkListSerivce.getInstance();
			ToppListService toppListService = ToppListService.getInstance();
			SideDishListService sideDishListService = SideDishListService.getInstance();
			
		    PizzaListDTO pizzaList = pizzaDetailService.selectPizzaDetail(pizza_name);
		    List<DowListDTO> dowList = dowListService.selectDowList();
		    List<DrinkListDTO> drinkList = drinkListService.selectDrinkList();
		    List<ToppListDTO> toppList = toppListService.selectToppList(topp_type);
		    List<SideDishListDTO> sideList = sideDishListService.selectSideDishList();
		      
		    request.setAttribute("pizzaList", pizzaList);
		    request.setAttribute("dowList", dowList);
		    request.setAttribute("drinkList", drinkList);
		    request.setAttribute("toppList", toppList);
		    request.setAttribute("sideList", sideList);


		} else if ( request.getMethod().equals("POST") ) {
			HttpSession session = request.getSession();
			Object member_id =  session.getAttribute("member");
			System.out.println(member_id);			
			/*
			 * if (member_id != null) { // 로그인 상태 response.getWriter().write("success"); }
			 * else { // 비로그인 상태 response.getWriter().write("fail"); }
			 * 
			 */
		}
		return "/orderPage/pizzaDetail";
	}
}
