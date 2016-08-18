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
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/flyPanels.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/respond.js"></script>
<script src="js/all.js"></script>
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
						<div class="titleWrapper">
							<div class="title">
								<ul>
									<li><h1>참여하기</h1></li>
									<li>당일 진행되는 e-Conference에 참여하실 수 있습니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="participationWrapper">
								<div class="bg">
									<img src="img/00.jpg">
								</div>
								<a href="#" class="purple p-button">강의입장</a>
								<div class="program">
									<a id="pop-parti" href="mr-info.asp" class="grey small button">영업담당자</a><a href="#" class="grey small button">프로그램수동설치</a>
								</div>
								<div class="comment">
									<ul>
										<li><span>&middot;</span> e-Conference 강의 입장은 당일 30분 전부터 가능합니다.</li>
										<li><span>&middot;</span> 만약 접속에 문제가 있으시면 <a href="faq.asp">여기</a>를 클릭해주세요. FAQ 페이지로 이동 됩니다.</li>
										<li><span>&middot;</span> 설치 문의는 기술지원팀 02-2007-5425으로 연락바랍니다.</li> 
									</ul>
								</div>
							</div>
						</div> 

					</div><!-- /#sub-bg -->
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
