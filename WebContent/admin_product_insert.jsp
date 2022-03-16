<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/admin/sub_img.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
</head>
<body>
<article>
<h2>도서 등록</h2>
<form method="post" name="productform" action="action.jsp">
<input type="hidden" name="action" value="product_insert">

<label>도서명</label>
<input type="text" name="name"><Br>

<label>저자명</label>
<input type="text" name="writer"><Br>

<label>출판사명</label>
<input type="text" name="publisher"><Br>

<label>도서 카테고리</label>
<select name="kind">
	<option value="0">선택하세요.</option>
	<option value="1">소설</option>
	<option value="2">시/에세이</option>
	<option value="3">경제/경영</option>
	<option value="4">역사/문화</option>
	<option value="5">취미/실용</option>
</select>
<Br><Br>
<label>도서 가격</label>
<input type="text" name="price2"><Br>

<label>도서 설명</label>
<input type="text" name="content" size=50><Br>

<label>도서 이미지</label>
<input type="file" name="image">

<div id="buttons">
		<input type="button" value="등록" class="submit" onclick="productform_check()">
	</div>

</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>