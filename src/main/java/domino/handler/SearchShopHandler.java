package domino.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import domino.dto.ShopDTO;
import domino.service.SearchShopService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class SearchShopHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String shopName = request.getParameter("shop_name"); 
		System.out.println(shopName);
		SearchShopService ssService = SearchShopService.getInstance();
		List<ShopDTO> searchlist = ssService.searchShop(shopName);
	      
	    
		JSONArray jArray = new JSONArray();

        for (int i = 0; i < searchlist.size(); i++) {
            JSONObject data= new JSONObject();

            data.put("shop_name", searchlist.get(i).getShop_name());
            data.put("shop_addr", searchlist.get(i).getShop_addr());
            data.put("shop_detail_addr", searchlist.get(i).getShop_detail_addr());
            data.put("shop_sale", searchlist.get(i).getSpecial_sale());
            data.put("shop_tel", searchlist.get(i).getShop_tel());
            data.put("shop_parking", searchlist.get(i).getShop_parking());
            data.put("shop_etc", searchlist.get(i).getShop_etc());
            
            jArray.add(i, data);
        }
        System.out.println(jArray);

       response.setCharacterEncoding("UTF-8");
       PrintWriter out = response.getWriter();
       out.print(jArray);
      

	
		return null;
	}

}
