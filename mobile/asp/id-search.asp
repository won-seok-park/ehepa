<!doctype asp>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/asp; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/flyPanels.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/respond.js"></script>

<script language="JavaScript">
<!--
function MblNumStr(str) {
        var RegNotNum = /[^0-9]/g;
        var RegPhonNum = "";
        var DataForm = "";

        // return blank     
        if (str == "" || str == null) return "";

        // delete not number ㅋ 
        str = str.replace(RegNotNum, '');

        // delete not number ㅋ 
        str = str.replace(RegNotNum, '');

        if (str.length < 4) return str;

        if (str.length > 3 && str.length < 7) {
            DataForm = "$1";
            RegPhonNum = /([0-9]{4})([0-9]+)/;
        } else if (str.length == 7) {
            DataForm = "$1";
            RegPhonNum = /([0-9]{4})([0-9]+)/;
        } else if (str.length == 10) {
            DataForm = "$1";
            RegPhonNum = /([0-9]{4})([0-9]+)/;
        } else {
            DataForm = "$1";
            RegPhonNum = /([0-9]{4})([0-9]+)/;
        }
        
        while (RegPhonNum.test(str)) {
            str = str.replace(RegPhonNum, DataForm);
        }
        return str;
    }

    function MaskMbl(obj) {
        obj.value = MblNumStr(obj.value);
    }


    //ID찾기 SMS발송
    function findEmail() {

        var i_Nm = document.getElementById('i_Nm').value;
        var i_Mbl0 = document.getElementById('i_Mbl0').value;
        var i_Mbl1 = document.getElementById('i_Mbl1').value;
        var i_Mbl2 = document.getElementById('i_Mbl2').value;

        if (i_Nm == "") {
            alert("성함을 입력해 주십시오.");
            document.getElementById('i_Nm').focus();
            return;
        }

        if (i_Mbl1 == "") {
            alert("휴대폰 번호를 입력해 주십시오.");
            document.getElementById('i_Mbl1').focus();
            return;
        }

        if (i_Mbl2 == "") {
            alert("휴대폰 번호를 입력해 주십시오.");
            document.getElementById('i_Mbl2').focus();
            return;
        }

        i_Mbl = i_Mbl0 + "-" + i_Mbl1 + "-" + i_Mbl2

        //alert(i_Nm + "-" + i_Mbl);

        $.ajax({
            url: "/api/email_search.asp",
            data: { unm: i_Nm, umbl: i_Mbl },
            dataType: "json",
            async: true,
            error: function (xhr) {
                alert('서버통신 오류입니다');
            },
            success: function (data) {
                if (data.complete == "_complete") {
                    alert('가입하신 아이디(이메일)를 휴대폰으로 전송하였습니다. ');
                }
                else {
                    alert('가입되어있지 않은 정보입니다.');
                }
            }
        });

    }

    //ID찾기 SMS발송
    function findPWD() {

        var p_Email = document.getElementById('p_Email').value;
        var p_Mbl0 = document.getElementById('p_Mbl0').value;
        var p_Mbl1 = document.getElementById('p_Mbl1').value;
        var p_Mbl2 = document.getElementById('p_Mbl2').value;

        if (p_Email == "") {
            alert("아이디(이메일)을 입력해 주십시오.");
            document.getElementById('p_Email').focus();
            return;
        }

        if (p_Mbl1 == "") {
            alert("휴대폰 번호를 입력해 주십시오.");
            document.getElementById('p_Mbl1').focus();
            return;
        }

        if (p_Mbl2 == "") {
            alert("휴대폰 번호를 입력해 주십시오.");
            document.getElementById('p_Mbl2').focus();
            return;
        }

        p_Mbl = p_Mbl0 + "-" + p_Mbl1 + "-" + p_Mbl2

        $.ajax({
            url: "/api/pwd_search.asp",
            data: { uemail: p_Email, umbl: p_Mbl },
            dataType: "json",
            async: true,
            error: function (xhr) {
                alert('서버통신 오류입니다');
            },
            success: function (data) {
                if (data.complete == "_complete") {
                    alert('비밀번호 정보를 휴대폰으로 전송하였습니다. ');
                }
                else {
                    alert('가입되어있지 않은 정보입니다.');
                }
            }
        });

    }

    function emailInit() {
        document.getElementById('UEmail0').value = "";
    }

    function emailCheck() {

        var Regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var UEmail = document.getElementById('UEmail0').value;

        if (UEmail == "") {
            alert("이메일 주소를 기입해 주십시오.");
            document.getElementById('pop-register2').setAttribute('href','#registerpop1');
            document.getElementById('UEmail0').focus();
            return;
        }

        if (Regex.test(UEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.getElementById('pop-register2').setAttribute('href', '#registerpop1');
            return;
        }

        $.ajax({
            url: "/api/email_register_chk.asp",
            data: { UEmail: UEmail },
            dataType: "json",
            async: true,
            error: function (xhr) { alert('서버통신 오류입니다'); },
            success: function (data) {
                if (data.complete == "_complete") {
                    document.getElementById('UEmail_Check').value = UEmail;
                    document.getElementById('UEmail_Show').value = UEmail;
                    document.getElementById('pop-register2').setAttribute('href', '#registerpop2');
                } else {
                    alert('동일한 이메일주소를 사용하는 사용자가 존재합니다.');
                    document.getElementById('pop-register2').setAttribute('href', '#registerpop1');
                }
            }
        });
    }

    
    function check_mobile() {
        var form = document.register;
        var UMbl0 = form.UMbl0.value;
        var UMbl1 = form.UMbl1.value;
        var UMbl2 = form.UMbl2.value;

        if (UMbl1 == "") {
            alert("휴대전화 번호를 입력해 주십시오.");
            form.UMbl1.focus();
            return;
        }

        if (UMbl2 == "") {
            alert("휴대전화 번호를 입력해 주십시오.");
            form.UMbl2.focus();
            return;
        }

        u_mbl = UMbl0 + "-" + UMbl1 + "-" + UMbl2;

        $.ajax({
            url: "/api/mobile_chk.asp",
            data: { mbl_no: u_mbl },
            dataType: "json",
            async: true,
            error: function (xhr) {
                alert('서버통신 오류입니다');
            },
            success: function (data) {
                if (data.complete != "") {
                    alert('기입하신 휴대전화 번호로 인증코드를 전송하였습니다 ');
                    form.UMbl_AuthNo.value = data.complete;
                    form.UMbl_Chk.value = u_mbl;
                    
                }
                else {
                    alert('휴대전화 번호가 정확하지 않습니다.');
                }
            }
        });

    }
//-->
</script>
</head>

<body>

<div id="header">
	<img src="img/login-logo.png" alt="eHepa" class="login-logo">
	<img src="img/logo-bms.png" alt="Bristol-Myers Squibb" class="login-BMSlogo">
</div>

<section>
<div id="wrapper">
	<div id="sub-bg">
		<div id="idWrapper">
			<div class="title">
				<ul>
					<li>Find Email/Password</li>
				</ul>
			</div>
			<div class="line"></div>
			<div class="idsearchwrapper">
					<div class="text">
						<h1> 아이디(이메일)찾기</h1>
						<p>선생님의 성함과 휴대폰 번호를 입력하시면 SMS로 선생님의 아이디를 발송해 드립니다.</p>
					</div>
					<div class="register">
						<ul>
							<li>
								성함
								<input type="text" name="i_Nm" id="i_Nm" style="width:100%;" placeholder="">
							</li>
							<li class="aa">
								휴대폰
								<dl>
								<dd><select name="i_Mbl0" id="i_Mbl0" style="width:86px">
								<option value="010">010</option>
								<option value="010">011</option>
                                <option value="016">016</option>
                                <option value="019">019</option>
							    </select>
								<input type="text" name="i_Mbl1" id="i_Mbl1" class="" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
								<input type="text" name="i_Mbl2" id="i_Mbl2" class="" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
								</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="btn">
						<a href="javascript:findEmail();" class="green button">확인</a><a href="./login.asp" class="grey button">취소</a>
					</div>
				</div>


				<div class="pwsearchwrapper">
					<div class="text">
						<h1>비밀번호찾기</h1>
						<p>선생님의 이메일과 휴대폰 번호를 입력하시면 SMS와 Email로 비밀번호를 발송해 드립니다.</p>
					</div>
					<div class="register">
						<ul>
							<li>
								이메일
								<input type="text" name="p_Email" id="p_Email" style="width:100%;" placeholder="">
							</li>
							<li class="aa">
								휴대폰
								<dl>
								<dd><select name="p_Mbl0" id="p_Mbl0" style="width:86px">
								<option value="010">010</option>
								<option value="011">011</option>
                                <option value="016">016</option>
                                <option value="019">019</option>
							    </select>
								<input type="text" name="p_Mbl1" id="p_Mbl1" class="" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
								<input type="text" name="p_Mbl2" id="p_Mbl2" class="" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
								</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="btn">
						<a href="javascript:findPWD();" class="green button">확인</a><a href="./login.asp" class="grey button">취소</a>
					</div>
				</div>
			<div class="m30"></div>
		</div>
	</div>
</div>
</div><!-- /#wrapper -->
</section>

<!--#include virtual="m/include/footer.asp" -->

</body>
</html>

