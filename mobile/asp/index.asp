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
<link rel="stylesheet" href="css/slider.css">
<link rel="stylesheet" href="css/flyPanels.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/greensock.js"></script>
<script src="js/slider.transitions.js"></script>
<script src="js/slider.kreaturamedia.jquery.js"></script>	
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
						<div id="">
							<div id="slider-wrapper">
								<!-- Start Slider -->
								<div id="layerslider" style="width: 710px; height:456px; max-width: 710px;">
									<div class="ls-slide" data-ls="slidedelay: 7000; transition2d: 75,79;">
										<img src="img/m-banner01.jpg" class="ls-bg" alt="Slide background"/>
										<a href="participation.asp" class="ls-link"></a>
									</div>
									<div class="ls-slide" data-ls="slidedelay: 5000; transition2d: 5; timeshift: -1000;">
										<img src="img/m-banner02.jpg" class="ls-bg" alt="Slide background"/>
										<a href="journal.asp" class="ls-link"></a>
									</div>
								</div>
								<!-- End Slider -->
								<div id="mC-wrapper">
									<ul>
										<li>
											<div class="mc01">
												<a href="./reservation.asp">
													<ul>
														<li><img src="img/mc01.png" alt="e-Conference icon"></li>
														<li class="cline"></li>
														<li class="b">e-Conference</li>
														<li>최신자료와 함께 실시간 온라인 강의 청취</li>
													</ul>
												</a>
											</div>
										</li>
										<li>
											<div class="mc02">
												<a href="./drug-info.asp">
													<ul>
														<li><img src="img/mc02.png" alt="e-Academia icon"></li>
														<li class="cline"></li>
														<li class="b">e-Academia</li>
														<li>Hepatitis B, Hepatitis C 환자 치료와<br>관련된 유익한 정보 제공</li>
													</ul>
												</a>
											</div>
										</li>
										<li>
											<div class="mc03">
												<a href="./mycybercall.asp">
													<ul>
														<li><img src="img/mc03.png" alt="cybercall icon"></li>
														<li class="cline"></li>
														<li class="b">My CyberCall</li>
														<li>전체 CyberCall 목록 및 컨텐츠 확인</li>
													</ul>
												</a>
											</div>
										</li>
										<li>
											<div class="mc04">
												<ul>
													<li class="b">학회일정</li>
													<li class="cline"></li>
													<li>
														<ul>
															<%
                                                            mSQL = "select top 4 acano,acatitle,acaauthor,acasource,acapic,acasdate,acaedate,acatype,acafile1,acafile2 "
	                                                        mSQL = mSQL & "from ehepa_academia_info AS A where categoryid='06' and acasdate >= '" & date() & "' and acayn='Y' order by acasdate asc"
                            
                                                            rsValue = GetSQLExecute(mSQL) 
	                                                        if not isnull(rsValue) then
		                                                        for i=0 to UBound(rsValue,2)

			                                                        acano = rsValue(0,i)
			                                                        acatitle = rsValue(1,i)
			                                                        acaauthor = rsValue(2,i)
			                                                        acasource = rsValue(3,i)
			                                                        acapic = rsValue(4,i)
                                                                    acasdate = rsValue(5,i)
                                                                    acaedate = rsValue(6,i)
                                                                    acatype = rsValue(7,i)
                                                                    acafile1 = rsValue(8,i)
                                                                    acafile2 = rsValue(9,i)
                                                            %>
                                                            <li class="dot">
																<a href="./schedule.asp"><%=acatitle %></a><br>
																<%=Replace(acasdate,"-",".") %>
															</li>
                                                            <% 
                                                                next
                                                            else
                                                            %>
                                                            <li class="dot">
																<a href="./schedule.asp">최근 학회일정이 존재하지 않습니다.</a>
															</li>
                                                            <%
                                                            end if
                                                            %>
														</ul>
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
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
	<script>
		jQuery("#layerslider").layerSlider({
			thumbnailNavigation : 'disabled',
			skinsPath: 'css/skin/'
		});
	</script>


</body>
</html>

