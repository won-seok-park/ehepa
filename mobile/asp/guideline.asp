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
<script language="javascript"> 
<!--
    function GoPage(go) {
        var form = document.Search;

        form.GoPage.value = go;
        form.action = "./guideline.asp";
        form.submit();
    }

    function SearchWord() {
        var form = document.Search;
        form.action = "./guideline.asp";
        form.submit();
    }
//-->
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
									<li><h1>치료지침</h1></li>
									<li>간염 진단 및 치료에 대한 최신 가이드라인을 만나보실 수 있습니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>
                        <% 
                            pagetype = Request("pagetype")
                            pageword = Request("pageword")

                            queryword = " categoryid='" & categoryid & "' and acayn='Y' "
                            if len(pageword) > 0 then
                                select case pagetype
                                case ""
                                    queryword = queryword & " and acatitle + '/' + acaauthor + '/' + acasource like '%" & PageWord & "%' "
                                case "1"
                                    queryword = queryword & " and acatitle like '%" & PageWord & "%' "
                                case "2"
                                    queryword = queryword & " and acaauthor '%" & PageWord & "%' "
                                case "3"
                                    queryword = queryword & " and acasource like '%" & PageWord & "%' "
                                end select
                            end if
                        %>
						<div class="contents">
							<div class="listWrapper">
								<div class="search">
									<form name="Search" method="post">
                                      <input type="hidden" name="acano" value="">
                                      <input type="hidden" name="categoryid" value="<%=categoryid %>">
                                      <input type="hidden" name="GoPage" value="">
                                      <select name="PageType" style="width:30%">
							            <option value="">전체</option>
							            <option value="1">제목</option>
                                        <option value="3">질환명</option>
						              </select>
						              <input type="text" name="PageWord" value="<%=PageWord%>" class="" style="width:38%">
						              <a href="javascript:SearchWord();" class="grey button2" style="width:28%">검색</a>
                                    </form>
								</div>
								
								<div class="list">
									<ul>
										<% 
                                        OrderStr = "order by acano desc"

	                                    GoPage = Request("GoPage")
	                                    if len(GoPage) = 0 or GoPage = "0" then
		                                    GoPage = 1
	                                    end if

	                                    PageSize = 10
                                        mPageSize = PageSize '페이지에 나열되는 레코드 수
	
	                                    mSQL = "select count(acano) from ehepa_academia_info as a where " & queryword
	                                    rsValue = GetSQLExecute(mSQL)
	
	                                    mTotalRecord = rsValue(0,0)	'전체 레코드수
	                                    mTotalPage = mTotalRecord \ mPageSize
	
	                                    if mTotalRecord mod mPageSize > 0 then
		                                    mTotalPage = mTotalPage + 1
	                                    end if

	                                    mTopRecordNum = mTotalRecord - (GoPage - 1) * mPageSize

	                                    mSQL = "select top " & mPageSize & " acano,acatitle,acaauthor,acasource,acapic,acasdate,acaedate,acatype,acafile1,acafile2 "
	                                    mSQL = mSQL & "from ehepa_academia_info AS A where acano Not IN ("
	                                    mSQL = mSQL & "select top " & ((GoPage - 1) * mPageSize) & " acano from ehepa_academia_info AS A where " & queryword & OrderStr & ") "
	                                    mSQL = mSQL & "and " & queryword & OrderStr

	                                    rsValue = GetSQLExecute(mSQL) 
	                                    if not isnull(rsValue) then
		                                    for i=0 to UBound(rsValue,2)

			                                    acano = rsValue(0,i)
			                                    acatitle = rsValue(1,i)
			                                    acaauthor = rsValue(2,i)
			                                    acasource = rsValue(3,i)
			                                    acapic = rsValue(4,i)
                                                acasdate = replace(rsValue(5,i),"-",".")
                                                acaedate = rsValue(6,i)
                                                acatype = rsValue(7,i)
                                                acafile1 = rsValue(8,i)
                                                acafile2 = rsValue(9,i)

		                                        idxNo = mTotalRecord - (GoPage-1) * mPageSize - i
                                        %>
                                        <li>
											<img src="data/guideline/01/guideline.jpg" alt="">
											<ul>
												<li class="color">B형간염</li>
												<li class="title">
													All guidelines agree that prevention of disease progression
													and improved liver histology are Goals of CHB Therapy1-3 *Living
												</li>
												<li>2015.05.21</li>
												<li>다운로드 용량 : 302kb</li>
												<li class="btn"><a class="grey button" href="#">미리보기</a><a class="grey button" href="#">다운로드</a></li>
											</ul>
										</li>
										<li>
											<%if len(acapic) > 0 then %><img src="/ufolder/academia/<%=acapic %>" /><%else %><img src="data/journal/01/journal.jpg" alt=""><%end if %>
											<ul>
												<li class="color"><%=acasource %></li>
												<li class="title">
													<%=acatitle %>
												</li>
												<li><%=acasdate %></li>
												<li class="btn"><a class="pop-patient-1 grey button" href="/setpoint.asp?acano=<%=acano %>&acaurl=<%=acafile1 %>" style="width:100%">보기</a></li>
											</ul>
										</li>
										<% 
                                            next
                                        else
                                        %>
                                        <li>
											<img src="data/journal/01/journal.jpg" alt="">
											<ul>
												<li class="color"></li>
												<li class="title">환자교육자료가 존재하지 않습니다.</li>
												<li></li>
												<li></li>
											</ul>
										</li>
                                        <%
                                        end if
                                        %>	
									</ul>
								</div>

								<!-- table pagination -->
					            <nav role="navigation">
						            <ul class="cd-pagination">
							            <%if mTotalPage > 1 then%>
                                        <%
		                                        mBlockSize = 10
		                                        mBlockPage = int((GoPage-1)/mBlockSize)*mBlockSize+1

		                                        if mBlockPage = 1 then
                                        %>
			                                        <li><a href="#0"><i class="fa fa-angle-left"></i></a></li>
                                        <%
		                                        else
                                        %> 
                                                    <li><a href="javascript:GoPage('<%=mBlockPage-mBlockSize%>');"><i class="fa fa-angle-left"></i></a></li>
                                        <%
		                                        end if

		                                        i=1
		                                        do until i > mBlockSize or mBlockPage > mTotalPage

			                                        if cint(GoPage) = cint(mBlockPage) then
                                        %> 
                                                    <li><a class="current" href="#0"><%=mBlockPage%></a></li>
                                        <%
			                                        else
                                        %> 
                                                    <li><a href="javascript:GoPage('<%=mBlockPage%>');"><%=mBlockPage%></a></li>
                                        <%
			                                        end if
			                                        mBlockPage = mBlockPage + 1
			                                        i = i + 1
		                                        loop
				
		                                        if mBlockPage > mTotalPage Then
                                        %>
			                                        <li><a href="#0"><i class="fa fa-angle-right"></i></a></li>
                                        <%
		                                        else
                                        %> 
		                                            <li><a href="javascript:GoPage('<%=mBlockPage%>');""><i class="fa fa-angle-right"></i></a></li>
                                        <%
		                                        end if
                                        %>
                                        <%else %>
                                        <li><a href="#0"><i class="fa fa-angle-left"></i></a></li>
							            <li><a class="current" href="#0">1</a></li>
							            <li><a href="#0"><i class="fa fa-angle-right"></i></a></li>
                                        <%end if %>
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

