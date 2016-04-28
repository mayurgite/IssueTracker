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

	public ResultSet executeMyQuery(String id, String operation,String issueName, String issueDesc, String status) {
		System.out.println("In executeQuery()");
		boolean result = false;
		ResultSet rs = null;
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			if (con != null){
				if(operation.equalsIgnoreCase("select")){
					Statement st = con.createStatement();
					System.out.println("Executing SQL");
					rs = st.executeQuery("SELECT id,issueName,issueDesc FROM ISSUETRACKER WHERE USERID='"+id+"'");

				    if (rs != null) {
						result = true;
				    }
				    
				}else if(operation.equalsIgnoreCase("insert")){
					Statement st = con.createStatement();
	
					int rs1 = st.executeUpdate("INSERT INTO ISSUETRACKER"
							+" (id,issueName,issueDescription,status)"
							+ " VALUES(user_sequence.nextval,'"+id+"','"+issueName+"','"+issueDesc+"','"+"Active"+"')");
	
					if (rs1 > 0) {
						result = true;
				    }
				}
		   }
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
		}
		return rs;
	}
}
