/**
 *  =================================================================================================
 *
 *  [ Main Stylesheet ]
 *
 *  Project:        Tango - Responsive Multi-Purpose Landing Page
 *  Version:        1.3
 *  First change:   02/10/2016
 *  Last change:    02/25/2016
 *  Primary use:    Multi-Purpose Landing Page
 *  File Name:      all.js
 *  Author:         Ahmed / Morad
 *  Description:    This file is containing all the js excutions codes such as Page Loading Animation,
 *                  Sliders, Form Validation, .. etc. This file is separated to detailed section to be
 *                  easy to be handled in a quick way.
 *
 *  =================================================================================================
 *
 *  all.js file is divided as the following:
 *
 *
 *     |
 *     |-->  [ 1 ] - General Codes
 *     |     |-->  [ 1.1 ] - On ready, load, resize and scroll
 *     |     |-->  [ 1.2 ] - Background Youtube Video
 *     |     |-->  [ 1.3 ] - placeholder Subscribe Form
 *     |     |-->  [ 1.4 ] - Mobile Navigation
 *     |     |-->  [ 1.5 ] - Scroll to
 *     |     |-->  [ 1.6 ] - Stellar Parallax
 *     |     |-->  [ 1.7 ] - Loader
 *     |     |-->  [ 1.8 ] - Tooltip
 *     |     |-->  [ 1.9 ] - Form Map
 *     |     |-->  [ 1.10] - Google Map
 *     |     |-->  [ 1.11] - Sticky Nav
 *     |     |-->  [ 1.12] - ScrollTo Nav
 *     |     |-->  [ 1.13] - Instagram Feed
 *     |     |-->  [ 1.14] - Languages Popup
 *     |     |-->  [ 1.15] - Portfolio Lightbox
 *     |     |-->  [ 1.16] - Portfolio Filter
 *     | 
 *     |-->  [ 2 ] - Sliders
 *     |     |-->  [ 2.1 ] - Clients Slider 
 *     |     |-->  [ 2.2 ] - More Features Slider
 *     |     |-->  [ 2.3 ] - Header Animation Text lead gen
 *     |     |-->  [ 2.4 ] - Header Animation Text click through
 *     |
 *     |-->  [ 3 ] - Data Attributes Options
 *     |     |-->  [ 3.1 ] - Background Color
 *     |     |-->  [ 3.2 ] - Background Color Opacity
 *     |     |-->  [ 3.3 ] - Parallax Background Image
 *     |     |-->  [ 3.4 ] - Divider Space
 *     |     |-->  [ 3.5 ] - Pattern Overlay options
 *     |
 *     |-->  [ 4 ] - Forms
 *     |     |-->  [ 4.1 ] - Contact Form
 *     |     |-->  [ 4.2 ] - Mailchimp Subscribe Form
 *
**/



/**
 *  -------------------------------------------------------------------------------
 *  [ 1 ] - General Codes
 *  -------------------------------------------------------------------------------
 *
 *  This part contains all js codes that applied generally.
 *  
 *  ------
 *  
 *  General Codes is divided to the following sections:
 *
 *     |
 *     |-->  [ 1.1 ] - On ready, load, resize and scroll
 *     |-->  [ 1.2 ] - Background Youtube Video
 *     |-->  [ 1.3 ] - placeholder Subscribe Form
 *     |-->  [ 1.4 ] - Mobile Navigation
 *     |-->  [ 1.5 ] - Scroll to
 *     |-->  [ 1.6 ] - Stellar Parallax
 *     |-->  [ 1.7 ] - Loader
 *     |-->  [ 1.8 ] - Tooltip
 *     |-->  [ 1.9 ] - Form Map 
 *     |-->  [ 1.10] - Google Map 
 *     |-->  [ 1.11] - Sticky Nav
 *     |-->  [ 1.12] - ScrollTo Nav
 *     |-->  [ 1.13] - Instagram Feed 
 *     |-->  [ 1.14] - Languages Popup
 *     |-->  [ 1.15] - Portfolio Lightbox
 *     |-->  [ 1.16] - Portfolio Filter
 *
 */


/** [ 1.1 ] - On ready, load, resize and scroll
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// On ready
$( document ).on( "ready" , function() {
$('.simplenews-subscribe input#edit-mail').removeClass().addClass('email').attr("placeholder","Email Address").attr("type","email");
$(".simplenews-subscribe .form-type-textfield").append('<input class="submit" id="edit-submit" name="op" value="Subscribe" type="submit">');
$('.simplenews-subscribe .form-type-textfield label').remove();
$('.simplenews-subscribe button#edit-submit').remove();

    var i = 0;
(function myFix() {
  $('.main-menu li').each(function () {
    $(this).removeClass();
    var xx = $(this).find('a').attr("href");
    var arr = xx.split("#");
    arr[1] = "#"+arr[1];
    $(this).find('a').attr("href",arr[1]).attr("data-scroll-nav",i);
    if (!$(this).is(':last-child')) {
        i++;
      }
      else {
        i = 0;
      }
      // console.log(i);
  });
}());
    stickyNav();
    placeholderForm();
    mobileNavigation();
    scrollToPoint();
    navScrollTo();
    tooltip();
    showMap();
    clientsSlider();
    featuresSlider();
    languagesPopup();
    headerFormValidation();
    portfolioLightbox();
    portfolio();
});


// On load
$( window ).on( "load" , function() {
    websiteLoading();
    parallaxStellar();
    animationText1();
    animationText2();
});


// On resize
$( window ).on( "resize" , function() {
    parallaxStellar();
});


/** [ 1.3 ] - placeholder Subscribe Form
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function placeholderForm() {
    $('input, textarea').placeholder();
}



/** [ 1.4 ] - Mobile Navigation
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function mobileNavigation() {
    $(".nav-mobile").html($("#main-menu").html());
    $(".nav-trigger").on( "click", function() {
        if ($(".nav-mobile ul").hasClass("expanded")) {
            $(".nav-mobile ul.expanded").removeClass("expanded").slideUp(300);
        } else {
            $(".nav-mobile ul").addClass("expanded").slideDown(300);
        }
    });
    // collapsed menu close on click
    $(document).on('click', '.nav-mobile ul li', function (e) {
        $(".nav-mobile ul.expanded").removeClass("expanded").slideUp(300);
    });
}



/** [ 1.5 ] - Scroll to
 *  ~~~~~~~~~~~~~~~~~~~
 */

function scrollToPoint() {
//jQuery for page scrolling feature - requires jQuery Easing plugin
    $('.scroll-to').on('click', function (e) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top -100
        }, 1500, 'easeInOutExpo');
        e.preventDefault();
    });    
}



/** [ 1.6 ] - Stellar Parallax
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// only activate stellar for window widths above or equal to 1024
var stellarActivated = false;

function parallaxStellar() {
    if ($(window).width() <= 1024) {
        if (stellarActivated == true) {
            $(window).data('plugin_stellar').destroy();
            stellarActivated = false;
        }
    } else {
        if (stellarActivated == false) {
            $.stellar({
                verticalOffset: 0,
                responsive: true,
                horizontalScrolling: false // don't change this option
           });
            $(window).data('plugin_stellar').init();
            stellarActivated = true;
        }
    }
}


/** [ 1.7 ] - Loader
 *  ~~~~~~~~~~~~~~~~
 */

function websiteLoading() {
    $( "#website-loading" ).delay( 600 ).fadeOut( 300 );
    $( ".loading-effect" ).delay( 0 ).fadeOut( 500 );   
}



/** [ 1.8 ] - Tooltip
 *  ~~~~~~~~~~~~~~~~~
 */

function tooltip() {
    $('.tooltip').tooltipster({
        maxWidth: 150,
        minWidth: 20,
        animation: 'grow', // fade, grow, swing, slide, fall
        delay: 300,
        touchDevices: false,
        trigger: 'hover',
        position: 'top'
    });    
}



/** [ 1.9 ] - Form Map 
 *  ~~~~~~~~~~~~~~~~~
 */

function showMap() {
    $("#header-featured-form i").on( "click", function() {
        $('.location').toggleClass('show-map');
        $(this).toggleClass('fa-map-marker fa-envelope');
    });    
}



/** [ 1.10] - Google Map 
 *  ~~~~~~~~~~~~~~~~~~~~~
 */

function initMap() {
    var latlng = {lat: -33.867487, lng: 151.206990};
    var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    scrollwheel: false,
    navigationControl: false,
    mapTypeControl: false,
    draggable: true,
    center: latlng
    });

    // marker click title
    var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h3 id="firstHeading" class="firstHeading">Tango Office</h3>'+
        '<div id="bodyContent">'+
        '<p>Here we are. Come to drink a coffee!</p>'+
        '</div>'+
        '</div>';

    var infowindow = new google.maps.InfoWindow({
    content: contentString,
    maxWidth: 400
    });

    // marker image
    var image = {
      url: 'images/general-elements/marker.png',
      size: new google.maps.Size(50,50), // Width and height of the marker
      origin: new google.maps.Point(0,0),
      anchor: new google.maps.Point(20,50) // Position of the marker
    };

    var marker = new google.maps.Marker({
    position: latlng,
    map: map,
    icon: image,
    title: 'Tango Office'
    });

    google.maps.event.addDomListener(window, "resize", function() {
        var center = map.getCenter();
        google.maps.event.trigger(map, "resize");
        map.setCenter(center);
    });

    // marker open title
    marker.addListener('click', function() {
    infowindow.open(map, marker);
    });
}



/** [ 1.11] - Sticky Nav 
 *  ~~~~~~~~~~~~~~~~~~~~~
 */

function stickyNav() {
    $("#sticker").sticky({topSpacing:0});
}



/** [ 1.12] - ScrollTo Nav
 *  ~~~~~~~~~~~~~~~~~~~~~~~~
 */
   
function navScrollTo() {
    $.scrollIt({
    // If you change this values you will have strange effect
      upKey: false,           
      downKey: false,         
      scrollTime: 0,          
      activeClass: 'active',  
      onPageChange: null,     
      topOffset: -100         
    });
}




/** [ 1.13] - Instagram Feed
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

var feed = new Instafeed({
    get: 'user',
    userId: 2941793815,  //Your ID Number Here
    resolution: 'standard_resolution',
    accessToken: '2130897638.467ede5.7a543386560f4666b437cb1f6a449c74',
    template: '<li class="item"><a href="{{link}}" target="_blank"><span class="icon-overlay"><i class="fa ' + 'fa-instagram"></i></span><img class="img-responsive" src="{{image}}" /></a></li>',
    limit: 16, // Number of photo will get from instagram 
    target: 'instafeed',
    after: function() {
        $('#instafeed').owlCarousel({
          items : 8, // Number of photo will be visable 
          autoPlay: 3000,
          itemsDesktop : [1199,3],
          itemsDesktopSmall : [979,3],
          navigation : false,
          navigationText : ["<i class='fa fa-long-arrow-left'></i>","<i class='fa fa-long-arrow-right'></i>"],
          pagination : false
        });
    }
});
feed.run();



/** [ 1.14] - Languages Popup
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function languagesPopup() {
    $('.Languages').magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: false,
        autoFocusLast: false,
        preloader: false,
        showCloseBtn: true,
        midClick: true,
        removalDelay: 300,
        mainClass: 'zoom-effect'
    }); 
}



/** [ 1.15] - Portfolio Lightbox
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function portfolioLightbox() {
  $('.portfolio-lightbox').magnificPopup({
    type: 'image'
  });
}



/** [ 1.16] - Portfolio Filter
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function portfolio() {
  // get the action filter option item on page load
  var $filterType = $('.portfolio-filter li.active a').attr('class');
  
  // get and assign the ourHolder element to the
  // $holder varible for use later
  var $holder = $('ul.portfolio-items-list');

  // clone all items within the pre-assigned $holder element
  var $data = $holder.clone();

  // attempt to call Quicksand when a filter option
  // item is clicked
  $('.portfolio-filter li a').on('click', function (e) {
    // reset the active class on all the buttons
    $('.portfolio-filter li').removeClass('active');
    
    // assign the class of the clicked filter option
    // element to our $filterType variable
    var $filterType = $(this).attr('class');
    $(this).parent().addClass('active');
    
    if ($filterType == 'all') {
      // assign all li items to the $filteredData var when
      // the 'All' filter option is clicked
      var $filteredData = $data.find('li');
    } 
    else {
      // find all li elements that have our required $filterType
      // values for the data-type element
      var $filteredData = $data.find('li[data-type~=' + $filterType + ']');
    }
    
    // call quicksand and assign transition parameters
    $holder.quicksand($filteredData, {
    duration: 700,
    easing: 'easeInOutQuint',
    useScaling: true,
    adjustHeight: 'dynamic'
    },
    function() {
     // callback function
     portfolioLightbox();
    }
    );
    return false;
  });
}



/**
 *  -------------------------------------------------------------------------------
 *  [ 2 ] - Sliders
 *  -------------------------------------------------------------------------------
 *
 *  This section is for the sliders. It's based on owl carousel.
 *  
 *  ------
 *  
 *     |
 *     |-->  [ 2.1 ] - Clients Slider
 *     |-->  [ 2.2 ] - More Features Slider
 *     |-->  [ 2.3 ] - Header Animation Text lead gen
 *     |-->  [ 2.4 ] - Header Animation Text click through
 *  
 */



/** [ 2.1 ] - Clients Slider
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function clientsSlider() {
  $(".clients").owlCarousel({
      autoPlay: 5000, //Set AutoPlay to 3 seconds
      pagination: false, 
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
  });    
}



/** [ 2.2 ] - More Features Slider
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function featuresSlider() {
  $(".more-features-slider").owlCarousel({
    autoPlay : false, // Integer means autoplay equal to the value. True means autoplay with 5 seconds
    stopOnHover : true,
    slideSpeed : 500,
    navigation : false,
    navigationText: ["<i class=\"fa fa-chevron-left\"></i>","<i class=\"fa fa-chevron-right\"></i>"],
    paginationSpeed : 400,
    transitionStyle : "fade", // "fade", "backSlide", "goDown" and "fadeUp"
    singleItem:true
  });    
}



/** [ 2.3 ] - Header Animation Text lead gen
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function animationText1() {
    $('.tlt1').textillate({
      // the default selector to use when detecting multiple texts to animate
      selector: '.texts',

      // enable looping
      loop: true,

      // sets the minimum display time for each text before it is replaced
      minDisplayTime: 2000,

      // sets the initial delay before starting the animation
      // (note that depending on the in effect you may need to manually apply 
      // visibility: hidden to the element before running this plugin)
      initialDelay: 0,

      // set whether or not to automatically start animating
      autoStart: true,

      // custom set of 'in' effects. This effects whether or not the 
      // character is shown/hidden before or after an animation  
      inEffects: [],

      // custom set of 'out' effects
      outEffects: [ 'fadeIn' ],

      // in animation settings
      in: {
        // set the effect name
        effect: 'fadeIn',

        // set the delay factor applied to each consecutive character
        delayScale: 1.5,

        // set the delay between each character
        delay: 50,

        // set to true to animate all the characters at the same time
        sync: false,

        // randomize the character sequence 
        // (note that shuffle doesn't make sense with sync = true)
        shuffle: false,

        // reverse the character sequence 
        // (note that reverse doesn't make sense with sync = true)
        reverse: false,

        // callback that executes once the animation has finished
        callback: function () {}
      },

      // out animation settings.
      out: {
        effect: 'fadeOut',
        delayScale: 1.5,
        delay: 50,
        sync: false,
        shuffle: false,
        reverse: true,
        callback: function () {}
      },

      // callback that executes once textillate has finished 
      callback: function () {},

      // set the type of token to animate (available types: 'char' and 'word')
      type: 'char'
    });
}



/** [ 2.4 ] - Header Animation Text click through
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

function animationText2() {
    $('.tlt2').textillate({
      // the default selector to use when detecting multiple texts to animate
      selector: '.texts',

      // enable looping
      loop: true,

      // sets the minimum display time for each text before it is replaced
      minDisplayTime: 2000,

      // sets the initial delay before starting the animation
      // (note that depending on the in effect you may need to manually apply 
      // visibility: hidden to the element before running this plugin)
      initialDelay: 0,

      // set whether or not to automatically start animating
      autoStart: true,

      // custom set of 'in' effects. This effects whether or not the 
      // character is shown/hidden before or after an animation  
      inEffects: [],

      // custom set of 'out' effects
      outEffects: [ 'fadeIn' ],

      // in animation settings
      in: {
        // set the effect name
        effect: 'fadeIn',

        // set the delay factor applied to each consecutive character
        delayScale: 1.5,

        // set the delay between each character
        delay: 50,

        // set to true to animate all the characters at the same time
        sync: true,

        // randomize the character sequence 
        // (note that shuffle doesn't make sense with sync = true)
        shuffle: false,

        // reverse the character sequence 
        // (note that reverse doesn't make sense with sync = true)
        reverse: false,

        // callback that executes once the animation has finished
        callback: function () {}
      },

      // out animation settings.
      out: {
        effect: 'fadeOut',
        delayScale: 1.5,
        delay: 50,
        sync: true,
        shuffle: false,
        reverse: false,
        callback: function () {}
      },

      // callback that executes once textillate has finished 
      callback: function () {},

      // set the type of token to animate (available types: 'char' and 'word')
      type: 'char'
    });
}



/**
 *  -------------------------------------------------------------------------------
 *  [ 3 ] - Data Attributes Options
 *  -------------------------------------------------------------------------------
 *
 *  This part contains the codes of almost all data attribute options used for
 *  custom elements and css options
 *
 *  ------
 *
 *  It has the following code:
 *
 *     |
 *     |-->  [ 3.1 ] - Background Color
 *     |-->  [ 3.2 ] - Background Color Opacity
 *     |-->  [ 3.3 ] - Parallax Background Image
 *     |-->  [ 3.4 ] - Divider Space
 *     |-->  [ 3.5 ] - Pattern Overlay options
 *
 */



/** [ 3.1 ] - Background Color
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// Custom background color
$( "*[data-background-color]" ).each(function() {
	var customBackgroundColor = $( this ).data( "background-color" );
	$( this ).css( "background-color" , customBackgroundColor );
});



/** [ 3.2 ] - Background Color Opacity
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// Custom background color opacity
$( "*[data-background-color-opacity]" ).each(function() {
	var customBackgroundColorOpacity = $( this ).data( "background-color-opacity" ),
		backgroundColor = $( this ).css( "background-color" );

	// Conversion of rgb to rgba
	var rgbaBackgroundColor = backgroundColor.replace( "rgb" , "rgba" ).replace( ")" , ", " + customBackgroundColorOpacity + ")" );
	$( this ).css( "background-color" , rgbaBackgroundColor );
});



/** [ 3.3 ] - Parallax Background Image
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// Custom Parallax background image
$( "*[data-parallax-background-image]" ).each(function() {
	var customParallaxBackgroundImage = $( this ).data( "parallax-background-image" );
	$( this ).css( "background-image" , "url('" + "./images/files/parallax-background-images/" + customParallaxBackgroundImage + "')" );
});



/** [ 3.4 ] - Divider Space
 *  ~~~~~~~~~~~~~~~~~~~~~~
 */

// Custom divider space 
$( "*[data-divider-space]" ).each(function() {
    var customDividerSpaceHeight = $( this ).data( "divider-space" );
    $( this ).css( "height" , parseInt( customDividerSpaceHeight ) );
});



/** [ 3.5 ] - Pattern Overlay options
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

// Custom pattern overlay darkness opacity
$( "*[data-pattern-overlay-darkness-opacity]" ).each(function() {
  // 0 value is not read by jquery, but 0.0 is read! in case of making condition "if"
  var patternOverlayDarknessOpacity = $( this ).data( "pattern-overlay-darkness-opacity" );
  $( this ).css( "background-color" , convertHex( "#000000" , patternOverlayDarknessOpacity ) );
});

// disable pattern overlay background image [ dots only ]
$( "*[data-pattern-overlay-background-image]" ).each(function() {
  if ( $( this ).data( "pattern-overlay-background-image" ) == "none" ) {
    $( this ).css( "background-image" , "none" );
  } else if ( $( this ).data( "pattern-overlay-background-image" ) == "yes" ) {
    $( this ).css( "background-image" );
  }
});

// remove pattern overlay
$( "*[data-remove-pattern-overlay]" ).each(function() {
  if ( $( this ).data( "remove-pattern-overlay" ) == "yes" ) {
    $( this ).css( "background" , "none" );
  /**
   *  In HTML, add expressive word like "none" to know what this option indicates for.  
   *  Using this word has no direct effect or any another word, it's only word with meaning 
   *  to help to know what this attribute value is doing.
   */
  }
});


// ===== Function to get rgba value of Hex color value ===== //
function convertHex( hex , opacity ){
  // var r, g, b, result;
    hex = hex.replace( '#' , '' );
    r = parseInt( hex.substring( 0 , 2 ) , 16 );
    g = parseInt( hex.substring( 2 , 4 ) , 16 );
    b = parseInt( hex.substring( 4 , 6 ) , 16 );

    result = 'rgba('+r+', '+g+', '+b+', '+opacity+')';
    return result;
}


/**
 *  -------------------------------------------------------------------------------
 *  [ 4 ] - Forms
 *  -------------------------------------------------------------------------------
 *
 *  This part contains the codes of forms used like Contact Form and Mailchimp
 *  Subscribe Form
 *
 *  ------
 *
 *  It has the following code:
 *
 *     |
 *     |-->  [ 4.1 ] - Contact Form
 *     |-->  [ 4.2 ] - Mailchimp Subscribe Form
 *
 */



/** [ 4.1 ] - Contact Form
 *  ~~~~~~~~~~~~~~~~~~~~~~
 */

function headerFormValidation() {
    $( "#contact-form" ).validate({
        // rules
        rules: {
            name: {
                required: true,
                minlength: 4
            },
            email: {
                required: true,
                email: true
            },
            message: {
                required: true,
                minlength: 4,
                maxlength: 500
            }
        },

        // messages
        messages: {
            name: {
                required: "Please enter your full name.",
                minlength: "Full name must consist of at least {0} characters."
            },
            email: {
                required: "Please enter your email address."
            },
            message: {
                required: "Please enter your message.",
                minlength: "your message must be at least {0} characters.",
                maxlength: "your message must be at most {0} characters."
            }
        }
    });

    $( "#contact-form" ).on( "submit", function(event) {
        if ( event.isDefaultPrevented() ) {
            formError();
            var errorContent =  '<img src="images/files/form-message/error.png">' +
                                '<h5 style="color:#C75C5C;">Something Went Wrong!</h5>' +
                                '<p>E-mail must be valid and your name must be longer than 4 character.</p>';
            submitMSG(false, errorContent);
        } else {
            // everything looks good!
            event.preventDefault();
            submitForm();
        }
    });  
}



function submitForm(){
    // Initiate Variables With Form Content
    var name  = $("#name").val();
    var email = $("#email").val();
    var message = $("#message").val();
 
    $.ajax({
        type: "POST",
        url: "php/form-process.php",
        data: "name=" + name + "&email=" + email + "&message=" + message,
        success : function(text){
            if (text == "success"){
                formSuccess();
            } else {
                formError();
                submitMSG(false,text);
            }
        }
    });
}



function formSuccess(){
    $("#contact-form")[0].reset();

    var successContent =  '<img src="images/files/form-message/send.png">' +
                          '<h5 style="color:#4F5D73;">Your Message already Send</h5>' +
                          '<p>This is a sample notification that will appear the right bottom corner.</p>';
	submitMSG(true, successContent);
}



function formError(){
    //Animation Phone Form when made error in validation
    $("#header-featured-form").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
        $(this).removeClass();
    });
}



function submitMSG(valid, msg){
    var msgClasses;
    if(valid){
        //Animation Form Notification when it appear
        msgClasses = "bounceInRight animated";
    } else {
        msgClasses = "bounceInRight animated appearing-delay";
    }

    $("#msgSubmit").removeClass().addClass(msgClasses).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
        $(this).removeClass();
    });
    $("#msgSubmit").children(".msgSubmit-content").html(msg);
}



//Animation Form Notification when click to close icon
$('#msgSubmit').find('i').on( "click", function() {
    $(this).parent("#msgSubmit").addClass( "bounceOutLeft animated" ).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
        $(this).removeClass( "appearing-delay" );
    });
});




/** [ 4.2 ] - Mailchimp Subscribe Form
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

$( "#subscribe-form" ).ajaxChimp({
    callback: mailchimpCallback,
    url: "http://themeforest.us12.list-manage.com/subscribe/post?u=271ee03ffa4f5e3888d79125e&amp;id=163f4114e2" //Replace this with your own mailchimp post URL. 
});



function mailchimpCallback(resp) {
    if (resp.result === 'success') {
        $('.subscribe-result').hide().html('<div class="success">' + resp.msg + '</div>').slideDown().delay(10000).slideUp();
    }
    else if (resp.result === 'error') {
        $('.subscribe-result').hide().html('<div class="error">' + resp.msg + '</div>').slideDown().delay(10000).slideUp();
    }
}





// "Switcher"--------------------------------------------------//

$(document).ready(function(){
    $("#style-switcher button").click(function(){
        $("link[href*='skin']").attr("href", "css/color/" + $(this).val() + ".css");
    });
});

$(document).ready(function(){
    $("#style-switcher i").click(function(){
        $('#style-switcher').toggleClass('show');
    });
});
