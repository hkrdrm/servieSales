$(function() {
    $("td[colspan=5]").find("div[class=hiddenPane]").hide();
    $("td[class=minus]").click(function(event) {
        event.stopPropagation();
        var $target = $(event.target);
        $target.closest("tr").next().find("div[class=hiddenPane]").slideToggle();
        if ($target.closest("tr").find("span").hasClass("glyphicon-plus-sign"))
          $target.closest("tr").find("span.glyphicon").removeClass("glyphicon-plus-sign").addClass("glyphicon-minus-sign");
        else
          $target.closest("tr").find("span.glyphicon").removeClass("glyphicon-minus-sign").addClass("glyphicon-plus-sign");
    });
});
