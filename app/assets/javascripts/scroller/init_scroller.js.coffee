@init_scroller = () ->
  console.log $.fn.tinyscrollbar()
  $(".calendar .calendar_items").tinyscrollbar
    wheel: '20'
