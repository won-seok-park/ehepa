
  $(document).ready(function () {
    //네비게이션
    var header_wrap = $('#header_wrap');
    var container_wrap = $('#container');
    var menu1depth = $('.gnb>ul>li');
    var menu2depth = $('.gnb>ul>li>ul>li');

    // 1Depth 활성화 및 GNB보이기
    menu1depth.on({
      mouseenter: function() {
        $(this).addClass('on').siblings('li').removeClass('on');
        $(this).siblings('li').find('li').removeClass('on');
        gnb_open();
      },
      focusin: function() {
        $(this).addClass('on').siblings('li').removeClass('on');
        $(this).siblings('li').find('li').removeClass('on');
        gnb_open();
      }
    });
    // 2Depth 활성화 및 GNB보이기
    menu2depth.on({
      mouseenter: function() {
        $(this).addClass('on').siblings('li').removeClass('on');
      },
      focusin: function() {
        $(this).addClass('on').siblings('li').removeClass('on');
      }
    });

    // GNB열기 Animation 함수
    function gnb_open() {
      header_wrap.css({'position':'fixed', 'z-index':'100'}).stop().animate({'height':'345px'}, 300);
      container_wrap.css('padding-top', '114px');
    }
    // GNB닫기 Animation 함수
    function gnb_close() {
      header_wrap.stop().animate({'height':'114px'}, 300, function() {
        $(this).css('position', 'relative');
        container_wrap.css('padding', '0 0 0 0');
      });
    }
    // GNB다시 열기 Animation 함수 : 탭키 이동을 했을 경우 순간 GNB가 열려야 하므로 애니메이션을 부여하지 않음.
    function gnb_reverse() {
      header_wrap.css({'position':'fixed', 'height':'345px', 'z-index':'100'});
      container_wrap.css('padding-top', '114px');
    }

    // 본문영역에 마우스 커서가 들어가거나 포커스가 이동하면 GNB를 닫는다.
    container_wrap.on({
      mouseenter: function() {
        gnb_close();
        menu1depth.removeClass('on');
        menu2depth.removeClass('on');
      },
      focusin: function() {
        gnb_close();
        menu1depth.removeClass('on');
        menu2depth.removeClass('on');
      }
    });

    // GNB영역 왼쪽에 있는 배너에 포커스가 이동하면 GNB를 보인다.
    $('.gnb_banner').on({
      mouseenter: function() {
        gnb_reverse();
      },
      focusin: function() {
        gnb_reverse();
      }
    });
    // GNB 보이기/감추기 : e

    //팝업
    $('#pop_reg_step1, #pop_reg_step2, #pop_reg_step3, #pop-id-search, #pop_reg_modify, #pop_mp , .pop_speaker, #pop_reservation').magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in'
    });

		$("a[class*='patient-pop-']").magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
    });

		$("a[class*='pop-journal-']").magnificPopup({
            type: 'iframe',
			iframe: {
			markup: '<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div>'
			 }
    });

		$("a[class*='pop-cybercall-']").magnificPopup({
            type: 'iframe',
			iframe: {
			markup: '<div class="cybercall-pop">'+
					'<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div></div>'
			 }
    });

    $(function () {
        $(document).on('click', '.popup-modal-close', function (e) {
            e.preventDefault();
            $.magnificPopup.close();
        });
    });
    $(function () {
        $('input, textarea').placeholder();
    });

  });
