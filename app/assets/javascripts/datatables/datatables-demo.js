// Call the dataTables jQuery plugin
$(document).on('turbolinks:load', function() {

	$(document).ready(function() {
	  $('#dataTable').DataTable();
	});
});
