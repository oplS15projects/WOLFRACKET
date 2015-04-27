
var mysubmit = function(){
        var url = "../api/" ;

        var method = $( "#method" ).val() ;
        var num1 = $( "#num1" ).val() ;
        var num2 = $( "#num2" ).val() ;
        var num3 = $( "#num3" ).val() ;

        var data = { "j" : "[" + num1 + "," + num2 + "," + num3 + "]" } ;

        $.ajax({
            url: url + method + '/' ,
            data: data
        }).done( function( ret ) {
            console.log( "done" ) ;
            console.log( ret[ 0 ] ) ;
            $( "#result" ).html( ret[ 0 ] ) ;
        });

        return false ;
    };
