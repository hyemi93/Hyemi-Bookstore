<%@page import="pkg.memberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
	String check = request.getParameter("check");
	String id = null;
	boolean result = mMgr.idcheck(id);
	if (check.equals("y"))
    {
		id = request.getParameter("id");
		result = mMgr.idcheck(id);
    }
%>
<html>
<head>
<title>ID 중복확인</title>
<link href="css/shopping.css" rel="stylesheet" type="text/css">
<style type="text/css">
div {
	margin-left: 30px;
}

body{
    margin:0;
    padding:0;
    font-size:0.75em;
}

form {
	width: 310px;
}
</style>
<script type="text/javascript" src="css/script.js"></script>
</head>
<body>
<div>
	<h1>ID 중복확인</h1>
	<form name="idcheckform" method="post">
		User ID <input type="text" name="id">
			   <input type="button" value="검색" onclick="idSearch()"><p>
                <%
                if (check.equals("y")) {
                    if (result) {
                %>
                <%=id %>는 이미 존재하는 ID입니다.
 
                <%
                    } else {
                %>
                <%=id %>는 사용 가능한 ID입니다. <input type="button" value="사용" onclick="javascript:sendId('<%=id%>')">
                <%
                    }
                }
                %>
		<input type="hidden" name="check" value="y">
	</form>
</div>
</body>
</html>
