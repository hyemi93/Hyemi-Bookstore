<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/member/sub_img.html" %>
<%@include file="images/member/sub_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_join</title>
</head>
<body>
<article>
<h2>회원가입</h2>
<form method="post" name="joinform" action="action.jsp">
<input type="hidden" name="action" value="member_join">
	<fieldset>
		<legend>기본 정보</legend>
	</fieldset>

		<label>User ID</label>
		<input type="text" name="id" size=15 readonly><input type="button" value="중복 체크" class="dup" onclick="id_check()"><Br>
		
		<label>Password</label>
		<input type="password" name="pwd" size=20><Br>
		
		<label>Retype Password</label>
		<input type="password" name="pwd2" size=20><Br>
		
		<label>Name</label>
		<input type="text" name="name" size=20><Br>
		
		<label>E-Mail</label>
		<input type="text" name="email" size=20><Br>
		<p>
<fieldset>
		<legend>주소 정보</legend>
	</fieldset>
		<label>Zip Code</label>
		<input type="text" name="zip_num" size=15 readonly><input type="button" value="주소 찾기" class="dup" onclick="zipnum_search()"><Br>

		<label>Address</label>
		<input type="text" name="address" size=40>
		<input type="text" name="address2" size=20><Br>

		<label>Phone Number</label>
		<input type="text" name="phone" size=20><Br>
		
			<div class="clear"></div>
	<div id="buttons">
		<input type="button" value="회원가입" class="submit" onclick="joinform_check()">
		<input type="reset" value="취소" class="cancel">
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>