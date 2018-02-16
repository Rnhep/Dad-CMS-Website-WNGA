/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function () {
    console.log("testing");

    $('#header').load('jsp/Header.jsp');
//$('#header-about-us').load('jsp/Header.jsp');
    $('#footer').load('jsp/Footer.jsp');
//look for link in plain text
    $('p , pre').linkify({
        target: '_blank'
    });
//virify delete button
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



});


