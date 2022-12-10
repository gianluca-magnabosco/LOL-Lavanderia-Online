$("#overlay.roupaOverlay").on("click", function() {
    if ($(event.target).is("#overlay.roupaOverlay") || $(event.target).is(".roupaOverlay #close")) {
        $("#overlay.roupaOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.roupaOverlay").hide();
    }
});  