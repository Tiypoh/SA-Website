const openLgimageBtn = document.querySelector('.open-lgimage');
const lgimage = document.getElementById('lgimage');
const closeLgimageBtn = document.querySelector('.close-lgimage');

openLgimageBtn.addEventListener('click', () => {
  lgimage.classList.remove('hidden');  // Show the lgimage on click
});

closeLgimageBtn.addEventListener('click', () => {
  lgimage.classList.add('hidden');  // Hide the lgimage on close button click
});