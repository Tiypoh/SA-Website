var toggleButtons = document.querySelectorAll('.toggle');

function toggleSection(event) {
	const clickedButton = event.target;
	const targetSectionId = clickedButton.dataset.section;
	const elements = document.querySelectorAll('.' + targetSectionId);

	elements.forEach(element => {
		element.classList.toggle('hidden');
		element.classList.toggle('display');
	});
}

toggleButtons.forEach(button => button.addEventListener('click', toggleSection));