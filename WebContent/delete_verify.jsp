<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 삭제</title>
</head>
<body>
<%
	String s_id = (String)session.getAttribute("user");
	String c_id = request.getParameter("c_id");
	
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
	mySQL = "delete from enroll where s_id='"+s_id+"' and c_id='"+c_id+"'";
	int res = stmt.executeUpdate(mySQL);
	if(res==1){%>
		<script>
			alert("수강 취소되었습니다.")
			location.href="delete.jsp";
		</script>
<%	}
%>
</body>
</html>