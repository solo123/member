


$(function() {
 
  
  $("input[type='text']:first", document.forms[0]).focus();
  
  
  $('form').validate({
    rules:{
      mobile: {required: true, mobile: true}
    },
    messages:{
      required: '请输入字段内容', 
      mobile: {
        required:'请输入您的手机号码'
      }
    }   
  });
});