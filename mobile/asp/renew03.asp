<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery-1.11.0.min.js"></script>

<!--자동완성-->
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!--자동완성-->
<script language="JavaScript">
<!--
    function goRegister() {

        var form = document.register;
        var UNm = form.UNm.value;
        var UPWD0 = form.UPWD0.value;
        var UPWD1 = form.UPWD1.value;
        var UMbl0 = form.UMbl0.value;
        var UMbl1 = form.UMbl1.value;
        var UMbl2 = form.UMbl2.value;
        var UMbl_No = form.UMbl_No.value;
        var UMbl_AuthNo = form.UMbl_AuthNo.value;
        var UMbl_Chk = form.UMbl_Chk.value;
        var UHosp = form.UHosp.value;
        var UAddr = form.UAddr.value;

        if (UNm == "") {
            alert("이름을 입력해 주십시오.");
            form.UNm.focus();
            return;
        }
        if (UPWD0 == "") {
            alert("비밀번호를 입력해 주십시오.");
            form.UPWD0.focus();
            return;
        }

        if (UPWD0.length < 4 || UPWD0.length > 10) {
            alert("사용할 비밀번호는 4~12자리입니다!!!");
            form.UPWD0.focus();
            return;
        }

        if (UPWD1 == "") {
            alert("비밀번호 확인를 입력해 주십시오.");
            form.UPWD1.focus();
            return;
        }
        if (UPWD0 != UPWD1) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
            form.UPWD1.focus();
            return;
        }

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

        if (UMbl_No == "") {
            alert("본인 인증 번호를 입력해 주십시오.");
            form.UMbl_No.focus();
            return;
        }

        if (UMbl_No != UMbl_AuthNo) {
            alert("본인 인증번호가 일치하지 않습니다.");
            form.UMbl_No.focus();
            return;
        }

        UMbl = UMbl0 + "-" + UMbl1 + "-" + UMbl2;
        if (UMbl != UMbl_Chk) {
            alert("인증된 핸드폰 번호가 아닙니다. 다시 본인인증을 진행해 주십시오.");
            form.UMbl_No.focus();
            return;
        }

        if (UHosp == "") {
            alert("소속병원명을 입력해 주십시오.");
            form.UHosp.focus();
            return;
        }

        var flag = window.confirm("기입하신 정보로 인증절차를 진행하시겠습니까?");

        if (flag) {
            form.action = "./renew_ok.asp";
            form.submit();
        }
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

    function MblNumStr(str) {
        var RegNotNum = /[^0-9]/g;
        var RegPhonNum = "";
        var DataForm = "";

        // return blank     
        if (str == "" || str == null) return "";

        // delete not number ㅋ 
        str = str.replace(RegNotNum, '');

        if (str.length < 4) return str;

        if (str.length > 3 && str.length < 7) {
            DataForm = "$1-$2";
            RegPhonNum = /([0-9]{3})([0-9]+)/;
        } else if (str.length == 7) {
            DataForm = "$1-$2";
            RegPhonNum = /([0-9]{3})([0-9]{4})/;
        } else if (str.length == 10) {
            DataForm = "$1-$2-$3";
            RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
        } else {
            DataForm = "$1-$2-$3";
            RegPhonNum = /([0-9]{3})([0-9]{4})([0-9]+)/;
        }

        while (RegPhonNum.test(str)) {
            str = str.replace(RegPhonNum, DataForm);
        }
        return str;
    }

    function MaskMbl(obj) {
        obj.value = MblNumStr(obj.value);
    }
    
    //비밀번호 유효성 체크
		
		function checkusrpwd() {
			var form = document.register;
			var UPWD0 = form.UPWD0.value;  
			//alert(usrpwd);
			
	  //var reg_pwd = /^(?=\w{4,20}$)(?=.*\d)(?=.*[a-z]).*/;
			
			var reg_pwd = /^(?=.*[a-z])(?=.*[0-9]).{4,20}$/;

 		
			
			if(!reg_pwd.test(UPWD0)){

			  form.return_usrpwd.style.color = "red";
      	form.return_usrpwd.value = "* 비밀번호는 영문,숫자 조합 4자리 이상입니다.";
        form.UPWD0.focus();
				return; 
			
			 } else {
			 	form.return_usrpwd.style.color = "green";
				form.return_usrpwd.value = "* 올바른 형식의 비밀번호 입니다."
			 }
						
		}
	
		
		function checksamepwd() {
			var form = document.register;
			var UPWD0  = form.UPWD0.value;  
			var UPWD1 = form.UPWD1.value;
			
			//alert(usrpwd);
			
			
			
			if(UPWD0 != UPWD1 ){

			  form.return_usrpwd_con.style.color = "red";
      	form.return_usrpwd_con.value = "* 입력하신 비밀번호가 일치하지 않습니다.";
        form.UPWD1.focus();
				return; 
			
			 } else {
			 	form.return_usrpwd_con.style.color = "green";
				form.return_usrpwd_con.value = "* 비밀번호가 일치합니다."
			 }
						
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
		<div id="registerWrapper">
			<div class="title">
				<ul>
					<li>Register</li>
				</ul>
			</div>
			<div class="line"></div>
			<div class="wrapper">
				<div class="text">
					회원 가입 후, e-Hepa Academy의 모든 컨텐츠 이용이 가능합니다.
				</div>
				<form name="register" method="post">
                <input type="hidden" name="UEmail" id="UEmail" value="<%=Request("UEmail") %>" />
                <input type="hidden" name="UNo" id="UNo" value="<%=Request("UNo") %>" />
                <input type="hidden" name="UMbl_AuthNo" id="UMbl_AuthNo" value="" />
                <input type="hidden" name="UMbl_Chk" id="UMbl_Chk" value="" />
                <div class="register">
					<ul>
						<li>
							ID(이메일)
							<input type="text" name="" style="width:100%;" placeholder="" value="<%=Request("UEmail") %>" disabled>
						</li>
						<li>
							이름
							<input type="text" name="UNm" maxlength="25" value="<%=Request("UNm") %>" style="width:100%;" placeholder="">
						</li>
						<li>
							비밀번호
							<input type="password" name="UPWD0" style="width:100%;" placeholder="" onkeyup="javascript:checkusrpwd();">
							<input type="text" id="return_usrpwd" name="return_usrpwd" value="" style="font-size:11px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;width:230px;" tabindex="-1" readonly >
						</li>
						<li>
							비밀번호 확인
							<input type="password" name="UPWD1" style="width:100%;" placeholder=""  onkeyup="javascript:checksamepwd();">
							<input type="text" id="return_usrpwd_con" name="return_usrpwd_con" value="" style="font-size:11px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;width:220px;"  tabindex="-1" readonly >
						</li>
						<li class="aa">
							휴대폰
							<dl>
							<dd><select name="UMbl0" style="width:100px">
						        <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
						        <option value="019">019</option>
					        </select>
							<input type="text" name="UMbl1" class="" maxlength="4" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
							<input type="text" name="UMbl2" class="" maxlength="4" style="width:32%" placeholder="" onkeydown='javascript:MaskMbl(this);'>
							<a href="javascript:check_mobile();" class="grey button" style="width:100%;">본인인증</a>
							</dd>
							</dl>
							<span>휴대폰번호 기입 후 본인인증 버튼을 눌러주세요.</span>
						</li>
						<li>
							인증번호
							<input type="text" name="UMbl_No" class="" maxlength="4" style="width:100%;" placeholder="휴대폰으로 받은 인증번호를 넣어주세요" onkeydown='javascript:MaskMbl(this);'>
						</li>
						<li>
							소속병원
							<input type="text" name="UHosp" id="UHosp" style="width:100%;" placeholder="">
						</li>
						<li>
							병원주소
							<a href="#" onclick="javascript:sample2_execDaumPostcode();" class="grey button" style="width:100%;">주소검색</a>
							<input type="text" maxlength="100" name="UZip" id="UZip"class="" value="<%=UZip%>" style="width:100%" placeholder="우편번호">
							<input type="text" maxlength="100" name="UAddr" id="UAddr" value="<%=UAddr%>" class="" style="width:100%;" placeholder="주소">
							<!--<input type="text" name="UAddr" style="width:100%;" placeholder="지번/도로명을 넣어주세요.">-->
							<input type="text" maxlength="200" name="UAddr2" id="UAddr2" value="<%=UAddr2%>" class="" style="width:100%;margin-top:3px;" placeholder="세부주소">
							
						</li>
                        <li>
							담당자코드(Optional)
							<input type="text" name="UUpNo" id="UUpNo" maxlength="4" style="width:100%;" placeholder="4자리 숫자인 담당자 코드를 넣어주세요." onkeydown='javascript:MaskMbl(this);'>
						</li>
					</ul>
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1200;-webkit-overflow-scrolling:touch;" >
						<img src="http://i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1200" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
				</div>
                </form>
			</div>
			<div class="btn">
				<a href="javascript:goRegister();" class="green button">가입</a><a href="./login.asp" class="grey button">취소</a>
			</div>

			<div class="m30"></div>
		</div>
	</div>
</div><!-- /#wrapper -->
</section>

<!--#include virtual="m/include/footer.asp" -->
</div>

</body>
</html>



<!--우편번호 팝업을 위한 js-->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('UZip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('UAddr').value = fullAddr;
                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%'
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 460; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<!---자동완성-->
<script>
  $(function() {
    var availableTags = [
    
<% 
		 mSQL = ""
	    mSQL = mSQL & "select distinct hospital From eHepa_Hospital_Info order by hospital desc"
		 rsValue = GetSQLExecute(mSQL) 
	    	if not isnull(rsValue) then
		   	for i=0 to UBound(rsValue,2)
%>    
    	"<%=rsValue(0,i)%>",
<%
				next
			end if
%>
			"BMS 병원"
    ];
    $( "#UHosp" ).autocomplete({
      source: availableTags
    });
  });
  </script> 
  <!---자동완성-->