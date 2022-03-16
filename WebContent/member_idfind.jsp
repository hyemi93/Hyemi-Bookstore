<%@page import="pkg.memberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
    String check = request.getParameter("check");
    String name = null;
    String phone = null;
    ArrayList<memberBean> list = null;
    memberBean bean=null;
    if (check.equals("y"))
    {
    	name = request.getParameter("name");
    	phone = request.getParameter("phone");
        list = mMgr.idFind(name, phone);
    }
%>
<html>
<head>
<title>아이디 찾기</title>
<link href="css/shopping.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="css/script.js"></script>
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
	<h1>아이디 찾기</h1>
	<form name="idfindform" method="post">
		User Name <input type="text" name="name" placeholder="성명을 입력하세요."><Br>
		User Phone <input type="text" name="phone" placeholder="핸드폰 번호를 입력하세요."><Br>
		<div style="margin-top: 10px; margin-left: 25px;">
			   <input type="button" value="검색" onclick="idFind()" class="submit" ></div><p>
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
               	 회원님의 아이디는 <%=bean.getId() %>입니다.<Br>
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
