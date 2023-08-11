package com.Db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;

public class DbConnection {

	private static Connection con;

	public static Connection getConnection() throws ServletException, IOException {

		try {
			if (con == null) {

				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/enotes";
				con = DriverManager.getConnection(url, "root", "");

			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return con;

	}

}
