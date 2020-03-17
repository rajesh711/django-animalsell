$(function() {
    $('.tip-confirm').tipConfirm({
        duration: 150,
       // easing: "easeInSine",
        size: "tiny",
        customButtons: false,
        onSubmit: function(event, element) {
            //console.log(element)
            /*element.slideUp(200, function() {
                $(this).remove()
            })*/
        }
    });
   
})
