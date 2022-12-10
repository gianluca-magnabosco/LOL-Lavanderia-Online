$(".voltar").on("click", function() {
    $("#overlay.aceitarOverlay").toggle();
});

$("#overlay.aceitarOverlay").on("click", function() {
    if ($(event.target).is("#overlay.aceitarOverlay") || $(event.target).is(".aceitarOverlay #close")) {
        $("#overlay.aceitarOverlay").hide();
    }
});

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Enter") {
        $("#overlay.aceitarOverlay").hide();
    }
});    