<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/product/sub_img.html" %>
<%@include file="images/product/sub_menu.jsp" %>
<%
int pseq=Integer.parseInt(request.getParameter("pseq"));
productBean bean = pMgr.productSelect(pseq);
orderBean obean=pMgr.orderSelect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function in_cart() {
	let idck="${ssid}";
	if(idck=="") {
		alert("로그인이 필요한 서비스입니다.");
		location.replace('member_login.jsp');
	} else {
		document.detailform.action = "action.jsp";
		document.detailform.submit();
	}
}
function buy() {
	let idck="${ssid}";
	if(idck=="") {
		alert("로그인이 필요한 서비스입니다.");
		location.replace('member_login.jsp');
	} else {
	document.detailform.action = "product_order_direct.jsp?oseq=<%=obean.getOseq()+1 %>&pseq=<%=pseq %>";
		document.detailform.submit();
	}
}
function del_check() {
	if(confirm("정말 삭제하시겠습니까?")==true) {
		document.detailform.submit();
	} else {
		return;
	}
}
</script>
<title>product_detail</title>
</head>
<body>
<article>
	<h1>Book</h1>
	<p id="pname">도서 상세 정보</p>
	<img alt="product" src="./product_images/<%=bean.getImage() %>" id="item" style="margin-right: 20px">
	<h2><font color="#7092be"><%=bean.getName() %></font></h2>
	<B><%=bean.getWriter() %> 지음 | <%=bean.getPublisher() %></B><Br><Br>
	<%=bean.getContent() %>
	<form method="post" name="detailform" action="admin_product_delete.jsp">
	<input type="hidden" name="action" value="cart_insert">
	<input type="hidden" name="pseq" value="<%=pseq %>">
	<input type="hidden" name="id" value="<%=sssid %>">
	가격 : <%=bean.getPrice2() %> 원<Br>
	수량 : <input type="text" name="quantity" value="1"><Br>
	<div class="clear"></div>
	<div id="buttons">
	<%if (admid != null) {%><a href="admin_product_update.jsp?pseq=<%=pseq %>"><input type="button" value="수정하기" class="submit"></a>
							<input type="button" value="삭제하기" class="submit" onclick="del_check()">
		<%} else { %><input type="button" value="장바구니에 담기" class="submit" onclick="in_cart()">
		<input type="button" value="즉시 구매" class="submit" onclick="buy()"><%}%>
		<a href="javascript:history.back();"><input type="button" value="취소" class="cancel"></a>
	</div>
	</form>
</article>

</body>
<%@include file="footer.jsp" %>
</html>