// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', () => {

  star_click_listener = (star, star_arr) => {
    star.addEventListener('click', (e) => {
      let currentStar = e.target;
      console.log(star.id, currentStar);
      for(let i = 1; i <= 5; i++) {
        if (i <= currentStar.id) {
          star_arr[i - 1].classList.remove('far');
          star_arr[i - 1].classList.add('fas')
        } else {
          star_arr[i - 1].classList.add('far');
          star_arr[i - 1].classList.remove('fas');
        }
    }}
  )
  }

  document.querySelectorAll('.rating-star').forEach((star, i, stars) => star_click_listener(star, stars))
})
