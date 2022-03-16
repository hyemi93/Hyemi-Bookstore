<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/member/sub_img.html" %>
<%@include file="images/member/sub_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function idpwdfind() {
	var findlist = $('input[name=find]:checked').val();
	if(findlist=="id") {
		window.open("member_idfind.jsp?check=n", "PwdFind","width=400px,height=300,scrollbars=yes");
		return;
	}
	if(findlist=="pwd") {
		window.open("member_pwdfind.jsp?check=n", "PwdFind","width=400px,height=300,scrollbars=yes");
		return;
	}
}
</script>
<title>member_idpwdfind</title>
</head>
<body>
<article>
<form>
<h2>아이디 비밀번호 찾기</h2>
	<label><input type="radio" name="find" value="id" checked>아이디 찾기</label>
	<label><input type="radio" name="find" value="pwd">비밀번호 찾기</label><Br><Br>
	
	<div id="buttons" style="margin-top: 10px; margin-left: -25px;">
		<input type="button" value="찾기" class="submit" onclick="idpwdfind()">
		<a href="member_login.jsp"><input type="button" value="취소" class="cancel"></a>
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>