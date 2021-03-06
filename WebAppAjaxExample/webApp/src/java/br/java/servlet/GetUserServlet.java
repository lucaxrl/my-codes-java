/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mauri
 */
@WebServlet(name = "GetUserServlet", urlPatterns = {"/GetUserServlet"})
public class GetUserServlet extends HttpServlet {

   private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("userName").trim();
		if(userName == null || "".equals(userName)){
			userName = "Guest";
		}
		
		String greetings = "Hello " + userName;
		
		response.setContentType("text/plain");
		response.getWriter().write(greetings);
	}

}
