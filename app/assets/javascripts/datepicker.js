$(document).ready(function(){
  $('[data-behaviour~=datepicker]').datepicker({
    format: 'dd/mm/yyyy'
  }).each(function (i, input){
    if (input.value === "") {
      // we set current date only if we don't have
      // already a value
      $(input).datepicker("setDate", new Date());
    }
  });
})
