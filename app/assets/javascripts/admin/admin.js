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
//= require jquery.js
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){
    $(document).foundation();
    $(".expand_row").click(function(e){
        e.preventDefault();
        var thisrow = $('.extra_info[data-id="'+ $(this).data('id') +'"]');
        thisrow.toggle();
        if (thisrow.is(":visible")) $(this).html("&#9662;");
        else $(this).html("&#9656;");
    });
    $(".tablesorter").tablesorter({
        headers: {0:{sorter:false},
                  6:{sorter: 'digit'}
                }
    });
    $(".updates_table").tablesorter({
        sortList: [[0,0]]
    })
});
