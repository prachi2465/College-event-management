package com.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertRec
 */
@WebServlet("/InsertRec")
public class InsertRec extends HttpServlet {
	String url= "jdbc:sqlserver://localhost:1433;databasename= clg_mgmt;";
	String usrname= "sa";
	String pass= "prachi";
	String sql3= "insert into stu_rec values (?, ?);";
	public void insertrec(String uname, String pwd)
	{
		try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection con= DriverManager.getConnection(url, usrname, pass);
		PreparedStatement st= con.prepareStatement(sql3);
		st.setString(1, uname);
		st.setString(2, pwd);
		st.executeUpdate();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uname= request.getParameter("uname");
	String pwd= request.getParameter("pwd");
	insertrec(uname, pwd);
	response.sendRedirect("AdminOpt.jsp");
	}
	}

