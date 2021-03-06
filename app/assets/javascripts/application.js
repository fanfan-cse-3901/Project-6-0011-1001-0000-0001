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
//= require_tree .
// File Edited on 07/19/2020 by Yifan Yao: Add Bootstrap into JavaScript
//= require jquery3
//= require popper
//= require bootstrap
// File Edited on 07/22/2020 by Yifan Yao: Add jQuery into JavaScript for devise
//= require jquery
//= require jquery_ujs

// File Edited on 07/29/2020 by Yifan Yao: Add form-control for all <select> elements
$(document).ready(function () {
  $("select").addClass("form-control");
});
