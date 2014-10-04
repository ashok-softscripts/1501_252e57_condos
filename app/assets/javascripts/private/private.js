// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require private/carousel
$(function () {
    scaleApp();
    $('.goToHome').click(function () {
        goToByScroll('#section-home');
    });
    $('.goToResidences').click(function () {
        goToByScroll('#section-residence');
    });
    $('.goToDetails').click(function () {
        goToByScroll('#section-details');
    });
    $('.goToVidImg').click(function () {
        goToByScroll('#section-vidimg');
    });
    $('.goToUpdates').click(function () {
        goToByScroll('#section-updates');
    });
    $('#scrolldown').click(function () {
        goToByScroll('#section-residence');
    });
    $('.close').click(function () {
        $($(this).parent()).removeClass("open");
        $('.overlay-gallery, #overlay-privacy, #overlay-video').hide();
        var videosrc = $("#overlay-video iframe").attr("src");
        $("#overlay-video iframe").attr('src', '');
        $("#overlay-video iframe").attr('src', videosrc);
    });
    initSlider();
    $(".rightarrow").click(function () {
        switchPage($(this));
    });
    $(".leftarrow").click(function () {
        switchPage($(this));
    });
    $(".pag-nav li").click(function () {
        switchPage($(this));
    });
    $("[data-gallery]").click(function () {
        showGallery($(this));
    });

    $("[data-video]").click(function () {
        showVideo($(this));
    });
    $("[data-pdf]").click(function () {
        var link = $(this).data('pdf');
        window.open(link);
    });
});

function showVideo($elem) {
    var $video_overlay = $("#overlay-video");
    var $player = $($video_overlay.children('iframe'));
    var $data_elem = $("[data-video_data='" + $elem.data('video') + "']");
    $player.attr("src", $data_elem.data('video_url'));
    $video_overlay.show();
}
$(window).on('scroll', function () {
    var y_scroll_pos = window.pageYOffset;
    var scroll_pos_test = 600;

    if (y_scroll_pos > scroll_pos_test) {
        $('#nav-main').css('top', 0);
    } else {
        $('#nav-main').css('top', -75);
    }
});

function showGallery($elem) {
    var gallery = $("[data-gallery_data='" + $elem.data('gallery') + "']");

    var imgaddress, i = 0;
    $(gallery).find('.gallery li').each(function () {
        imgaddress = $(this).children('img').attr('src');
        $(this).css('background-image', 'url(' + imgaddress + ')');
        if (i == 0) {
            $(this).addClass("selected");
        }
        i++;
    });
    $(gallery).addClass("open");
    $(".open [data-gallery_index]").off('click');
    $(".open [data-gallery_index]").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        switchGallery($(this));
    });

    $(gallery).show();

    centerContainerHoriz('.gallery-pag', 0);
    var $left_arrow = $(".open .left_arrow"),
        $right_arrow = $(".open .righ_arrow"),
        current=$(gallery).attr("data-gallery_current"),
        gallery_length = $(gallery).data("gallery_length") ;

    setGalleryArrow($left_arrow, $right_arrow, current, gallery_length);
}
function setGalleryArrow($left_arrow, $right_arrow, current, gallery_length){
    if (gallery_length== 1){
        $left_arrow.hide();
        $right_arrow.hide();
    }else{
        if(current  < gallery_length - 1 ){
            $right_arrow.attr("data-gallery_index", current*1 + 1);
        }else{
            $right_arrow.attr("data-gallery_index", 0);
        }
        if( current == 0 ){
            $left_arrow.attr("data-gallery_index",  gallery_length*1 - 1);
        }else{
            $left_arrow.attr("data-gallery_index",  current*1 - 1);
        }
    }
}
function switchGallery($elem) {
    var $gallery = $($("[data-gallery_data='" + $elem.data('gallery') + "']"));
    //find current selected
    $gallery.find(".selected").each(function () {
        $(this).removeClass("selected")
    });

    $gallery.find("[data-gallery_image='" + $elem.attr('data-gallery_index') + "']").addClass("selected");
    $gallery.attr("data-gallery_current",$elem.attr('data-gallery_index'));
    //nav
    $gallery.find('[data-gallery_index="'+ $elem.attr('data-gallery_index') +'"]').addClass("selected");
    setGalleryArrow($(".open .left_arrow"), $(".open .righ_arrow"), $gallery.attr("data-gallery_current"), $gallery.data("gallery_length"));
}

function scaleApp() {

// DYNAMICALLY POSITION ELEMENTS ************************

    // HOME ///////

    centerContainerHoriz('#logo', 0);
    centerContainerHoriz('#scrolldown', 0);
    centerContainerHoriz('#section-home>.content-box', 0);
    centerContainerHoriz('#nav-main-buttons', -70);
    centerContainerHoriz('#nav-home-buttons', 0);

    var content_height = ($('#section-home>.content-box').height() - $('#home-content').height()) / 2;
    $('#home-content').css('margin-top', content_height);


    // TITLES ///////

    centerContainerHoriz('#section-residence>.section-title', 0);
    centerContainerHoriz('#section-details>.section-title', 0);
    centerContainerHoriz('#section-vidimg>.section-title', 0);
    centerContainerHoriz('#section-updates>.section-title', 0);

    alignCarousel();
}

function alignCarousel(){
    // CAROUSEL SIZE /////////
    var carousel_height = 280,
        carousel_width = 900;
    if ($(window).width() < 1060) {
        carousel_width = $(window).width() - 160;
        carousel_height = ($('.carousel').width() / 3) - 20;
    }
    $('.carousel').css('width', carousel_width);
    $('.carousel').css('height', carousel_height);
    centerContainerHoriz('.carousel', 0);
    centerContainerVerti('.carousel', -100);

    $('.leftarrow').css('top', ((carousel_height - 60) / 2));
    $('.rightarrow').css('top', ((carousel_height - 60) / 2));
    var item_width  = carousel_width / 3 - 30;
    $('.downloadlink').css('margin-left', ((item_width - 50) / 2));

    var itemtoppadding = ((carousel_height - 180) / 2);
    $('#carousel-residence>ul>li').css('padding-top', itemtoppadding);

    itemtoppadding = ((carousel_height - 60) / 2);
    $('#carousel-details>ul>li').css('padding-top', itemtoppadding);
    $('#carousel-vidimg>ul>li>.overlay').css('padding-top', itemtoppadding - 15);

    var itemtoppadding = ((carousel_height- 80) / 2);
    $('#carousel-updates>ul>li').css('padding-top', itemtoppadding);

    centerContainerHoriz('#residence-pag', 0);
    centerContainerHoriz('#details-pag', 0);
    centerContainerHoriz('#vidimg-pag', 0);
    centerContainerHoriz('#updates-pag', 0);
    centerContainerHoriz('.gallery-pag', 0);
    centerContainerHoriz('#updates-pag', 0);
}

function initGallery(id) {
    var imgaddress;
    var imgalt;

    $(id + '> li').each(function () {
        imgaddress = $(this).children('img').attr('src');
        imgalt = $($(this).children('img')).attr('alt');
        $(this).css('background-image', 'url(' + imgaddress + ')');
        $($(this).find('span')).text(imgalt);
        console.log(imgalt);
    });
}

function centerContainerHoriz(id, offset) {
    $(id).css('left', (($(window).width() - ($(id).outerWidth() + (offset))) / 2));
}

function centerContainerVerti(id, offset) {
    $(id).css('top', (($('.section').height() - ($(id).outerHeight() + (offset))) / 2));
}

function goToByScroll(id) {
    $('html,body').animate({
        scrollTop: ($(id).offset().top - 60)}, 'slow');
}
$(window).load(function(){
    scaleApp();
});
$(window).resize(function () {
    scaleApp();
});

