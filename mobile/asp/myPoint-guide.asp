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
									<li><h1>My Ponit</h1></li>
									<li>현재 선생님께서 보유하신 포인트를 확인하실 수 있습니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="mypointWrapper">
								<div class="mypoint-title">
									<em><h4>e-Hepa Academy의 My Point 는</h4></em>
									선생님들께서 수강하시는 강의나 확인하시는 컨텐츠 마다 각각 다른 양의 e-hepa Point가 적립되고, Point가 쌓을 수록 
									e-Hepa 나무가 열매를 맺는 모습을 보실 수 있습니다. <br>
									저희 BMS는 선생님들께서 키워주시는 e-Hepa 나무의 Point를 바탕으로 한 기부 캠페인을 통해 선생님과 함께 기업의 
									사회적 책임을 수행하고 함께 성장하는 기쁨을 실천하고자 합니다.
								</div>
								<div class="mypoint-detail">
									<div class="mypoint-img2">
										<img src="img/mypoint-img2.jpg" alt="">
									</div>
									<div class="mypoint-text">
										1 point = 1원으로 연말 12/31일 기준 도달하는 단계에 맞춘 금액을 사회복지단체에 donation하게 됩니다.
									</div>
									<table class="mypoint-board2">
										<thead>
											<tr>
												<td colspan="3">Point 적립기준</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="bold">항목</td>
												<td class="bold">Point</td>
												<td class="bold">비고</td>
											</tr>
											<tr>
												<td>Live 강의 수강</td>
												<td>8,000</td>
												<td>Live 강의 도중이라도 입장하면 즉시 적립/ 재 입장 하더라도 중복 적립은 되지 않음</td>
											</tr>
											<tr>
												<td>Live 강의 다시보기</td>
												<td>4,000</td>
												<td>강의실 입장 후 동영상을 Play하면 적립 (강의당 최초 1회)</td>
											</tr>
											<tr>
												<td>저널 리뷰</td>
												<td>3,000</td>
												<td>강의실 입장 후 음성파일을 Play하면 적립 (강의당 최초 1회)</td>
											</tr>
											<tr>
												<td>Special 강의</td>
												<td>3,000</td>
												<td>강의실 입장 후 음성파일을 Play하면 적립 (강의당 최초 1회)</td>
											</tr>
											<tr>
												<td>Content 확인</td>
												<td>1,000</td>
												<td>사이트내 컨텐츠를 확인하면 적립 (각 컨텐츠 당 최초 1회)</td>
											</tr>
											<tr>
												<td>로그인</td>
												<td>1,000</td>
												<td>사이트 로그인시 적립 (ID당 최초 1회)</td>
											</tr>
										</tbody>
									</table>
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

