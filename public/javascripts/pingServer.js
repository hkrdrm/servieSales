$( document ).ready(function() {
$( '.server1' ).append( "#{ escape_javascript( render :partial => 'users/test' ) }" );
});
