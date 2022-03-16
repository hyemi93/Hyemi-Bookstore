<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<jsp:useBean id="pMgr" class="pkg.productMgr"/>
<jsp:useBean id="bean" class="pkg.memberBean" />
<jsp:useBean id="pbean" class="pkg.productBean" />
<jsp:useBean id="cbean" class="pkg.cartBean" />
<jsp:useBean id="obean" class="pkg.orderBean" />
<jsp:useBean id="qbean" class="pkg.qnaBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:setProperty property="*" name="pbean"/>
<jsp:setProperty property="*" name="cbean"/>
<jsp:setProperty property="*" name="obean"/>
<jsp:setProperty property="*" name="qbean"/>
<%
    String action = request.getParameter("action");
	String msg = null;
	String url = null;
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    
    switch (action) {
    case "member_join" :
    	boolean result = mMgr.memberjoin(bean);
    	msg = "다시 시도해주십시오.";
    	url = "member_join.jsp";
    	if(result){
    		msg = "회원이 되신 걸 축하합니다.";
    		url = "member_login.jsp";
    	}
        break;
        
    case "member_login" :
    	boolean result2 = mMgr.memberlogin(id,pwd);
    	msg = "다시 시도해주십시오.";
    	url = "member_login.jsp";
    	if(result2){
    		session.setAttribute("ssid", id);
    		msg = "방문해주셔서 감사합니다.";
    		url = "index.jsp";
    	}
        break;
        
    case "cart_insert" :
    	boolean result3 = pMgr.cartInsert(cbean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result3){
    		msg = "장바구니에 저장되었습니다.";
    		url = "product_cart.jsp";
    	}
        break;
        
    case "order_Insert" :
    	boolean result4 = pMgr.orderInsert(obean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result4){
    		boolean result5 = pMgr.cartUpdate(cbean);
    		msg = "주문이 완료되었습니다.";
    		url = "product_mypage.jsp";
    	}
        break;
        
    case "order_Direct" :
    	boolean result6 = pMgr.orderInsert(obean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result6){
    		boolean result7 = pMgr.orderDirect(cbean);
    		msg = "주문이 완료되었습니다.";
    		url = "product_mypage.jsp";
    	}
        break;
        

    case "admin_login" :
    	boolean result8 = mMgr.adminlogin(id,pwd);
    	msg = "다시 시도해주십시오.";
    	url = "admin_login.jsp";
    	if(result8){
    		session.setAttribute("adid", id);
    		msg = "관리자님 방문을 환영합니다.";
    		url = "index.jsp";
    	}
        break;
        
    case "product_insert" :
    	boolean result9 = pMgr.productInsert(pbean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result9){
    		msg = "상품을 등록하였습니다.";
    		url = "index.jsp";
    	}
        break;
        
    case "product_update" :
    	boolean result10 = pMgr.productUpdate(pbean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result10){
    		msg = "상품을 수정하였습니다.";
    		url = "index.jsp";
    	}
        break;
        
    case "qna_write" :
    	boolean result11 = pMgr.qnaWrite(qbean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result11){
    		msg = "문의 내용을 남겼습니다.";
    		url = "product_qna_list.jsp";
    	}
        break;
        
    case "qna_reply" :
    	boolean result12 = pMgr.replyUpdate(qbean);
    	msg = "다시 시도해주십시오.";
    	url = "javascript:history.back();";
    	if(result12){
    		msg = "답글을 등록하였습니다.";
    		url = "admin_qna_list.jsp";
    	}
        break;
    }
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>