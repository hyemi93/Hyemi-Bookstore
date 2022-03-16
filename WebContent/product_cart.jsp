<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/mypage/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<cartBean> list = pMgr.cartList(sssid);
    orderBean obean=pMgr.orderSelect();
    int i=0;
    int j=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function order_check() {
	if(confirm("주문하시겠습니까?")==true) {
		document.cartform.submit();
	} else {
		return;
	}
}
function del_check() {
	if(confirm("삭제하시겠습니까?")==true) {
		location.replace('product_cart_delete.jsp');
	} else {
		return;
	}
}
</script>
<title>장바구니</title>
</head>
<body>
<%if (sssid == null) {%>
	<script>
       location.replace('member_login.jsp');
       </script>
         <%} else {%>
<article>
<h2>장바구니 목록</h2>
<form method="post" name="cartform" action="product_order_list.jsp?oseq=<%=obean.getOseq()+1 %>">
<table id="cartList">
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th>삭제</th>
	</tr>
<%
	for (cartBean bean : list) {
		i+= bean.getPrice2() * bean.getQuantity();
		j+= bean.getQuantity();
%>
	<tr>
		<td><img alt="product" src="./product_images/<%=bean.getImage() %>" style="width: 100px; height: 144px;"></td>
		<td><a href="product_detail.jsp?pseq=<%=bean.getPseq()%>"><%=bean.getPname() %></a></td>
		<td><%=bean.getQuantity() %></td>
		<td><%=bean.getPrice2()*bean.getQuantity() %>원</td>
		<td><a href="product_cart_delete.jsp?cseq=<%=bean.getCseq()%>" onclick="del_check()">삭제</a></td>
	</tr>
<%
}
%>
	<tr style="font-weight: bold;">
		<td colspan="2">합계</td>
		<td><%=j %></td>
		<td><%=i %>원</td>
	</tr>
</table>
<div id="buttons" align="right">
		<input type="button" value="주문하기" class="submit" onclick="order_check()">
	</div>
</form>
</article>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>