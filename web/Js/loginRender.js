/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const contentSnow = `
    <div class="snowflake">
        ❅
    </div>
    <div class="snowflake">
        ❅
    </div>
    <div class="snowflake">
        ❆
    </div>
    <div class="snowflake">
        ❄
    </div>
    <div class="snowflake">
        ❅
    </div>
    <div class="snowflake">
        ❆
    </div>
    <div class="snowflake">
        ❄
    </div>
    <div class="snowflake">
        ❅
    </div>
    <div class="snowflake">
        ❆
    </div>
    <div class="snowflake">
        ❄
    </div>
`;

document.getElementById('snowflakes').innerHTML = contentSnow;

const contentSlide = `
    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="Images/login-slide-1.jpg" style="width:100%;">
        </div>
        <div class="mySlides fade">
            <img src="Images/login-slide-2.png" style="width:100%">
        </div>
        <div class="mySlides fade">
            <img src="Images/login-slide-3.png" style="width:100%">
        </div>
    </div>
    <div style="position:absolute;bottom:0;right:50%;transform: translateX(50%);line-height:3">
        <span class="dot" onclick="currentSlide(0)"></span> 
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
    </div>
    `;

document.getElementById('login-slide').innerHTML = contentSlide;

var slideIndex;
function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";  
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
 
      slides[slideIndex].style.display = "block";  
      dots[slideIndex].className += " active";
      slideIndex++;
      if (slideIndex > slides.length - 1) {
        slideIndex = 0
      }    
      setTimeout(showSlides, 20000);
}
showSlides(slideIndex = 0);
function currentSlide(n) {
    showSlides(slideIndex = n);
}