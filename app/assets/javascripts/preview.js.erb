$(document).ready(function(){
  var Previewer = {
    preview: function(content, output) {
      $.ajax({
        type: 'POST',
        url: "/trade-tariff-admin/preview",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
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

    Previewer.preview(source_field, render_area);
  });

  $('textarea').autosize();

});
