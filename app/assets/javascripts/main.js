$(function(){
	function buildHTML(comment){
		var html =
        `<div class="item card-panel hoverable">
          <p>${comment.text}</p>
          <p>${comment.user_name}さん</p>
        </div>`
		return html;
	}
  	$('#comment_form').on('submit',function(e){
  		e.preventDefault();
	    var formData = new FormData(this);
	    var url = $(this).attr('action')
	    $.ajax({
	      url: url,
	      type: "POST",
	      data: formData,
	      dataType: 'json',
	      processData: false,
	      contentType: false
	  	})
	    .done(function(data){
	      var html = buildHTML(data);
	      $('#comment-index').append(html)
	      $('#comment_text').val('')
	      $('#form_submit').attr('disabled', false)
	    })
	});
});
