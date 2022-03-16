<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/qna/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<qnaBean> list = pMgr.qnaList(sssid);
	String rep=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%if (sssid == null) {%>
	<script>
       location.replace('member_login.jsp');
       </script>
         <%} else {%>
<article>
<h2>Q&A(1:1)</h2>
<form method="post" name="qnaform">
<table id="cartList">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>답변 여부</th>
	</tr>
<%
	for (qnaBean bean : list) {
%>
	<tr>
		<td><%=bean.getQseq() %></td>
		<td><a href="product_qna_view.jsp?qseq=<%=bean.getQseq()%>"><%=bean.getSubject()%></a></td>
		<td><%=bean.getIndate() %></td>
		<td><%=bean.getRep() %></td>
	</tr>
<%
}
%>
</table>
<div id="buttons" align="right">
		<a href="product_qna_write.jsp"><input type="button" value="문의하기" class="submit"></a>
	</div>
</form>
</article>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>