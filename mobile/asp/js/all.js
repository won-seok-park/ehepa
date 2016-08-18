
    $(document).ready(function () {
        $('#pop-myPoint , #pop-speaker, #pop-reservation').magnificPopup({
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
			markup: '<div class="journal-pop">'+
					'<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div></div>'
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

		$("a[class*='pop-lecture-']").magnificPopup({
            type: 'iframe',
			iframe: {
			markup: '<div class="lecture-pop">'+
					'<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div></div>'
			 }  
        });

		$("a[class*='pop-patient-']").magnificPopup({
            type: 'iframe',
			iframe: {
			markup: '<div class="patient-pop">'+
					'<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div></div>'
			 }  
        });

		$("#pop-parti").magnificPopup({
            type: 'iframe',
			iframe: {
			markup: '<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" frameborder="0" scrolling="no" allowfullscreen></iframe>'+
                    '</div>'
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

