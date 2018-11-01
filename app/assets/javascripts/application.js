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
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(document).ready(function() {

  $('[data-login]').on('click', function () {
    var SelectInputElement = $('#about_the_home')
    var EnterInputElement = $('#recommended_list_price')
    var submitButtonElement = $('[data-login]')

    const invalidMessage = "Please fill in the required fields for submission"

    function setInvalidCSS(element) {
      $(element).css({"background-color": "#DDE2F6"});
    }

    function setRequiredField(element) {
      $(element).required(true);
    }

    function setMessage(message) {
      $('.message').text(message);
    }

    if (SelectInputElement.val() === '' && EnterInputElement.val() === '') {
      setInvalidCSS(HomeInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    } else {}
});

  $('[data-collect]').on('click', function () {
    var HomeInputElement = $('#about_the_home')
    var ListPriceInputElement = $('#recommended_list_price')
    var EnthusiasmInputElement = $('#client_enthusiasm')
    var CommissionInputElement = $('#buyer_agent_commission')
    var SellerInputElement = $('#about_the_seller')
    var CCInputElement = $('#credit_card_number')
    var CCExpInputElement = $('#credit_card_expiration_date')
    var submitButtonElement = $('[data-collect]')

    const invalidMessage = "Please fill in the required fields for submission"

    function setInvalidCSS(element) {
      $(element).css({"background-color": "#DDE2F6"});
    }

    function setRequiredField(element) {
      $(element).required(true);
    }

    function setMessage(message) {
      $('.message').text(message);
    }

    if (HomeInputElement.val() === '') {
      setInvalidCSS(HomeInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    }
    if (ListPriceInputElement.val() === '') {
      setInvalidCSS(ListPriceInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    }
    if (CommissionInputElement.val() === '') {
      setInvalidCSS(CommissionInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    }
    if (SellerInputElement.val() === '') {
      setInvalidCSS(SellerInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    }
    if (CCInputElement.val() === '') {
      setInvalidCSS(CCInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    }
    if (CCExpInputElement.val() === '') {
      setInvalidCSS(CCExpInputElement)
      setMessage(invalidMessage)
      event.preventDefault();
    } else {}

  });
});
