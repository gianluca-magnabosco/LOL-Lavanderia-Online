$("#overlay.funcionarioOverlay").on("click", function() {
    if ($(event.target).is("#overlay.funcionarioOverlay") || $(event.target).is(".funcionarioOverlay #close")) {
        $("#overlay.funcionarioOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.funcionarioOverlay").hide();
    }
});  