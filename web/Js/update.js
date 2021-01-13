/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var checkBox = document.getElementById("update-checkbox");
var btnImg = document.getElementById("update-btn-img");
var btn = document.getElementById("update-btn");
var file = document.getElementById("update-file");
btn.setAttribute("disabled", true);
checkBox.addEventListener('click', function () {
    if (checkBox.checked === true) {
        btnImg.removeAttribute("disabled");
        file.removeAttribute("disabled");
        btn.setAttribute("disabled", true);
    } else {
        btnImg.setAttribute("disabled", true);
        file.setAttribute("disabled", true);
        btn.removeAttribute("disabled");
    }
})
