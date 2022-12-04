$("#overlay").on("click", function() {
    if ($(event.target).is("#overlay") || $(event.target).is("#close")) {
        $("#overlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay").hide();
    }
});