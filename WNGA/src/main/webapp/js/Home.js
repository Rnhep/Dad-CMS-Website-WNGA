/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function () {
 
    console.log("testing");
    $('#header-desktop').load('jsp/HeaderDesktop.jsp');
    $('#footer').load('jsp/Footer.jsp');

});
//    alert("Your screen resolution is: " + "heigh" + $(window).height() +  " " +'width' + $(window).width());
//look for link in plain text
    $('p , pre').linkify({
        target: '_blank'
    });
    //     alert($(window).width());
// loadd nav
function headerReload() {
    if ($(window).width() >= 1536) {
//             alert($(window).width());
        $('#header-desktop').load('jsp/HeaderDesktop.jsp');
    } else {
        $('#header-mobile').load('jsp/Header.jsp');
    }
}
$(window).on('load resize', headerReload);

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
};

//virify user are being disable
function confirmDisabled(){
    var disabled = confirm('This user will be disabled');
    if (disabled)
        return true;
    else
        return false;

}
//verifiy user are beeing enable
function confirmEnabled(){
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
