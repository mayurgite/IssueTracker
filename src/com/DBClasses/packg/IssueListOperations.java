package com.DBClasses.packg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IssueListOperations {

	private static final String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521/XE";
	private static final String DB_USER = "system";
	private static final String DB_PASSWORD = "system";
	Connection con = null;
	 
	public static void main(String[] args) {
		// String userName = request.getParameter("userName");
		// String sampleValue = request.getParameter("password");
		//DBConTest conTest = new DBConTest();
		//conTest.executeQuery("Mayur","Gite","select");
	}

	public boolean executeMyQuery(String username, String pass,String operation) {
		System.out.println("In executeQuery()");
		boolean result = false;
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			if (con != null){
				if(operation.equalsIgnoreCase("select")){
					Statement st = con.createStatement();
					System.out.println("Executing SQL");
					ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE UNAME='"+username+"'"
							+ " AND PASSWORD='"+pass+"'");

				    if (rs != null) {
						result = true;
				    }
				    
				}else if(operation.equalsIgnoreCase("insert")){
					Statement st = con.createStatement();
	
					int rs = st.executeUpdate("INSERT INTO USERS"
							+" (id,uname,password,status)"
							+ " VALUES(user_sequence.nextval,'"+username+"','"+pass+"','"+"Active"+"')");
	
					if (rs > 0) {
						result = true;
				    }
				}
		   }
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}


}
