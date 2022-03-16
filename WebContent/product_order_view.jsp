<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/mypage/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
	int oseq = Integer.parseInt(request.getParameter("oseq"));
    ArrayList<cartBean> list = pMgr.orderList(oseq);
    memberBean mbean=mMgr.memberSelect(sssid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_order_view</title>
</head>
<body>
<article>
<h2>주문 상세 정보</h2>
<form method="post" name="Orderform">
<table id="cartList">
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th>주문일자</th>
	</tr>
<%
	for (cartBean bean : list) {
%>
	<tr>
		<td><img alt="product" src="./product_images/<%=bean.getImage() %>" style="width: 100px; height: 144px;"></td>
		<td><a href="product_detail.jsp?pseq=<%=bean.getPseq()%>"><%=bean.getPname() %></a></td>
		<td><%=bean.getQuantity() %></td>
		<td><%=bean.getPrice2()*bean.getQuantity() %>원</td>
		<td><%=bean.getIndate() %></td>
	</tr>
<%
}
%>
</table>
<p id="pname">배송 정보</p>
	<label>주문자</label>
	<%=mbean.getName()%><Br><Br>
	
	<label>우편번호</label>
	<%=mbean.getZip_num()%><Br><Br>
	
	<label>배송 주소</label>
	<%=mbean.getAddress()%><Br><Br>
	
	<label>전화번호</label>
	<%=mbean.getPhone()%><Br>
	
	<div id="buttons" align="right">
		<a href="product_mypage.jsp"><input type="button" value="목록으로" class="submit"></a>
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>