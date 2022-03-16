<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,pkg.*"%>
<jsp:useBean id="pMgr" class="pkg.productMgr"/>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	String sssid = (String)session.getAttribute("ssid");
	String admid = (String)session.getAttribute("adid");
	memberBean beann = mMgr.memberSelect(sssid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/shopping.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="css/script.js"></script>
<title>혜미문고</title>
</head>
<body>
<div id="wrap">
	<img alt="logo" src="./images/logo.png" id="logo" onclick="javascript:location.href='index.jsp'">
	<nav id="catagory_menu">
	<%if (admid != null) {%><span style="color: #667c99">관리자님</span><a href="member_logout.jsp">LOGOUT</a>
	<%} else if (sssid == null) {%>
		<a href="member_login.jsp">LOGIN</a>
		<%} else { %><span style="color: #667c99"><%=beann.getName() %>(<%=sssid %>)</span> <a href="member_logout.jsp">LOGOUT</a><%} %>
		 / <a href="member_join.jsp">JOIN</a> / <a href="product_cart.jsp">CART</a> / <a href="product_mypage.jsp">MY PAGE</a> /
		 <%if (admid != null) {%><a href="admin_qna_list.jsp">Q&A(admin)</a><%} else{ %><a href="product_qna_list.jsp">Q&A(1:1)</a><%} %>
	</nav>
	<nav id="top_menu" style="font-family: 'NanumGothicBold';">
		<ul>
			<li><a href="product_menu.jsp?kind=1">소설</a></li>
			<li><a href="product_menu.jsp?kind=2">시/에세이</a></li>
			<li><a href="product_menu.jsp?kind=3">경제/경영</a></li>
			<li><a href="product_menu.jsp?kind=4">역사/문화</a></li>
			<li><a href="product_menu.jsp?kind=5">취미/실용</a></li>
		</ul>
	</nav>
	<div class="clear"></div>
	<hr>
</body>
</html>