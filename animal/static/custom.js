$('#language_dropdown').ddslick({
    onSelected: function(selectedData){
        //callback function: do something with selectedData;
    }
});

var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){

var animal_info  = $('#animal_info').val();
if(animal_info ==''){
    var a=document.getElementById('error_animal_info');
    a.innerHTML='Please required field';
    a.style.color="red";
    return false;
 }

  if(animating) return false;
  animating = true;

  current_fs = $(this).parent();
  next_fs = $(this).parent().next();

  //activate next step on progressbar using the index of next_fs
  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

  //show the next fieldset
  next_fs.show();

  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale current_fs down to 80%
      scale = 1 - (1 - now) * 0.2;
      //2. bring next_fs from the right(50%)
      left = (now * 50)+"%";
      //3. increase opacity of next_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({
        'transform': 'scale('+scale+')'
        //'position': 'absolute'

      });

      next_fs.css({'left': left, 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    },
    //this comes from the custom easing plugin
    easing: 'easeInOutBack'
  });

});

$(".previous").click(function(){
  if(animating) return false;
  animating = true;

  current_fs = $(this).parent();
  previous_fs = $(this).parent().prev();

  //de-activate current step on progressbar
  $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

  //show the previous fieldset
  previous_fs.show();
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale previous_fs from 80% to 100%
      scale = 0.8 + (1 - now) * 0.2;
      //2. take current_fs to the right(50%) - from 0%
      left = ((1-now) * 50)+"%";
      //3. increase opacity of previous_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({'left': left});
      previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    },
    //this comes from the custom easing plugin
    easing: 'easeInOutBack'
  });
});

$(".submit").click(function(){

var user_name=document.getElementById('user_name').value;
if(user_name.length==0)
        {

          var a =  document.getElementById("error_user_name");
                  a.innerHTML='Please enter your name';
                  a.style.color="red";
            return false;
        }

   var user_contact=document.getElementById('user_contact').value;
    var mobilecheck=/^[0-9+]{10,15}$/;


         if(user_contact==""){
                 var a =  document.getElementById("error_user_contact");
                  a.innerHTML='Please enter Contact No';
                  a.style.color="red";
                 return false;


         }
         if(!mobilecheck.test(user_contact))
         {

          var a =  document.getElementById("error_user_contact");
                  a.innerHTML='Phone number must be entered in the format: 999999999  Up to 15 digits allowed';
                  a.style.color="red";
            return false;
         }



    var user_address=document.getElementById('user_address').value;
    if(user_address.length=='')
        {

          var a =  document.getElementById("error_user_address");
                  a.innerHTML='Please enter your address ';
                  a.style.color="red";
            return false;
        }
});



$('.image_frontclick').on('click', function() {
    $('#id_front_image').trigger('click');

    $("input[name=front_image]").change(function () {
    ///  alert('dhj');
    if (this.files && this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = $('<img>').attr('src', e.target.result);
            $('.image_frontclick').html(img);


        };

        reader.readAsDataURL(this.files[0]);
    }
});
});

$('.image_backclick').on('click', function() {
    $('#id_back_image').trigger('click');

    $("input[name=back_image]").change(function () {
    ///  alert('dhj');
    if (this.files && this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = $('<img>').attr('src', e.target.result);
            $('.image_backclick').html(img);


        };

        reader.readAsDataURL(this.files[0]);
    }
});
});

$('.image_leftclick').on('click', function() {
    $('#id_left_image').trigger('click');

    $("input[name=left_image]").change(function () {
    ///  alert('dhj');
    if (this.files && this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = $('<img>').attr('src', e.target.result);
            $('.image_leftclick').html(img);


        };

        reader.readAsDataURL(this.files[0]);
    }
});
});

$('.image_rightclick').on('click', function() {
    $('#id_right_image').trigger('click');

    $("input[name=right_image]").change(function () {
    ///  alert('dhj');
    if (this.files && this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = $('<img>').attr('src', e.target.result);
            $('.image_rightclick').html(img);


        };

        reader.readAsDataURL(this.files[0]);
    }
});
});

$(document).on('click','.dispaly_color', function(){
var imageUrl = "img/img/graycheck.png";

$('.dispaly_color').removeClass('color_active');

$(this).addClass('color_active');

});
