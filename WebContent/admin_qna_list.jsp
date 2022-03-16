<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/qna/sub_img.html" %>
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<qnaBean> list = pMgr.adminqnaList();
	String rep=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%if (admid == null) {%>
	<script>
       location.replace('admin_login.jsp');
       </script>
         <%} else {%>
<article>
<h2>Q&A(1:1)</h2>
<form method="post" name="qnaform">
<table id="cartList">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성회원</th>
		<th>등록일</th>
		<th>답변 여부</th>
	</tr>
<%
	for (qnaBean bean : list) {
%>
	<tr>
		<td><%=bean.getQseq() %></td>
		<td><a href="product_qna_view.jsp?qseq=<%=bean.getQseq()%>"><%=bean.getSubject()%></a></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getIndate() %></td>
		<td><%=bean.getRep() %></td>
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