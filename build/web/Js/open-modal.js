/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var modal = document.getElementById("model-add");
var btn = document.getElementById("open-modal");
var span = document.getElementsByClassName("close")[0];
var popupJs = document.getElementById("popup-js");
var popup = document.getElementById("myPopup");

btn.onclick = function () {
    modal.style.display = "block";
};
span.onclick = function () {
    modal.style.display = "none";
};

window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};

function myFunction() {
  var popup = document.getElementById("myPopup");
  popup.classList.toggle("show");
}



