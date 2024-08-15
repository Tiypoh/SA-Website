var buttonReveal = document.getElementById('reveal');
var element = document.getElementById('hidden');
var buttonHide = document.getElementById('hide');

function toggleHide() {
  element.classList.toggle('hidden');
  buttonReveal.classList.toggle('hidden');
  buttonReveal.classList.toggle('display');
}

buttonReveal.addEventListener('click', toggleHide);
buttonHide.addEventListener('click', toggleHide);