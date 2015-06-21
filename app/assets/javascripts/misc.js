$(document).ready(function() {
	// Closes closest parent div with a slideUp.
	// Used to smoothly close flash messages and debug info (dev).
	$('.remove').on('click', function() {
		$(this).closest('div').slideUp();
	});
});
