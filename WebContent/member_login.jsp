<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/member/sub_img.html" %>
<%@include file="images/member/sub_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_login</title>
</head>
<body>
<article>
<h2>로그인</h2>
<form method="post" name="loginform" action="action.jsp">
	<input type="hidden" name="action" value="member_login">
		<label>User ID</label>
		<input type="text" name="id" size=20 placeholder="아이디를 입력하세요."><Br>
		
		<label>Password</label>
		<input type="password" name="pwd" size=20 placeholder="비밀번호를 입력하세요."><Br>

	<div id="buttons">
		<input type="button" value="로그인" class="submit" onclick="loginform_check()">
		<a href="member_join.jsp"><input type="button" value="회원가입" class="cancel"></a>
		<a href="member_idpwdfind.jsp"><input type="button" value="아이디 비밀번호 찾기" class="submit"></a>
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>