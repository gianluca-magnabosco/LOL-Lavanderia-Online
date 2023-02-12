$("#overlay.cancelarOverlay").on("click", () => {
    if ($(event.target).is("#overlay.cancelarOverlay") || $(event.target).is(".cancelarOverlay #close")) {
        $("#overlay.cancelarOverlay").hide();
    }
});

$(document).keyup(e => {
    if (e.key === "Escape") {
        $("#overlay.cancelarOverlay").hide();
    }
});

$(".cancelar").on("click", () => {
    $("#overlay.cancelarOverlay").hide();
});