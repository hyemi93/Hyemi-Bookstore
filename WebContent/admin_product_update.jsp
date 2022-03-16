<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<%@include file="images/admin/sub_img.html" %>
<%
int pseq=Integer.parseInt(request.getParameter("pseq"));
productBean bean = pMgr.productSelect(pseq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
</head>
<body>
<article>
<h2>상품 수정</h2>
<form method="post" name="productform" action="action.jsp">
<input type="hidden" name="action" value="product_update">
<input type="hidden" name="pseq" value="<%=pseq%>">

<label>상품명</label>
<input type="text" name="name" value="<%=bean.getName()%>"><Br>

<label>저자명</label>
<input type="text" name="writer" value="<%=bean.getWriter()%>"><Br>

<label>출판사명</label>
<input type="text" name="publisher" value="<%=bean.getPublisher()%>"><Br>

<c:set var="kind2" value="<%=bean.getKind()%>"/>

<label>상품 카테고리</label>
<select name="kind">
	<option value="0">선택하세요.</option>
	<option value="1" <c:if test="${kind2==1 }">selected</c:if>>소설</option>
	<option value="2" <c:if test="${kind2==2 }">selected</c:if>>시/에세이</option>
	<option value="3" <c:if test="${kind2==3 }">selected</c:if>>경제/경영</option>
	<option value="4" <c:if test="${kind2==4 }">selected</c:if>>역사/문화</option>
	<option value="5" <c:if test="${kind2==5 }">selected</c:if>>취미/실용</option>
</select>
<Br><Br>
<label>상품 가격</label>
<input type="text" name="price2" value="<%=bean.getPrice2()%>"><Br>

<label>상품 설명</label>
<input type="text" name="content" size=50 value="<%=bean.getContent()%>"><Br>

<label>상품 이미지</label>
<input type="file" name="image"  value="<%=bean.getImage()%>">

<div id="buttons">
		<input type="button" value="등록" class="submit" onclick="productform_check()">
	</div>

</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>