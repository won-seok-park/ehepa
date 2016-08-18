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
<script src="js/accordion.js"></script>
<script src="js/all.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
		$(".accordion").smk_Accordion({
			closeAble: true, //boolean
		});
		$(".tabContent").not(":first").hide(); 
		$("ul.faqs li:first").addClass("active").show();  	
		$("ul.faqs li").click(function() {
			$("ul.faqs li.active").removeClass("active"); 
			$(this).addClass("active"); 
			$(".tabContent").hide();		
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
						<div class="titleWrapper">
							<div class="title">
								<ul>
									<li><h1>FAQ</h1></li>
									<li>e-Hepa의 FAQ입니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="yearTabs">
								<ul class="faqs">
									<li><a href="#tab1">서비스 관련</a></li>
									<li><a href="#tab2">e-Conference 관련</a></li>
								</ul>
							</div>
							<div class="tabContainer">
								<div id="tab1" class="tabContent">
									<!-- Start faq  서비스관련 -->
									<div class="faq-inner">
										<div class="accordion">
											<div class="accordion_in">
												<div class="acc_head">Q. 인터넷 익스플로러에서 웹사이트가 제대로 보이지 않아요</div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>
											<div class="accordion_in">
												<div class="acc_head">Q. e-Conference참여는 어떻게 하나요?</div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>
											<div class="accordion_in">
												<div class="acc_head">Q. 강의 일정이 궁금합니다.</div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>
											<div class="accordion_in">
												<div class="acc_head">Q. 듣고 싶은 강의가 있는데, 당일 강의 일정에 맞춰 참여하면 되나요?</div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>
											<div class="accordion_in">
												<div class="acc_head">Q. 회원가입 시 입력하였던 이메일 주소가 기억나지 않습니다. </div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>
											<div class="accordion_in last">
												<div class="acc_head">Q. 회원가입 시 입력하였던 비밀번호가 기억나지 않습니다.</div>
												<div class="acc_content">
													인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
													인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
													또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
													1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
													2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
													3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
													4. 닫기를 클릭합니다.
												</div>
											</div>

										</div>
										<!-- End faq 서비스관련 -->
										</div>
									</div>
									<div id="tab2" class="tabContent">
										<!-- Start faq e-Conference 프로그램 접속 관련-->
										<div class="faq-inner">
											<div class="accordion">
												<div class="accordion_in">
													<div class="acc_head">Q. 인터넷 익스플로러에서 웹사이트가 제대로 보이지 않아요</div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
												<div class="accordion_in">
													<div class="acc_head">Q. e-Conference참여는 어떻게 하나요?</div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
												<div class="accordion_in">
													<div class="acc_head">Q. 강의 일정이 궁금합니다.</div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
												<div class="accordion_in">
													<div class="acc_head">Q. 듣고 싶은 강의가 있는데, 당일 강의 일정에 맞춰 참여하면 되나요?</div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
												<div class="accordion_in">
													<div class="acc_head">Q. 회원가입 시 입력하였던 이메일 주소가 기억나지 않습니다. </div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
												<div class="accordion_in last">
													<div class="acc_head">Q. 회원가입 시 입력하였던 비밀번호가 기억나지 않습니다.</div>
													<div class="acc_content">
														인터넷 익스플로러에서 웹사이트가 제대로 보이지 않는 경우, 먼저 브라우저 버전을 확인해주세요.<br>
														인터넷 익스플로러 7 이하인 경우, 8 이상으로 업그레이드하셔야 합니다.<br>
														또한 호환성 보기가 설정되어있는지 확인해주세요.<br>
														1. 브라우저 상단에서 도구 메뉴를 열고 호환성 보기 설정을 선택합니다. 메뉴 바를 표시하려면 Alt 키를 누르거나 주소표시줄을 길게 눌러야 할 수 있습니다.<br>
														2. '호환성 보기에 추가한 웹사이트' 목록에서 'e-Hepa.co.kr'이 있는지 확인합니다. 목록에 'e-Hepa.co.kr'이 있으면 제거를 클릭합니다.<br>
														3. 창 하단에서 'Microsoft의 업데이트된 웹사이트 목록 포함'과 '호환성 보기에서 모든 웹사이트 표시' 옆의 확인란이 선택 취소되어 있는지 확인합니다.<br>
														4. 닫기를 클릭합니다.
													</div>
												</div>
											</div>
										</div>
										<!-- End faq e-Conference 프로그램 접속 관련-->
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

