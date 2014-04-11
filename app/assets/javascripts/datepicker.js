$(document).ready(function(){
  $('[data-behaviour~=datepicker]').datepicker({
    format: 'dd/mm/yyyy'
  }).datepicker("setDate", new Date());
})
