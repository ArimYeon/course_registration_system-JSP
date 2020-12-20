<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");

Connection myConn = null;
Statement stmt = null;

String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1710158";
String passwd = "oracle";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
try{
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
}catch(SQLException e) {
	System.err.println("SQLException: "+e.getMessage());
}
mySQL = "select s_id from students where s_id='"+userID+"'and s_pwd='"+userPassword+"'";
ResultSet myResultSet = stmt.executeQuery(mySQL);
if(myResultSet!=null){
	if(myResultSet.next()){
		String id = myResultSet.getString("s_id");
		session.setAttribute("user", id);
		response.sendRedirect("main.jsp");
	}
	else{%>
		<script>
			alert("로그인에 실패했습니다.");
			location.href="login.jsp";
		</script>
<%	}
}
else{
	response.sendRedirect("login.jsp");
}
stmt.close();
myConn.close();
%>