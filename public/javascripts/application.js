// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function SetupAjaxIndicator(){
    $(document).ajaxStart(function(){
        $('#ajaxBusy').show();
        centerwh('#ajaxBusy');
    }).ajaxStop(function(){
        $('#ajaxBusy').hide();
    });
}

function centerwh(obj)
{
    var h1 = document.body.clientHeight;
    var h2 = document.documentElement.clientHeight;
    var isXhtml = (h2<=h1&&h2!=0)?true:false;
    var body = isXhtml?document.documentElement:document.body;

    var wh={left:0,top:0};
    var vwh={w:0,h:0};
    vwh.w=$.browser.msie?parseInt(body.clientWidth):parseInt(window.innerWidth);
    vwh.h=$.browser.msie?parseInt(body.clientHeight):parseInt(window.innerHeight);
    wh.left=(vwh.w/2)-parseInt($(obj).css("width"))/2;
    wh.top=body.scrollTop+(vwh.h/2)-parseInt($(obj).css("height"))/2;
    $(obj).css("top",wh.top);
    $(obj).css("left",wh.left);
    //return wh;
}

function goto_mobile(mobileID){
	location = "/mobiles/" + mobileID;
}

var search_prompt = "请输入要查询的手机型号";
$(function(){
   $('.data_table')
    .attr({
      cellSpacing:0,
      cellPadding:4,
      width: '100%',
      border: 1,
      borderColor: '#999999'
    })
    .find('tr:gt(0)')
        .mouseover(function(){ $(this).addClass("over")})
        .mouseout(function(){ $(this).removeClass("over")})
        .end()
    .find('th:first').attr("class","nobg").end()
    .find('tr:even > td').addClass("alt").end()
    .find('tr:even > td:first-child').attr("class", "specalt").end()
    .find('tr:odd > td:first-child').attr("class","spec").end()
    .find('tr:even:gt(0)').addClass("alt").end()
    .find('tr:odd').addClass("noalt");
   $('.data_table').wrap("<div class='data_table_container ui-corner-all'></div>");
   
   $('#main_zone').addClass("ui-corner-all");
   
   $('#search_field')
    .focus(function(){
      $('#form_search').addClass('focused').removeClass('prompt');
      if ($.trim(this.value)==search_prompt){
        this.value = "";
      } else {
        this.select();
      }
      })
    .blur(function(){
      $('#form_search').removeClass('focused');
      if ($.trim(this.value)==''){
        this.value = search_prompt;
        $('#form_search').addClass('prompt')
      }
    })
    .val(search_prompt);
});
