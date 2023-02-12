$("#overlay.removerOverlay").on("click", () => {
    if ($(event.target).is("#overlay.removerOverlay") || $(event.target).is(".removerOverlay #close")) {
        $("#overlay.removerOverlay").hide();
    }
});

$(document).keyup(e => {
    if (e.key === "Escape") {
        $("#overlay.removerOverlay").hide();
    }
});

$(".cancelar").on("click", () => {
    $("#overlay.removerOverlay").hide();
});