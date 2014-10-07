$("select").change(function(){
  $(".amount").text( $("select").val() * .4 );
  $(".amount").formatCurrency();
  var script = '<script src="https://checkout.stripe.com/v2/checkout.js" class="stripe-button" data-key="pk_test_4LdbpZTtYUS7OxBSxeiMNkxa" data-amount="' + $("select").val() * 40 + '" data-name="Monthly Subscription" data-description="Ollie Oop"></script>';
  $(".button").empty();
  $(".button").append(script);
});
