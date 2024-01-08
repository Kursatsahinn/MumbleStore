let slideIndex = 1;
showSlides(slideIndex);

// Otomatik slayt geçişi için zamanlayıcı (5000ms = 5 saniye)
let slideInterval = setInterval(function () { plusSlides(1); }, 3000);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
  resetSlideTimer();
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
  resetSlideTimer();
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) { slideIndex = 1 }
  if (n < 1) { slideIndex = slides.length }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}

// Zamanlayıcıyı sıfırlama fonksiyonu
function resetSlideTimer() {
  clearInterval(slideInterval);
  slideInterval = setInterval(function () { plusSlides(1); }, 5000);
}
