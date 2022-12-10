$("#overlay.cancelarOverlay").on("click", function() {
    if ($(event.target).is("#overlay.cancelarOverlay") || $(event.target).is(".cancelarOverlay #close")) {
        $("#overlay.cancelarOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.cancelarOverlay").hide();
    }
});