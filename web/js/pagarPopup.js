$("#overlay.pagarOverlay").on("click", function() {
    if ($(event.target).is("#overlay.pagarOverlay") || $(event.target).is(".pagarOverlay #close")) {
        $("#overlay.pagarOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.pagarOverlay").hide();
    }
});