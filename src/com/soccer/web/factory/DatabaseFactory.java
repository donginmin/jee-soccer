package com.soccer.web.factory;

import com.soccer.web.enums.DB;

public class DatabaseFactory  {
	public static Database createDatabase(String vender) {
		Database db = null;
		switch (DB.valueOf(vender)) {
			case ORACLE: db = new Oracle();break;
			
			
		}
		return db;
	}

}
