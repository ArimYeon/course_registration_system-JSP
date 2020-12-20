<%@ page contentType="text/html; charset=EUC_KR" %>
<% session.invalidate(); %>
<script>
	alert("로그아웃 되었습니다.");
	location.href="main.jsp";
</script>
