/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function () {

    console.log("testing");
    $('#header-desktop').load('jsp/HeaderDesktop.jsp');
    $('#footer').load('jsp/Footer.jsp');
    $('.comments-Section, .backto-Top').hide();

    //look for link
    $('p , pre').linkify({
        target: '_blank' //open new window
    });

// loadd nav
    function headerReload() {
        if ($(window).width() >= 1536) {
            $('#header-desktop').load('jsp/HeaderDesktop.jsp');
        } else {
            $('#header-mobile').load('jsp/Header.jsp');
        }
    }
    $(window).on('load resize', headerReload);


//  var imgForHeader = document.getElementById('imgLink').value;
//    var img = document.createElement('IMG');
//    img.style.borderRadius = '50%';
//    img.setAttribute('src', imgForHeader);
//    img.setAttribute('width', '80');
//    img.setAttribute('height', '80');
//  $('#userImg-inNav').append(img);

});


//   alert($(window).width());
//    
//freeze post and news band  
window.addEventListener('scroll', headerFreeze);
var eL = document.getElementById('displayDate');
var postSticky = eL.offsetTop;

function headerFreeze() {
    if (window.pageYOffset >= postSticky) {
        $('#displayDate').addClass('headerFreeze');
        $('#userprofile-Box').addClass('profileBoxFreeze');
        $('.backto-Top').show();
    } else {
        $('.backto-Top').hide();
        $('#displayDate').removeClass('headerFreeze');
        $('#userprofile-Box').removeClass('profileBoxFreeze');
    }
}



//virify content will be deleted to all users
var deleteLinks = document.querySelectorAll('#delete');
for (var i = 0; i < deleteLinks.length; i++) {
    deleteLinks[i].addEventListener('click', function (event) {
        event.preventDefault();
        var choice = confirm(this.getAttribute('data-confirm'));
        if (choice) {
            window.location.href = this.getAttribute('href');
        }
    });
}
;

//virify user are being disable
function confirmDisabled() {
    var disabled = confirm('This user will be disabled');
    if (disabled)
        return true;
    else
        return false;

}
//verifiy user are beeing enable
function confirmEnabled() {
    var disabled = confirm('This user will be enabled');
    if (disabled)
        return true;
    else
        return false;
}

// verify content will be deleted from Database for admin ***
function cleanUp()
{
    var cleanUp = confirm('This action will delete 100 items '
            + ' from your database do you wish to continue? ');
    if (cleanUp)
        return true;
    else
        return false;
}

// toggle comments-section to see posted comments
$('.show-Comments').click(function () {
    $(this).closest('div').find('.comments-Section').toggle();
    var switchText = $(this);
    switchText.text() === switchText.data("text-swap")
            ? switchText.text(switchText.data("text-original"))
            : switchText.text(switchText.data("text-swap"));
});

//back to top function
$('.backto-Top').click(function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
});


// doesn't work well with long post and comments
//    $(function () {
//        var elements = $(document), fadeElements = $('.pre-posts, .newsContents');
//        elements.on('scroll', function () {
//            var currentScrollPosition = elements.scrollTop();
//
//            fadeElements.each(function () {
//                var thisEl = $(this), 
//                elementOffsetTop = thisEl.offset().top  + 200;
//                
//                if (currentScrollPosition > elementOffsetTop)
//                    thisEl.css('opacity',1 - (currentScrollPosition - elementOffsetTop) /1750);
//                else 
//                    thisEl.css('opacity',9 - (currentScrollPosition - elementOffsetTop) /400);
//            });
//        });
//    });
//
//    
