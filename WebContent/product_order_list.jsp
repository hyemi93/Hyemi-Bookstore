<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/mypage/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
	int oseq=Integer.parseInt(request.getParameter("oseq"));
    ArrayList<cartBean> list = pMgr.cartList(sssid);
    memberBean mbean=mMgr.memberSelect(sssid);
    int j=0;
    int k=0;
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 확인</title>
</head>
<body>
<article>
<h2>주문 목록</h2>
<form method="post" name="orderform" action="action.jsp">
<input type="hidden" name="action" value="order_Insert">
<input type="hidden" name="oseq" value="<%=oseq%>">
<input type="hidden" name="id" value="<%=sssid%>">
<p id="pname">상품 내역 확인</p>
<table id="cartList">
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
	</tr>
<%
for (cartBean bean : list) {
		k+= bean.getPrice2() * bean.getQuantity();
		j+= bean.getQuantity();
%>
	<tr>
		<td><img alt="product" src="./product_images/<%=bean.getImage() %>" style="width: 100px; height: 144px;"></td>
		<td><%=bean.getPname() %></td>
		<td><%=bean.getQuantity() %></td>
		<td><%=bean.getPrice2() %>원</td>
	</tr>
	<input type="hidden" name="pname" value="<%=bean.getPname()%> 외">

<%
}
%>
	<input type="hidden" name="price2" value="<%=k%>">
	<input type="hidden" name="count2" value="<%=j%>">
	<tr style="font-weight: bold;">
		<td colspan="2">합계</td>
		<td><%=j %></td>
		<td><%=k %>원</td>
	</tr>
</table>
<p id="pname">배송 정보</p>
	<label>주문자</label>
	<input type="text" name="name" size=20 value="<%=mbean.getName()%>"><Br>
	
	<label>우편번호</label>
	<input type="text" name="zip_num" size=15 value="<%=mbean.getZip_num()%>"><Br>
	
	<label>배송 주소</label>
	<input type="text" name="address" size=40 value="<%=mbean.getAddress()%>"><Br>
	
	<label>전화번호</label>
	<input type="text" name="phone" size=20 value="<%=mbean.getPhone()%>"><Br>

<div id="buttons" align="right">
		<input type="submit" value="주문하기" class="submit">
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>
