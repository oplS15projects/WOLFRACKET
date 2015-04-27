
var mysubmit = function(){
        var url = "localhost:8080/api/" ;

        var method = $( "#method" ).value() ;
        var num1 = $( "#num1" ).value() ;
        var num2 = $( "#num2" ).value() ;
        var num3 = $( "#num3" ).value() ;

        var data = { "j" : [num1 , num2 , num3 ] } ;

        $.ajax({
            url: url + method + '/' ,
            data: data
        }).done( function( ret ) {
            console.log( "done" ) ;
            console.log( ret ) ;
            $( "#result" ).html( ret ) ;
        });
    };
