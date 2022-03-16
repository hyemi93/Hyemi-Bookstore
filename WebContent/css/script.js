/*회원가입폼 유효성 체크*/
function joinform_check() {
	var ck=document.joinform;
	if (ck.id.value=="") {
		alert("아이디를 입력하세요.");
		ck.id.focus();
		return;
	}
	if (ck.pwd.value=="") {
		alert("비밀번호를 입력하세요.");
		ck.pwd.focus();
		return;
	}
	if (ck.pwd2.value=="") {
		alert("비밀번호를 다시 입력하세요.");
		ck.pwd2.focus();
		return;
	}
	if (ck.pwd.value!=ck.pwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		ck.pwd2.focus();
		return;
	}
	if (ck.name.value=="") {
		alert("이름을 입력하세요.");
		ck.name.focus();
		return;
	}
	if (ck.email.value=="") {
		alert("이메일을 입력하세요.");
		ck.email.focus();
		return;
	}
	if (ck.zip_num.value=="") {
		alert("우편번호를 검색하세요.");
		ck.zip_num.focus();
		return;
	}
	if (ck.address.value=="") {
		alert("주소를 검색하세요.");
		ck.address.focus();
		return;
	}
	if (ck.address2.value=="") {
		alert("상세주소를 입력하세요.");
		ck.address2.focus();
		return;
	}
	if (ck.phone.value=="") {
		alert("연락처를 입력하세요.");
		ck.phone.focus();
		return;
	}
	ck.submit();
}

/*아이디 중복 체크 팝업 스크립트*/
function id_check() {
	url = "member_idcheck.jsp?check=n";
	window.open(url, "IdCheck","width=350px,height=250,scrollbars=yes");
}

/*아이디 검색 스크립트*/
function idSearch() {
	var ck = document.idcheckform;
	if (ck.id.value == "") {
		alert("아이디를 입력하세요.");
		ck.id.focus();
		return;
	}
		ck.action = "member_idcheck.jsp";
		ck.submit();
}

/*아이디 체크 결과를 전송*/
function sendId(id) {
	opener.document.joinform.id.value = id;
	self.close();
}

/*주소 찾기 팝업 스크립트*/
function zipnum_search() {
	url = "member_zipnum.jsp?search=n";
	window.open(url, "ZipNumSearch","width=690px,height=300,scrollbars=yes");
}

/*동 이름 검색 스크립트*/
function dongSearch() {
	var ck = document.zipform;
	if (ck.dong.value == "") {
		alert("동이름을 입력하세요.");
		ck.dong.focus();
		return;
	}
		ck.action = "member_zipnum.jsp";
		ck.submit();
}

/*주소 검색 결과를 전송*/
function sendAdd(zip_num, address) {
	opener.document.joinform.zip_num.value = zip_num;
	opener.document.joinform.address.value = address;
	self.close();
}

/*로그인폼 유효성 체크*/
function loginform_check() {
	var ck=document.loginform;
	if (ck.id.value=="") {
		alert("아이디를 입력하세요.");
		ck.id.focus();
		return;
	}
	if (ck.pwd.value=="") {
		alert("비밀번호를 입력하세요.");
		ck.pwd.focus();
		return;
	}
	ck.submit();
}

/*아이디 찾기 스크립트*/
function idFind() {
	var ck = document.idfindform;
	if (ck.name.value == "") {
		alert("성명을 입력하세요.");
		ck.name.focus();
		return;
	}
	if (ck.phone.value == "") {
		alert("전화번호를 입력하세요.");
		ck.phone.focus();
		return;
	}
		ck.action = "member_idfind.jsp";
		ck.submit();
}

/*비밀번호 찾기 스크립트*/
function pwdFind() {
	var ck = document.pwdfindform;
	if (ck.id.value == "") {
		alert("아이디를 입력하세요.");
		ck.id.focus();
		return;
	}
	if (ck.name.value == "") {
		alert("성명을 입력하세요.");
		ck.name.focus();
		return;
	}
		ck.action = "member_pwdfind.jsp";
		ck.submit();
}

/*문의글 작성 유효성 체크*/
function writeform_check() {
	var ck=document.writeform;
	if(ck.subject.value=="") {
		alert("글 제목을 입력해주세요.");
		ck.subject.focus();
		return;
	}
	if(ck.content.value=="") {
		alert("문의 내용을 입력해주세요.");
		ck.content.focus();
		return;
	}
	ck.submit();
}

/*관리자 상품 등록 유효성 체크*/
function productform_check() {
	var ck = document.productform;
	if (ck.name.value == "") {
		alert("상품명을 입력하세요.");
		ck.name.focus();
		return;
	}
	if (ck.kind.value == "0") {
		alert("카테고리를 선택하세요.");
		ck.kind.focus();
		return;
	}
	if (ck.price2.value == "") {
		alert("상품 가격을 입력하세요.");
		ck.price2.focus();
		return;
	}
	if (ck.content.value == "") {
		alert("상품 설명을 입력하세요.");
		ck.content.focus();
		return;
	}
	if (ck.image.value == "") {
		alert("상품 이미지를 입력하세요.");
		ck.image.focus();
		return;
	}
		ck.submit();
}