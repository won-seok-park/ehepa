<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/loginchk_m.asp" -->
<!--#include virtual="/include/conn.asp" -->
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
</head>

<body data-debug="true">

<div class="flypanels-container">

		<div class="offcanvas flypanels-right">
			<div class="panelcontent" data-panel="treemenu">
				<!--#include virtual="m/include/nav.asp" -->
			</div>
		</div>

		<div class="flypanels-main">
			<div id="header" class="flypanels-topbar">
				<a id="pop-register-modify" href="./"><img src="img/login-logo.png" alt="eHepa" class="login-logo"></a>
				<a class="flypanels-button-right" data-panel="treemenu" href="#"><i class="fa fa-bars"></i></a>
			</div>
			<div class="flypanels-content">


				<section>
				<div id="wrapper">
					<div id="sub-bg">
						<div class="titleWrapper2">
							<div class="title">
								<ul>
									<li><h1>이용안내</h1></li>
									<li>e-Conference의 이용안내입니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="guideWrapper">
								<div class="guide-title">
									<em><h4>e-Hepa Academy의 e-Conference 는</h4></em>
									시공간의 제약 없이 간염 관련 최신 컨텐츠로 선생님들의 진료실로 찾아갑니다.<br> 
									해당 강의는 국내외 유수의 연자들을 모시고 생방송으로 진행되며, 강의 종료 후 동영상으로 시청 가능합니다. 
								</div>
								<div class="guide-detail">
									<div class="guide-img">
										<img src="img/guide-img.jpg" alt="">
									</div>
									e-conference는 국내외 유수의 인사들을 모시고 간염 관련 최신 지견에 대해 실시간 온라인 강연과 의견을 교환하는 프로그램입니다. <br>
									강의 종료 후, 해당 강의는 동영상으로 시청 가능합니다. 
									<div class="list"><em><h4>e-Conference 이용순서</h4></em></div>
									<ul>
										<li>1. e-Hepa Academy에 접속합니다.</li>
										<li>2. <span>“e-Conference”</span> 페이지로 이동합니다. </li>
										<li>3. <span>“예약하기”</span> 페이지로 이동하셔서 강의일정 리스트를 확인하신 후 원하시는 강의의 <span>“예약하기”</span> 버튼을 누릅니다.</li>
										<li>4. 강의 예약이 완료되면 선생님께 강의정보에 대한  SMS/e-mail이 전송됩니다. 확인 하신 후 예약하신 강의 당일에 강의를 시청하시면 됩니다.</li>
										<li>5. 사전 예약을 하지 않으신 선생님께서는 <span>“참여하기”</span> 페이지로 이동하시면 당일 열리는 e-Conference에 바로 참여하실 수 있습니다. </li>
									</ul>
								</div>
							</div>
						</div> 

					</div>
				</div><!-- /#wrapper -->
				</section>


				<!--#include virtual="m/include/footer.asp" -->

			</div><!-- /.flypanels-content -->

		</div><!-- /.flypanels-main -->

</div><!-- /.flypanels-container -->

	<script src="js/kitUtils.js"></script>
	<script src="js/jquery.flypanels.js"></script>
	<script src="js/fastclick.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.flypanels-container').flyPanels({
				treeMenu: {
					init: true
				},
			});
			FastClick.attach(document.body);
		});
	</script>
</body>
</html>

