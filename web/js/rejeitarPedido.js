$("#overlay.rejeitarOverlay").on("click", () => {
    if ($(event.target).is("#overlay.rejeitarOverlay") || $(event.target).is(".rejeitarOverlay #close")) {
        $("#overlay.rejeitarOverlay").hide();
    }
});

$(document).keyup(e => {
    if (e.key === "Escape") {
        $("#overlay.rejeitarOverlay").hide();
    }
});

$(".cancelar").on("click", () => {
    $("#overlay.rejeitarOverlay").hide();
});