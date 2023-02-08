$("#overlay.consultarOverlay").on("click", () => {
    if ($(event.target).is("#overlay.consultarOverlay") || $(event.target).is(".consultarOverlay #close")) {
        $("#overlay.consultarOverlay").hide();
    }
});

$(document).keyup(e => {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.consultarOverlay").hide();
    }
});