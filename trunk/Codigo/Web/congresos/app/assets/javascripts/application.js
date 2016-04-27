// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

(function() {
  'use strict';

  $('.datetimepicker').datetimepicker();

  var datestring = function() {
    $('.datestring').each(function() {
      this.textContent = moment(this.textContent).format('dddd DD/MM/YYYY');
    });
  };

  var datetimestring = function() {
    $('.datetimestring').each(function() {
      this.textContent = moment(this.textContent).format('dddd DD/MM/YYYY - HH:mm');
    });
  };

  var datepicker1 = function() {
    $('#datetimepicker1').datetimepicker({
      locale: 'es',
      format: 'DD/MM/YYYY'
    });
  }

  var datepicker2 = function() {
    $('#datetimepicker2').datetimepicker({
      locale: 'es',
      format: 'DD/MM/YYYY'
    });
  }

  var datepicker3 = function() {
    $('#datetimepicker3').datetimepicker({
      locale: 'es',
      format: 'DD/MM/YYYY HH:mm'
    });
  }

  $(document).ready(datestring);
  $(document).on('page:load', datestring);

  $(document).ready(datetimestring);
  $(document).on('page:load', datetimestring);

  $(document).ready(datepicker1);
  $(document).on('page:load', datepicker1);

  $(document).ready(datepicker2);
  $(document).on('page:load', datepicker2);

  $(document).ready(datepicker3);
  $(document).on('page:load', datepicker3);

})();

