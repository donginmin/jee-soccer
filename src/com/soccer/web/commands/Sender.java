package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sender {
	public static void forward(HttpServletRequest request, HttpServletResponse response) {
		try {

			request.getRequestDispatcher(Receiver.cmd.getView()).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void redirect(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect("");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
