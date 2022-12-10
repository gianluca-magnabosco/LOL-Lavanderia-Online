$("#overlay.pedidoOverlay").on("click", function() {
    if ($(event.target).is("#overlay.pedidoOverlay") || $(event.target).is(".pedidoOverlay #close")) {
        $("#overlay.pedidoOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.pedidoOverlay").hide();
    }
});