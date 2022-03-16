<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/qna/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<article>
<h2>문의 글 작성</h2>
<form method="post" name="writeform" action="action.jsp">
<input type="hidden" name="action" value="qna_write">
	<label>글 제목</label>
	<input type="text" name="subject" size=50><Br>
	<label>문의 내용</label>
	<textarea name="content" cols="48" rows="15"></textarea><Br>
	<input type="hidden" name="id" value="<%=sssid %>">
<div id="buttons" align="right">
		<input type="button" value="작성" class="submit" onclick="writeform_check()">
		<input type="reset" value="취소" class="cancel">
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>