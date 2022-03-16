<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/product/sub_img.html" %>
<%@include file="images/product/sub_menu.jsp" %>
<%
String kind=request.getParameter("kind");
ArrayList<productBean> list3 = pMgr.menuitemList(kind);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_menu</title>
</head>
<body>
	<article>
	<h2>도서목록<%if (admid != null) {%><form><div id="buttons" align="right" style="margin-top: -40px;"><a href="admin_product_insert.jsp"><input type="button" value="상품 추가하기" class="submit"></a></div></form><%} %></h2>
<%
	for (productBean bean : list3) {
%>
	<div id="item">
			<a href="product_detail.jsp?pseq=<%=bean.getPseq() %>"><img alt="product" src="./product_images/<%=bean.getImage() %>"><Br>
			<%=bean.getName() %><Br>
			<%=bean.getWriter() %></a><Br><Br>
		</div>
<%
	}
%>
	</article>
<%@include file="footer.jsp" %>
</body>
</html>