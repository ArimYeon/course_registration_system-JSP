<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
String userPassword = request.getParameter("userPassword");
String session_id = (String)session.getAttribute("user");

Connection myConn = null;
Statement stmt = null;

String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1710158";
String passwd = "oracle";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
mySQL = "update students set s_pwd='"+userPassword+"' where s_id='"+session_id+"'";
try{
	try{
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement();
	}catch(SQLException e) {
		System.err.println("SQLException: "+e.getMessage());
	}
	int n = stmt.executeUpdate(mySQL);%>
	<script>
		alert("정상적으로 수정되었습니다.");
		location.href="main.jsp";
	</script>
<%}catch(SQLException ex){
	String sMessage;
	if(ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
	else if(ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	else sMessage="잠시 후 다시 시도하십시오";%>
	<script>
		alert("<%=sMessage%>");
		location.href="update.jsp";
	</script>
<%}
stmt.close();
myConn.close();
%>