<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/all.js"></script>
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
				<div class="register">
					<ul>
						<li>
							ID(이메일)
							<input type="text" name="" value="sample@naver.com" style="width:100%;" placeholder="">
						</li>
						<li>
							이름
							<input type="text" name="" style="width:100%;" placeholder="">
						</li>
						<li>
							비밀번호
							<input type="text" name="" style="width:100%;" placeholder="">
						</li>
						<li>
							비밀번호 확인
							<input type="text" name="" style="width:100%;" placeholder="">
						</li>
						<li class="aa">
							휴대폰
							<dl>
							<dd><select style="width:33%">
								<option value="1">010</option>
								<option value="2">011</option>
							</select>
							<input type="text" class="" style="width:32%" placeholder="">
							<input type="text" class="" style="width:32%" placeholder="">
							<a href="#" class="grey button" style="width:100%;">본인인증</a>
							</dd>
							</dl>
							<span>휴대폰번호 기입 후 본인인증 버튼을 눌러주세요.</span>
						</li>
						<li>
							인증번호
							<input type="text" name="" style="width:100%;" placeholder="휴대폰으로 받은 인증번호를 넣어주세요">
						</li>
						<li>
							소속병원
							<input type="text" name="" style="width:100%;" placeholder="">
						</li>
						<li>
							병원주소
							<input type="text" name="" style="width:100%;" placeholder="지번/도로명을 넣어주세요.">
							<a href="#" class="grey button" style="width:100%;">주소검색</a>
						</li>
					</ul>

				</div>
			</div>
			<div class="btn">
				<a href="register03.asp" class="green button">가입</a><a href="#" class="grey button">취소</a>
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

