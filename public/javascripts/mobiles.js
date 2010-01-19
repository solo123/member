function show_quotation(mobileID){
  $.get("/quotations/" + mobileID, function(data){
    $("#quotation_dialog").html(data).dialog('open');
    alert(ui.mouse.postion);
  });
}

$(function(){
  $("#quotation_dialog").dialog({ autoOpen: false});
});

