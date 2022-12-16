package domino.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import domino.dto.ToppListDTO;

import domino.service.ToppListService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



public class ToppListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String topp_type = request.getParameter("topp_type");
		System.out.println(topp_type);
		ToppListService toppListService = ToppListService.getInstance();

	    List<ToppListDTO> toppList = toppListService.selectToppList(topp_type);
	    JSONArray jArray = new JSONArray();

	    for (int i = 0; i < toppList.size(); i++) {
	        JSONObject data= new JSONObject();
	        data.put("topp_name", toppList.get(i).getTopp_name());
	        data.put("topp_price", toppList.get(i).getTopp_price());
	        data.put("topp_img", toppList.get(i).getTopp_img());
	        jArray.add(i, data);;
	    }	
	    System.out.println(jArray);

	   response.setCharacterEncoding("UTF-8");
	   PrintWriter out = response.getWriter();
	   out.print(jArray);
	   return null;
	}
}
