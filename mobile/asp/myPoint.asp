<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/loginchk_m.asp" -->
<!--#include virtual="/include/conn.asp" -->
<!doctype html>
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

<!-- Start myPoint pop -->
      <div id="myPointpop" class="mfp-hide">
		 <div class="contents">
			<table class="myPointpop-board">
				<thead>
					<tr>
						<td colspan="3"><span><%=Request.Cookies("UNm") %></span> 선생님의 Point 적립내역</td>
					</tr>
				</thead>
				<tbody>
					<% 
                    uno = Request.Cookies("UNo")
                    t_point = 0

                    msql = "select top 50 umemo,upoint,pdd from ehepa_point_info where uno='" & UNo & "' order by pdd desc"
                    rsValue = getsqlexecute(msql)

                    if not isnull(rsValue) then
                        for i=0 to ubound(rsValue,2)
                    %>
                    <tr>
						<td><%=rsValue(2,i) %></td>
						<td><%=rsValue(0,i) %></td>
						<td><%=rsValue(1,i) %></td>
					</tr>
                    <% 
                            t_point = t_point + rsValue(1,i)

                        next
                    end if
                    %>
				</tbody>
			</table>
		</div>
      </div>
<!-- End myPoint pop -->


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
									e-Hepa Academy와 함께해주신 선생님의 모든 활동이 e-Hepa point로 적립되어 연 1회 국내 소외계층을 지원하는 
									사회공헌 비영리단체에 기부됩니다. 한국비엠에스제약은 e-Hepa point를 기반으로 기부 캠페인을 통해 선생님과 함께 
									기업의 사회적 책임을 수행하고 함께 나누는 기쁨을 실천하고자 합니다.
									<img src="img/visual-point.jpg" alt="" class="center">
								</div>
								<div class="mypoint-detail">
									<h3><%=Request.Cookies("UNm") %></h3> 선생님의 포인트 내역 
									<table class="mypoint-board">
										<thead>
											<tr>
												<td>점수</td>
												<td>등수</td>
												<td>레벨</td>
											</tr>
										</thead>
                                        <% 
                                        uno = Request.Cookies("UNo")

                                        msql = "select upoint from ehepa_member_info where uno = '" & Request.Cookies("UNo") & "'"
                                        rsValue = getsqlexecute(msql)

                                        if not isnull(rsValue) then
                                            my_point = rsValue(0,0) 
                                        else
                                            my_point = 0
                                        end if

                                        msql = "select count(uno) from ehepa_member_info where upoint > " & my_point & " and ugroup='AE'"
                                        rsValue = getsqlexecute(msql)

                                        if not isnull(rsValue) then
                                            my_rank = rsValue(0,0) + 1
                                        else
                                            my_rank = 1
                                        end if

                                        if total_point < 1000000 then
                                            point_desc = "레벨 1 나무 열매"
                                            m_level = "1"
                                        elseif (total_point >= 1000000 and  total_point < 3000000) then
                                            point_desc = "레벨 2 나무 열매"
                                            m_level = "2"
                                        elseif (total_point >= 3000000 and  total_point < 5000000) then
                                            point_desc = "레벨 3 나무 열매"
                                            m_level = "3"
                                        elseif (total_point >= 5000000 and  total_point < 7000000) then
                                            point_desc = "레벨 4 나무 열매"
                                            m_level = "4"
                                        elseif total_point > 7000000 then
                                            point_desc = "레벨 5 나무 열매"
                                            m_level = "5"
                                        end if
                                        %>
										<tbody>
											<tr>
												<td><%=formatnumber(my_point,0) %></td>
									            <td><%=my_rank %>위</td>
												<td><%=point_desc %></td>
											</tr>
										</tbody>
									</table>
									<div class="mypoint-btn">
										<a id="pop-myPoint" href="#myPointpop" class="button btn-mypoint-detail" style="width:100%">e-Hepa Point 적립 상세보기</a>
										<a href="myPoint-guide.asp" class="button btn-mypoint-guide" style="width:100%">e-Hepa Point 란</a>
									</div>
									<div class="mypoint-img">
										<img src="img/mp-level<%=m_level %>.jpg" alt="">
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

