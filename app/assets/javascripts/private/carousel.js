function initSlider() {
    $(".carousel").each(function () {
        var $carousel = $(this);
        var per_page = 3;
        var items = $carousel.find("li")
        var pages = Math.ceil(items.length / per_page);

        var page = 1, i = 0;
        // show current first 3

        while (i < 3) {
            $(items[i]).css({display: 'block'});
            initImageCarousel($(items[i]));
            i++;
        }
        i=0;
        while (i < items.length) {
            initImageCarousel($(items[i]));
            i++;
        }
        if (pages == 1) {
            // for one page adjust items
            adjustSlider($(items[0]), per_page - items.length);
        } else {
            // for multple pages show arrows and pagination
            $($carousel.parent().find(".rightarrow")).show();
            $($carousel.parent().find(".rightarrow")).attr("data-page", 2);
            $($carousel.parent().find(".leftarrow")).show();
            $($carousel.parent().find(".leftarrow")).attr("data-page", pages); //always last page (mean 2 page one behave strengly
            var $pag_nav = $($carousel.parent().find(".pag-nav"));
            i = 0;
            while (i < pages) {
                var $li = $('<li>');
                if (i == 0) {
                    $li.addClass("selected");
                }
                $li.attr("data-page", i + 1);
                $pag_nav.append($li);
                i++;
            }
            $pag_nav.show();
        }
    });
}

function switchPage($elem) {
    if ($elem.hasClass("selected")) {
        // already selected do nothing
        return false;
    }
    var $carousel;
    if ($elem.is('li')) {
        $carousel = $($($($elem.parent()).parent()).find(".carousel"));
    } else if ($elem.is('img')) {
        $carousel = $($elem.parent());
    }
    var per_page = 3;
    var items = $carousel.find("li")
    var pages = Math.ceil(items.length / per_page);
    var unindexed_page = Number($elem.attr('data-page'));
    var page = unindexed_page - 1, i = 0;
    var lower_limit = page * per_page - 1, upper_limit = (page + 1) * per_page;

    items.each(function () {
        if ($(this).index() > lower_limit && $(this).index() < upper_limit) {
            $(this).css({display: 'block'});

        } else {
            $(this).hide();
        }
    });

    //update selected
    $($carousel.parent()).find('.selected').removeClass('selected');
    $($carousel.parent()).find('.pag-nav li[data-page=' + unindexed_page + ']').addClass("selected");

    //update the page numbers for arrows
    if (unindexed_page > 1 && unindexed_page != pages) {
        $($carousel.parent().find(".rightarrow")).attr("data-page", unindexed_page + 1);
        $($carousel.parent().find(".leftarrow")).attr("data-page", unindexed_page - 1);
    } else if (unindexed_page == 1) {
        $($carousel.parent().find(".rightarrow")).attr("data-page", 2);
        $($carousel.parent().find(".leftarrow")).attr("data-page", pages);
    } else if (unindexed_page == pages) {
        $($carousel.parent().find(".rightarrow")).attr("data-page", 1);
        $($carousel.parent().find(".leftarrow")).attr("data-page", pages - 1);

        // adjust the slider
        if(items.length != pages * per_page){
            adjustSlider($(items[page * per_page]), pages * per_page - items.length);
        }

    }

}

function initImageCarousel($elem) {
    var imgaddress = $elem.children('img');
    if (imgaddress.length > 0) {
        $elem.css('background-image', 'url(' + imgaddress.attr('src') + ')');
    }


}

function adjustSlider($first_elem, delta) {
    var margin_left = 0, $link_elem = $($first_elem.find('.downloadlink')), offset = ($('.carousel').width() / 3  -30 - 50) / 2;
    var full_height = $first_elem.height() + parseInt($first_elem.css("padding-top"));

    if (delta == 1) {
        margin_left = full_height / 1.7;
    } else if (delta == 2) {
        margin_left = full_height + 30;
    }
    // adjust
    $link_elem.css({'margin-left': offset + 'px'});
    $first_elem.css({'margin-left': margin_left + 'px'});



    $($link_elem.parent()).hide().show();
}
