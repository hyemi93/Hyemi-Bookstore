<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/mypage/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<orderBean> list = pMgr.mypageList(sssid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%if (sssid == null) {%>
	<script>
       location.replace('member_login.jsp');
       </script>
         <%} else {%>
<article>
<h2>My Page</h2>
<form method="post" name="mypageform">
<table id="cartList">
	<tr>
		<th>주문일자</th>
		<th>주문번호</th>
		<th>상품명</th>
		<th>결제 금액</th>
		<th>주문 상세</th>
	</tr>
<%
	for (orderBean bean : list) {
%>
	<tr>
		<td><%=bean.getIndate() %></td>
		<td><%=bean.getOseq()%></td>
		<td><%=bean.getPname() %> <%=bean.getCount2()-1 %>건</td>
		<td><%=bean.getPrice2() %>원</td>
		<td><a href="product_order_view.jsp?oseq=<%=bean.getOseq()%>">조회</a></td>
	</tr>
<%
}
%>
</table>
</form>
</article>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>
