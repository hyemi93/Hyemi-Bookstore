<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
	ArrayList<productBean> list = pMgr.newitemList();
	ArrayList<productBean> list2 = pMgr.bestitemList();
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/*이미지 슬라이드  */
.section input[id*="slide"] { /*id값으로 slide를 갖는 input 태그를 화면에서 숨김  */
	display: none;
}
.section .sliderwrap { /*전체 이미지 박스 설정  */
	max-width:1200px;
	margin-left:-4%;
	overflow:hidden; /*영역을 벗어나면 보이지 않게 숨김  */
}
.section .slidelist {
	white-space: nowrap;  /*부모창 넘어서도 입력됨  */
	font-size: 0;
}
.section .slidelist > li {
	display: inline-block;
	vertical-align: middle; /*세로 정렬을 가운데  */
	width: 100%;
	transition:all .5s; /*0.5초로 슬라이드가 넘어가게  */
}
.section .slidelist > li > a { 
	display: block; /*a 태그 안의 속성들을 하나로 묶기 */
	position: relative; /*자기 자신을 기준으로  배치*/
}
.section .slidelist > li > a img {
	width:100%;
}
.section .slidelist label {
	position: absolute;
	z-index: 1; /*우선 순위  */
	top:50%; transform:translateY(-50%); /*중앙 배열  */
	padding:50px; /*클릭할 수 있는 공간  */
}
.section .slidelist .left { 
	left:30px; /*왼쪽 기준으로 30px에 위치  */
	background: url('./images/left.png') center center / 100% no-repeat;
	/*no-repeat : 이미지가 반복되지 않음  */
}
.section .slidelist .right {
	right:30px;
	background: url('./images/right.png') center center / 100% no-repeat;
}
.section [id="slide1"]:checked ~ .sliderwrap .slidelist > li {
	transform:translateX(0%);
} /*첫 번째 슬라이드가 체크되면 첫 번째 이미지가 보임  */
.section [id="slide2"]:checked ~ .sliderwrap .slidelist > li {
	transform:translateX(-100%);
}
.section [id="slide3"]:checked ~ .sliderwrap .slidelist > li {
	transform:translateX(-200%);
}

@font-face { font-family: 'NanumGothicBold';
src: url('./fonts/NanumGothicBold.eot');
src: url('./fonts/NanumGothicBold.eot') format('embedded-opentype'),
url('./fonts/NanumGothicBold.woff') format('woff');}
</style>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<section>
	<div id="main_img">
		<div class="section">
			<input type="radio" name="slide" id="slide1" checked> <!--1페이지  -->
			<input type="radio" name="slide" id="slide2"> <!--2페이지  -->
			<input type="radio" name="slide" id="slide3"> <!--3페이지  -->
	
		<div class="sliderwrap">
			<ul class="slidelist">
				<li>
					<a> <!--배너처럼 클릭해 링크 이동  -->
						<label for="slide3" class="left"></label> <!--버튼처럼 이동할 라벨 태그 : 왼쪽으로 이동  -->
						<img src="./images/main1.png" id="imgslide">
						<label for="slide2" class="right"></label> <!--버튼처럼 이동할 라벨 태그 : 오른쪽으로 이동  -->
					</a>
				</li>
				<li>
					<a>
						<label for="slide1" class="left"></label>
						<img src="./images/main2.png" id="imgslide">
						<label for="slide3" class="right"></label>
					</a>
				</li>
				<li>
					<a>
						<label for="slide2" class="left"></label>
						<img src="./images/main3.png" id="imgslide">
						<label for="slide1" class="right"></label>
					</a>
				</li>		
			</ul>
		</div>
	</div>
</div>
</section>
<Br>
<div>
	<h2>이달의 <font color="#7092be">신간</font></h2>
	<div id="bestProduct">
<%
	for (productBean bean : list) {
%>
		<div id="item" style="margin-top:13px; margin-left:13px; margin-right: 12px;">
			<a href="product_detail.jsp?pseq=<%=bean.getPseq() %>"><img alt="product" src="./product_images/<%=bean.getImage() %>"><Br>
			<%=bean.getName() %><Br>
			<%=bean.getWriter() %></a>
		</div>
<%
	}
%>
	</div>
</div>

<div>
	<h2><font color="#7092be">베스트</font> 셀러</h2>
	<div id="bestProduct">
		<%
	for (productBean bean : list2) {
%>
		<div id="item" style="margin-top:13px; margin-left:13px; margin-right: 12px;">
			<a href="product_detail.jsp?pseq=<%=bean.getPseq() %>"><img alt="product" src="./product_images/<%=bean.getImage() %>"><Br>
			<%=bean.getName() %><Br>
			<%=bean.getWriter() %></a>
		</div>
<%
	}
%>
	</div>
</div>
<%@include file="footer.jsp" %>
</html>
