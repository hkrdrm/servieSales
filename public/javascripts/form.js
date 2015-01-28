$( "#name" ).keyup( function() {
  $( "#sName0").text( "Server Name:" )
  $( "#sName" ).text( $("#name").val() );
});

$( "#pass" ).keyup( function() {
  $( "#sPass0").text( "Server Password:" )
  $( "#sPass" ).text( $("#pass").val() );
});

$( "#UPass" ).keyup( function() {
  $( "#sUPass0").text( "SuperUser Password:" )
  $( "#sUPass" ).text( $("#UPass").val() );
});

$( "#slots" ).keyup( function() {
  $( "#sSlots0").text( "Slots:" )
  $( "#sSlots" ).text( $("#slots").val() );
  $( "#price0").text( "Price:" )
  $( "#price" ).text( $("#slots").val() * .4 );
  $( "#price").formatCurrency();
});
$( "#slots" ).click( function() {
  $( "#sSlots0").text( "Slots:" )
  $( "#sSlots" ).text( $("#slots").val() );
  $( "#price0").text( "Price:" )
  $( "#price" ).text( $("#slots").val() * .4 );
  $( "#price").formatCurrency();
});
