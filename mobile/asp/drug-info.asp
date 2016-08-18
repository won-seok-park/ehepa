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
<script type="text/javascript">
$(document).ready(function() {
	//hiding tab content except first one
	$(".tabContent").not(":first").hide(); 
	// adding Active class to first selected tab and show 
	$("ul.tabs li:first").addClass("active").show();  
	
	// Click event on tab
	$("ul.tabs li").click(function() {
		// Removing class of Active tab
		$("ul.tabs li.active").removeClass("active"); 
		// Adding Active class to Clicked tab
		$(this).addClass("active"); 
		// hiding all the tab contents
		$(".tabContent").hide();		
		// showing the clicked tab's content using fading effect
		$($('a',this).attr("href")).fadeIn('slow'); 
		
		return false;
	});

});
</script>
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
									<li><h1>약품정보</h1></li>
									<li>e-Hepa Academy에서 제공하는 감염 관련 약품에 대한 정보입니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="drugTabs">
								<ul class="tabs">
									<li><a href="#tab1">다클린자</a></li>
									<li><a href="#tab2">순베프라</a></li>
									<li><a href="#tab3">바라크루드</a></li>
								</ul>
							</div>

							<div class="tabContainer">
								<div id="tab1" class="tabContent">
									<div class="drug-info">
										<div class="headtitle">
											다클린자정 60밀리그램
										</div>
										<img src="img/drug-DK.jpg">
										<ul>
											<li class="title">효능ᆞ효과</li>
											<li>대상성 간질환(간경변을 포함)을 가진 성인 환자에서 다른 약제와 병용하여 유전자형 1b형 만성 C형 간염의 치료</li>
											<li class="title">용법ᆞ용량</li>
											<li>1일 1회 60mg. 아수나프레비르 100mg(1일 2회)와 병용하여 24주간.</li>
											<li>기타 자세한 내용은 제품설명서 참조.</li>
											<li class="title">금기</li>
											<li>본제 및 그 성분에 과민증 기왕력자,</li>
											<li>병용 시, 병용 약물의 금기 사항이 본제에도 적용됨.</li>
											<li>임부, 임신이 의심되는 경우, </li>
											<li>CYP3A4를 강하게 유도하는 약물과의 병용</li>
											<li class="title">신중투여</li>
											<li>HCV 유전자형 1b형 바이러스가 L31(F, I, M, V) 또는 Y93H 부위에서 NS5A 유전다형성을 보인 자, </li>
											<li>단일요법 투여, </li>
											<li>정상 상한치(ULN)의 10배 이상 ALT 수준의 상승이 나타나는 경우, </li>
											<li>본제와 병용 투여 시 금기인 약물 <제품설명서 참조></li>
										</ul>
										<div class="drug-btn">
											<a href="#" class="grey button" style="width:100%">Full package insert</a>
											<a href="#" class="grey button" style="width:100%">브로슈어 다운로드</a>
											<a href="#" class="grey button" style="width:100%">보험 가이드라인</a>
										</div>
									</div>
								</div>
								<div id="tab2" class="tabContent">
									<div class="drug-info">
										<div class="headtitle">
											순베프라캡슐 100밀리그램
										</div>
										<img src="img/drug-SV.jpg">
										<ul>
											<li class="title">효능ᆞ효과</li>
											<li>대상성 간질환(간경변을 포함)을 가진 성인 환자에서 다클라타스비르와 병용하여 유전자형 1b형 만성 C형 간염의 치료.</li>
											<li class="title">용법ᆞ용량</li>
											<li>1일 2회 100mg. 다클라타스비르 60mg(1일 1회)와 병용하여 24주간. </li>
											<li>기타 자세한 내용은 제품설명서 참조.</li>
											<li class="title">금기</li>
											<li>본제 및 그 성분에 과민증 기왕력자, </li>
											<li>병용 시, 병용 약물의 금기 사항이 본제에도 적용됨. </li>
											<li>중증도 또는 중증 간장애 및 비대상성 간질환자</li>
											<li>사이토크롬 P450 효소 2D6 (CYP2D6)에 고의존성</li>
											<li>사이토크롬 P450 효소 3A(CYP3A4)를 유도하는 약물과의 병용</li>
											<li>사이토크롬 P450 효소 3A(CYP3A4)를 억제하는 약물과의 병용</li>
											<li>유기음이온전달단백질 1B1을 강하게 억제하는 약물과의 병용</li>
											<li class="title">신중투여</li>
											<li>HCV 유전자형 1b형 바이러스가 L31(F, I, M, V) 또는 Y93H 부위에서 NS5A 유전다형성을 보인 자, </li>
											<li>단일요법 투여, </li>
											<li>정상 상한치(ULN)의 10배 이상 ALT 수준의 상승이 나타나는 경우, </li>
											<li>본제와 병용 투여 시 금기인 약물 <제품설명서 참조></li>
										</ul>
										<div class="drug-btn">
											<a href="#" class="grey button" style="width:100%">Full package insert</a>
											<a href="#" class="grey button" style="width:100%">브로슈어 다운로드</a>
											<a href="#" class="grey button" style="width:100%">보험 가이드라인</a>
										</div>
									</div>
								</div>
								<div id="tab3" class="tabContent">
									<div class="drug-info">
										<div class="headtitle2">
											바라크루드 정 0.5밀리그램/ 1밀리그램,<br>바라크루드 시럽 
										</div>
										<img src="img/drug-BC.jpg">
										<ul>
											<li class="title2">효능ᆞ효과</li>
											<li>활동성 바이러스의 복제가 확인되고, 혈청 아미노전이효소(ALT 또는 AST)의 지속적 상승 또는 조직학적으로 활동성 질환이 확인된 성인(16세 이상)과 2세 이상의 소아 환자의 만성 B형 간염바이러스 감염의 치료.</li>
											<li class="title2">용법ᆞ용량</li>
											<li>성인: 1일 1회 공복 시 0.5mg. 엔테카비르 (시럽제의 경우 10 mL) </li>
											<li>16세 이상의 환자: 1일 1회 공복 시 엔테카비르 1mg (시럽제의 경우 20mL).</li>
											<li>신부전 환자 및 기타 자세한 내용은 제품설명서 참조.</li>
											<li class="title2">금기</li>
											<li>본제 및 그 성분에 과민증 기왕력자, </li>
											<li>갈락토오스 불내성, Lapp 유당분해효소 결핍증 또는 포도당-갈락토오스 흡수장애 등 유전적인 문제가 있는 환자.</li>
											<li class="title2">신중투여</li>
											<li>혈액투석 또는 복막투석(CAPD)을 받고 크레아티닌 청소율이 50 mL/min이하인자,</li>
											<li>싸이클로스포린이나 타크롤리무스 등을 투여 받고 있는 간이식 수여자</li>
										</ul>
										<div class="drug-btn">
											<a href="#" class="grey button" style="width:100%">Full package insert</a>
											<a href="#" class="grey button" style="width:100%">브로슈어 다운로드</a>
											<a href="#" class="grey button" style="width:100%">보험 가이드라인</a>
										</div>
									</div>
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

