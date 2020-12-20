<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 사용자 수정</title>
<style>
	body{text-align:center;}
	h2{color:#0D2D84;}
	tr{
		height:40px;
	}
	tr:nth-child(even){background-color:#EAEAEA;}
</style>
</head>
<body>
	<%@include file="top.jsp" %>
	<h2>사용자 정보 수정</h2>
	<%
	if(session_id != null){
		String dbdriver = "oracle.jdbc.driver.OracleDriver"; 
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl"; 
		String user = "db1710158";
		String passwd = "oracle";
		Connection myConn = null;
		
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl, user, passwd);
		
		Statement stmt = null;
		String mySQL = null;
		ResultSet rs = null;
		
		mySQL="select * from students where s_id='" + session.getAttribute("user") + "'";
		
		stmt = myConn.createStatement();
		rs = stmt.executeQuery(mySQL);
		
		String id = null, name = null, major = null;
		while(rs.next()){
			id = rs.getString("s_id");
			name = rs.getString("s_name");
			major = rs.getString("s_major");
		}%>
		<br>
		<table width="50%" align="center" bgcolor="#2060AA" cellspacing="0" cellpadding="0">
		<tr><td><div align="center" style="color:#ffffff;">변경할 비밀번호를 입력해 주세요</div></td></tr>
		</table>
		<table width="50%" align="center" cellspacing="0" cellpadding="0">
			<form method="post" action="update_verify.jsp">
				<tr>
				<td><div align="center">학번(아이디)</div></td>
				<td><div align="center"><%=id %></div></td>
				</tr>
				<tr>
				<td><div align="center">패스워드</div></td>
				<td><div align="center">
				<input type="password" name="userPassword">
				</div></td>
				</tr>
				<tr>
				<td><div align="center">이름</div></td>
				<td><div align="center"><%=name %></div></td>
				</tr>
				<tr>
				<td><div align="center">전공</div></td>
				<td><div align="center"><%=major %></div></td>
				</tr>
				<tr>
				<td colspan=2 ><div align="center">
				<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="수정하기">
				<INPUT TYPE="RESET" VALUE="취소"></div></td>
				</tr>
			</form>
		</table>
	</body>
<%
		rs.close();
		stmt.close();
		myConn.close();
	}
	else {
		%>
		<script>
			alert("로그인 한 후 사용하세요.");
			location.href="login.jsp";
		</script>
	<%}%>
</html>
