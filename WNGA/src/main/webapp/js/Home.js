/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
console.log("testing");

//$('#header').load('jsp/header.jsp');
$('#header').load('jsp/Header.jsp');
$('#header-about-us').load('jsp/Header.jsp');
$('#footer').load('jsp/Footer.jsp');

$('#photo').on('click', function () {
  updateImage1();
        // $('#display-money').val(moneyIn.toFixed(2));
    });
    


});
 
