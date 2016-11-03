package com.naver.dlghdud740.dbpool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBpoolConnectTestMain {

	public static void main(String[] args) {
		
		DBConnectionManager db = DBConnectionManager.getInstance();
		System.out.println("DB test Start.....");
		String sql = "select count(*) from member";
		try{
			Connection cn = db.getConnection();
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){	
					System.out.println("count : "+ rs.getInt(1));
			}
		}catch (Exception e){		
			System.out.println("db error." + e.getMessage());
		}
	}
}
