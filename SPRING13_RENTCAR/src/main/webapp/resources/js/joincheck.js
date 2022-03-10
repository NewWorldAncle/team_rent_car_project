 /**
 * 클라이언트에서 서버로 보내기 전 점검하는 부분
 */
function infoConfirm() {
	//아이디
	if(document.reg_frm.id.value.length==0){
		alert("아이디는 필수 입력 사항입니다.");
		reg_frm.id.focus();
		return;
	}
	
	if(document.reg_frm.id.value.length < 3){
		alert("아이디는 3글자 이상이어야 합니다.");
		reg_frm.id.focus();
		return;
	}

	//비밀번호	
	if(document.reg_frm.pass.value.length==0){
		alert("패스워드는 필수 입력 사항입니다.");
		reg_frm.pass.focus();
		return;
	}
	
	if(document.reg_frm.pass.value != document.reg_frm.pass_chk.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pass_chk.focus();
		return;
	}
	
	if(document.reg_frm.tel.value.length==0){
		alert("전화번호는 필수 입력 사항입니다.");
		reg_frm.tel.focus();
		return;
	}
	
	//입력이 완벽했을 때 처리하는 부분
	document.reg_frm.submit();
}