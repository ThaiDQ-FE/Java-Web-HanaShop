/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var searchValue = document.getElementById('searchValue');
var typed = document.getElementById('typed');
searchValue.addEventListener('focus', function () {
    typed.classList.add("disable");
});

searchValue.addEventListener('blur', function () {
    if (searchValue.value === '') {
        typed.classList.remove("disable");
    } else {
        typed.classList.add("disable");
    }
});


