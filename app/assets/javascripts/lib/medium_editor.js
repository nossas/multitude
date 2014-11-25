$(function(){
  var editor = new MediumEditor('.editable', {
    buttons: ['bold', 'italic', 'underline', 'anchor', 'unorderedlist', 'orderedlist'],
    buttonLabels: 'fontawesome',
    anchorInputPlaceholder: 'Cole ou digite um link'
  });

  $('.editable').each(function() {
    var inputId = $(this).data("input-id");
    var that = this;
    $('label[for="' + inputId + '"]').click(function(){
      $(that).trigger("focus");
    });
  });

  $('.editable').on('input', function(event) {
    var content = $(event.target).html();
    var inputTarget = $("#" + $(event.target).data("input-id"))

    if(content == "<p><br></p>") {
      // When Medium Editor is empty
      inputTarget.val(null);
    } else {
      inputTarget.val(content);
    }
  });

  $('form').on('invalid.fndtn.abide', function (event) {
    var invalidFields = $(this).find('[data-invalid]');
    invalidFields.each(function(){
      editable = $(".editable[data-input-id='" + this.id + "']");
      editable.trigger("focus");
    });
  })
});
