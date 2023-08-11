 package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.encryption.PasswordEncryption;
import com.model.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {

		this.con = con;
	}

	public boolean addUser(User us) {
		boolean f = false;

		try {
			String query = "insert into user(Name, Email,Password) values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, PasswordEncryption.encrypt(us.getPassword(), "my-Secret-Key-is"));

			int result = pst.executeUpdate();

			if (result == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public User loginUser(User us) {
		User user = null;
		
		try {
			String query = "select * from user where Email=? and Password=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, us.getEmail());
			pst.setString(2, PasswordEncryption.encrypt(us.getPassword(), "my-Secret-Key-is"));
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("ID"));
				user.setName(rs.getString("Name"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	
	}

}
