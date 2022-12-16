package domino.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domino.handler.CommandHandler;

public class DispatcherServlet extends HttpServlet{
	
	private static final long serialVersionUID = -2967054920062977563L;

	@Override
	public void destroy() { 
		
	}

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException { 
		String path = this.getInitParameter("path");
		String realPath = this.getServletContext().getRealPath(path);
		
		Properties prop = new Properties();
		try(FileReader fr = new FileReader(realPath)){
			prop.load(fr);
		} catch (Exception e) {
			throw new ServletException(e);
		}//catch
		
		Iterator<Object> ir = prop.keySet().iterator();
		while (ir.hasNext()) {
			String url = (String) ir.next();
			String commandHandlerFullName = prop.getProperty(url);
		
			try {
				Class<?> handlerClass = Class.forName(commandHandlerFullName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				this.commandHandlerMap.put(url, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		
	} //init()

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		if( requestURI.indexOf(contextPath) == 0) {
			requestURI = requestURI.substring(contextPath.length());
		}

		CommandHandler modelHandler =  this.commandHandlerMap.get(requestURI);
		String viewPage=null;
		try {
			viewPage =  modelHandler.process(request, response);
		} catch (NullPointerException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("404");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
		
		if(viewPage != null) {
			String prefix="/pages/";
			String suffix = ".jsp";
			viewPage = String.format("%s%s%s", prefix, viewPage, suffix);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
