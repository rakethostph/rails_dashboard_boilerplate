// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require js/bs-charts.js
//= require js/chart.min.js
//= require js/theme.js
//= require js/script.min.js
//= require datatables/jquery.dataTables.js
//= require datatables/datatables-demo.js
//= require datatables/dataTables.bootstrap4.js


$(function () {
	$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#success-alert").slideUp(500);
	});
});