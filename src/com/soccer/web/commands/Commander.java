package com.soccer.web.commands;

import com.soccer.web.enums.*;
import javax.servlet.http.HttpServletRequest;

public class Commander {
	public static Command direct(HttpServletRequest request) {
		Command cmd = null;

		switch(Action.valueOf(request.getParameter("action").toUpperCase())) {
		case LOGIN : 
			cmd = new LoginCommnad(request);
			break;
		case MOVE :
			cmd = new MoveCommand(request);
			break;
		}
		return cmd;
	}

}
