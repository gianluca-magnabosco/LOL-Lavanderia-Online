$("#overlay.pagarOverlay").on("click", () => {
    if ($(event.target).is("#overlay.pagarOverlay") || $(event.target).is(".pagarOverlay #close")) {
        $("#overlay.pagarOverlay").hide();
    }
});

$(document).keyup(e => {
    if (e.key === "Escape") {
        $("#overlay.pagarOverlay").hide();
    }
});