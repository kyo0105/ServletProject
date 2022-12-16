package domino.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import domino.dto.CityDTO;
import domino.dto.ShopDTO;
import domino.service.CityService;
import domino.service.ShopService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CityHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if ( request.getMethod().equals("GET") ) {	
			String city = request.getParameter("city");
			System.out.println(city);
			CityService cService = CityService.getInstance();
			List<CityDTO> citylist = cService.selectCity(city);


			JSONArray jArray = new JSONArray();

			for (int i = 0; i < citylist.size(); i++) {
				JSONObject data= new JSONObject();
				data.put("loc_code", citylist.get(i).getLoc_code());
				data.put("city", citylist.get(i).getCity());
				data.put("district", citylist.get(i).getDistrict());

				jArray.add(i, data);
			}
			System.out.println(jArray);

			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jArray);


		} else if ( request.getMethod().equals("POST") ) {
			
			int loc_code = Integer.parseInt(request.getParameter("loc_code")); 
			System.out.println(loc_code);
			ShopService sService = ShopService.getInstance();
			List<ShopDTO> shoplist = sService.selectShop(loc_code);
		      
		    
			JSONArray jArray = new JSONArray();

	        for (int i = 0; i < shoplist.size(); i++) {
	            JSONObject data= new JSONObject();
	            data.put("loc_code", shoplist.get(i).getLoc_code());
	            data.put("shop_name", shoplist.get(i).getShop_name());
	            data.put("shop_addr", shoplist.get(i).getShop_addr());
	            data.put("shop_detail_addr", shoplist.get(i).getShop_detail_addr());
	            data.put("shop_sale", shoplist.get(i).getSpecial_sale());
	            data.put("shop_tel", shoplist.get(i).getShop_tel());
	            data.put("shop_parking", shoplist.get(i).getShop_parking());
	            data.put("shop_etc", shoplist.get(i).getShop_etc());
	            
	            jArray.add(i, data);
	        }
	        System.out.println(jArray);

	       response.setCharacterEncoding("UTF-8");
	       PrintWriter out = response.getWriter();
	       out.print(jArray);
	      

		}
		return null;

	}
}

