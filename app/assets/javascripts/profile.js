// Dashboard
function generate_stars(count) {
  var stars = '';
  for (var i=0; i<count; i++) {
    stars += '<span class="glyphicon glyphicon-star"></span>';
  }
  return stars;
}

$(document).ready(function() {
    if(location.hash) {
        $('a[href=' + location.hash + ']').tab('show');
    }
    $(document.body).on("click", "a[data-toggle]", function(event) {
        location.hash = this.getAttribute("href");
    });

   $(document).on('mouseover', '[rel=details]', function(e) {
        var $tr = $(this);
        id = $(this).data('id');
        $.ajax({
            url: '/reviews/' + id,
            dataType: 'json',
            success: function(data) {
                $tr.popover({
                    title: generate_stars(data.rating),
                    content: data.comment,
                    placement: 'bottom',
                    html: true,
                    trigger: 'hover'
                }).popover('show');
            }
        });
    });

  $('#new_review_modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('qid') // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    modal.find('#review_quest_id').val(recipient)
  })
});

$(window).on('popstate', function() {
    var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
    $('a[href=' + anchor + ']').tab('show');
});
