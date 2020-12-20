<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1710158";
String password = "oracle";    // Oracle 본인 계정 password 입력
try {
	Class.forName(driver);
	out.println("jdbc driver 로딩 성공");
	DriverManager.getConnection(url, user, password);
	out.println("오라클 연결 성공");
} catch(ClassNotFoundException e) {
	System.out.println("jdbc driver 로딩 실패");
}catch(SQLException e) {
	System.out.println("오라클 연결 실패");
}

%>


</body>
</html>