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
									<li><h1>CyberCall 목록</h1></li>
									<li>내 담당자가 보낸 CyberCall 목록을 확인하실 수 있습니다. </li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="listWrapper">
								<div class="search">
									<select style="width:30%">
										<option value="1">전체</option>
										<option value="2">011</option>
									</select>
									<input type="text" class="" style="width:38%">
									<a href="#" class="grey button2" style="width:28%">검색</a>
								</div>
								
								<div class="list">
									<ul>
										<li>
											<img src="data/old-lecture/01/lecture.jpg" alt="">
											<ul>
												<li class="color">장기간 치료</li>
												<li class="title">만성 B형 간염의 진단, 치료 그리고 관리 (실제 증례 중심) 주제로 강의. Chapter8 : 장기간 치료.</li>
												<li>한양의대 전대원 교수</li>
												<li>영업담당자 : 홍길동</li>
												<li>2015.05.21</li>
												<li class="btn"><a class="pop-lecture-1 grey button" href="data/old-lecture/01/01.asp" style="width:100%">영상보기</a></li>
											</ul>
										</li>
										<li>
											<img src="data/old-lecture/02/lecture.jpg" alt="">
											<ul>
												<li class="color">장기간 치료</li>
												<li class="title">만성 B형 간염의 진단, 치료 그리고 관리 (실제 증례 중심) 주제로 강의. Chapter8 : 장기간 치료.</li>
												<li>한양의대 전대원 교수</li>
												<li>영업담당자 : 홍길동</li>
												<li>2015.05.21</li>
												<li class="btn"><a class="pop-lecture-2 grey button" href="data/old-lecture/02/02.asp" style="width:100%">영상보기</a></li>
											</ul>
										</li>
									</ul>
								</div>

								<!-- table pagination -->
								<nav role="navigation">
									<ul class="cd-pagination">
										<li><a href="#0"><i class="fa fa-angle-left"></i></a></li>
										<li><a class="current" href="#0">1</a></li>
										<li><a href="#0">2</a></li>
										<li><a href="#0">3</a></li>
										<li><a href="#0">4</a></li>
										<li><a href="#0"><i class="fa fa-angle-right"></i></a></li>
									</ul>
								</nav>
								<!-- / table pagination -->
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

