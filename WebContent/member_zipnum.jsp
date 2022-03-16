<%@page import="pkg.zipnumBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="pkg.memberMgr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
    String check = request.getParameter("search");
    String dong = null;
    ArrayList<zipnumBean> zlist = null;
    if (check.equals("y"))
    {
    	dong = request.getParameter("dong");
        zlist = mMgr.zipnumsearch(dong);
    }
%>
<html>
<head>
<title>우편번호 검색</title>
<link href="css/shopping.css" rel="stylesheet" type="text/css">
<style type="text/css">
table {
	border-collapse:collapse;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	width: 100%;
}
table tr {
	border-bottom: 1px solid #fff;
}
div {
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<script type="text/javascript" src="css/script.js"></script>
</head>
<body>
<div>
	<h1 align="center">우편번호검색</h1>
	<form name="zipform" method="post">
		<div align="center">동 이름 : <input type="text" name="dong">
			   <input type="button" value="찾기" onclick="dongSearch()"></div><p>
			<table>
                <%
                    if (check.equals("y")) {
                        if (zlist.isEmpty()) {
                %>
                <tr>
                    <td align="center"><br />검색된 결과가 없습니다.</td>
                </tr>
 
                <%
                    } else {
                %>
                <tr>
                    <td align="center"><br />검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
 
                </tr>
                <%
                    for (int i = 0; i < zlist.size(); i++) {
                    			zipnumBean bean = zlist.get(i);
                                String zipnum = bean.getZip_num();
                                String sido = bean.getSido();
                                String gugun = bean.getGugun();
                                String dong2 = bean.getDong();
                                String zipcode = bean.getZip_code();
                                String bunji = bean.getBunji();
                                String address = sido + " " + gugun + " " + dong2 + " " + zipcode + " " + bunji + " ";
                %>
                <tr>
                    <td><a href='#' onclick="javascript:sendAdd('<%=zipnum%>', '<%=address%>')"> <%=zipnum%> <%=address%></a></td>
                </tr>
                <%
                    }
 
                  }
 
                 }
                %>
		</table>
		<input type="hidden" name="search" value="y">
	</form>
</div>
</body>
</html>
