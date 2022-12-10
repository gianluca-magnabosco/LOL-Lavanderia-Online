$("#overlay.consultarOverlay").on("click", function() {
    if ($(event.target).is("#overlay.consultarOverlay") || $(event.target).is(".consultarOverlay #close")) {
        $("#overlay.consultarOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.consultarOverlay").hide();
    }
});