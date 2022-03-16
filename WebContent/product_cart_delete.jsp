<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="pMgr" class="pkg.productMgr"/>
<%
	String msg = null;
	String url = null;
	int cseq=Integer.parseInt(request.getParameter("cseq"));
		boolean result = pMgr.cartDelete(cseq);
		msg = "다시 시도해주십시오.";
		url = "javascript:history.back();";
	if(result){
		msg = "상품을 삭제하였습니다.";
		url = "product_cart.jsp";
}
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>