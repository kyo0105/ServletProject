<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
	JSONObject data = (JSONObject)request.getAttribute("data");
%>
<%= data %>