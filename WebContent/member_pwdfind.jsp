<%@page import="pkg.memberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
    String check = request.getParameter("check");
    String id = null;
    String name = null;
    ArrayList<memberBean> list = null;
    memberBean bean=null;
    if (check.equals("y"))
    {
    	id = request.getParameter("id");
    	name = request.getParameter("name");
        list = mMgr.pwdFind(id, name);
    }
%>
<html>
<head>
<title>비밀번호 찾기</title>
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
	<h1>비밀번호 찾기</h1>
	<form name="pwdfindform" method="post">
		User ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" placeholder="아이디를 입력하세요."><Br>
		User Name <input type="text" name="name" placeholder="성명을 입력하세요.">
		<div style="margin-top: 10px; margin-left: 25px;">
			   <input type="button" value="검색" onclick="pwdFind()" class="submit"></div><p>
                <%
                if (check.equals("y")) {
                    if (list.isEmpty()) {
                %>
                	검색 결과가 없습니다.<Br>
               	 <input type="button" value="닫기" onClick="self.close()">
                <%
                    } else {
                        bean = list.get(0);
                %>
               	 회원님의 비밀번호는 <%=bean.getPwd() %>입니다.<Br>
               	 <input type="button" value="닫기" onClick="self.close()">
                <%
                    }
                }
                %>
		<input type="hidden" name="check" value="y">
	</form>
</div>
</body>
</html>
