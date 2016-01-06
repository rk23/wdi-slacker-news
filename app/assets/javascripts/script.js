if(typeof gon !== 'undefined'){
	console.log(gon.posts);
};

$(document).ready(function (){
	$('.js-delete-btn').on('click', function (e){
		e.preventDefault();
		var btn = $(this);
		var requestType = btn.data('request-type');
		$.ajax({
			url: '/post/' + btn.attr('id'),
			method: 'DELETE',
			dataType: 'json'
		}).done(function (data){
			if(requestType === 'html'){
				console.log("hit request html");
				window.location = '/';
			}
			else if (data){
				console.log('Hit else if', data);
				$('.js-delete-btn').closest('tr').remove();
                window.location = '/';
            }
		});
	});
});
