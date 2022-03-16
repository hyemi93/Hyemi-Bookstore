<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/member/sub_img.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_login</title>
</head>
<body>
<article>
<h2>관리자 로그인</h2>
<form method="post" name="loginform" action="action.jsp">
	<input type="hidden" name="action" value="admin_login">
		<label>Admin ID</label>
		<input type="text" name="id" size=20><Br>
		
		<label>Password</label>
		<input type="password" name="pwd" size=20><Br>

	<div id="buttons" align="right">
		<input type="button" value="로그인" class="submit" onclick="loginform_check()">
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>