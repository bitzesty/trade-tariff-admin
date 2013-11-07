$(document).ready(function(){
  var Previewer = {
    preview: function(content, output) {
      $.ajax({
        type: 'POST',
        url: "/govspeak",
        data: { govspeak: content.val() },
        dataType: 'json'
      }).success(function(data){
        output.html(data['govspeak']);
      });
    }
  };

  $("[data-preview]").each(function(){
    var source_field = $($(this).data('preview-for'));
    var render_area = $(this);

    source_field.keyup(function() {
      Previewer.preview(source_field, render_area);
    })
  });

  $('textarea').autosize();
});
