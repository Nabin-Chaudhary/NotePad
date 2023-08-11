package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Content;

public class ContentDao {

	private Connection con;

	public ContentDao(Connection con) {
		super();
		this.con = con;
	}
	
	boolean f;
	public boolean addContent(String ti, String co, int ui) {
		f = false;
		try {
			
		String query = "insert into post(Title,Content,U_ID) values(?,?,?)";
		PreparedStatement pst = con.prepareStatement(query);
	    pst.setString(1, ti);
	    pst.setString(2, co);
	    pst.setInt(3, ui);
	    int result = pst.executeUpdate();
	    if(result==1) {
	    	f = true;
	    }
	    
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Content> getData(int id){
		List<Content> list = new ArrayList<Content>();
		Content co;
		
		try {
			String query = "select * from post where U_ID=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			
			ResultSet result = pst.executeQuery();
			
			
			while(result.next()) {
				co = new Content();
				co.setId(result.getInt(1));
				co.setTitle(result.getString(2));
				co.setContent(result.getString(3));
				co.setPdate(result.getDate(4));
				list.add(co);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Content getDataById(int noteId) {
		Content co=null;
		try {
			String query = "select * from post where ID=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, noteId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				co = new Content();
				co.setId(rs.getInt(1));
				co.setTitle(rs.getString(2));
				co.setContent(rs.getString(3));
				co.setPdate(rs.getDate(4));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return co;
	}
	
	public boolean updateContent(String ti,String co, int noteId) {
		boolean f = false;
		Content c1;
		try {
			String query = "update post set Title=?, Content=?, Date=Now() where ID=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, ti);
			pst.setString(2,co);
			pst.setInt(3, noteId);
			
			
			int result = pst.executeUpdate();
			if(result==1) {
				f = true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}
