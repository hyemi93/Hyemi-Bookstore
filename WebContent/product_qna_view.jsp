<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="images/qna/sub_img.html" %>
<%@include file="images/mypage/sub_menu.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    int qseq=Integer.parseInt(request.getParameter("qseq"));
    qnaBean bean = pMgr.qnaSelect(qseq);
    String reply=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<article>
<h2>문의 글 조회</h2>
<form method="post" name="writeform" action="action.jsp">
<input type="hidden" name="action" value="qna_reply">
<input type="hidden" name="qseq" value="<%=qseq %>">
	<label>글 제목</label>
	<input type="text" name="subject" size=50 value="<%=bean.getSubject() %>" readonly><Br>
	<label>문의 내용</label>
	<textarea name="content" cols="48" rows="15" readonly><%=bean.getContent() %></textarea><Br>
	<p id="pname">답글 내용</p>
	<%if(bean.getReply()==null) {
		reply="등록된 답글이 없습니다.";
	} else {
		reply=bean.getReply();
	}%>
	<label>관리자</label>
	<%if(admid != null) {%>
		<textarea name="reply" cols="48" rows="5"><%=reply %></textarea>
	<%} else {%>
		<%=reply %>
	<%}%>
<div id="buttons" align="right">
		<%if (admid != null) {%><input type="submit" value="답글달기" class="submit">
		<a href="admin_qna_list.jsp"><input type="button" value="목록보기" class="cancel"></a>
		<%} else { %>
		<a href="product_qna_list.jsp"><input type="button" value="목록보기" class="cancel"></a><%}%>
	</div>
</form>
</article>
</body>
<%@include file="footer.jsp" %>
</html>