package com.DBClasses.packg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

enum Sample {Test};

public class DBConTest {

	private static final String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521/XE";
	private static final String DB_USER = "system";
	private static final String DB_PASSWORD = "system";
	Connection con = null;
	
	public static void main(String[] args) {
		// String userName = request.getParameter("userName");
		// String sampleValue = request.getParameter("password");
		DBConTest conTest = new DBConTest();
		conTest.executeMyQuery("Mayur","Gite","select");
	}

	public boolean executeMyQuery(String username, String pass,String operation) {
		System.out.println("In executeQuery()");
		boolean result = false;

		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			if (con != null){
				System.out.println("Got connection");
				System.out.println("operation= "+operation);
				if(operation.equalsIgnoreCase("select")){
					System.out.println("SELECT operation");
					Statement st = con.createStatement();
					System.out.println("Executing SQL");
	ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE UNAME='"+username+"' AND PASSWORD='"+pass+"'");

				    if (rs != null) {
						System.out.println("Found result");
						result = true;
				    } else {
				    	System.out.println("No result found");
				    }
			}else if(operation.equalsIgnoreCase("insert")){
				System.out.println("INSERTING in DB");
				Statement st = con.createStatement();
				System.out.println("Connection got created");
//int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
				int rs = st.executeUpdate("INSERT INTO USERS"
						+" (id,uname,password,status)"
						+ " VALUES(user_sequence.nextval,'"+username+"','"+pass+"','"+"Active"+"')");
				System.out.println("Executed query");
			    if (rs > 0) {
					System.out.println("Found result");
					result = true;
			    } else {
			    	System.out.println("No result found");
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
