let map;
async function initMap() {
	const { Map } = await google.maps.importLibrary("maps");
	const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
	
	const map = new Map(document.getElementById("map"), {
		center: {lat: 32.2734, lng: -110.9862},
		zoom: 16,
		disableDefaultUI: true,
		mapId: '5c9c80a02eaa1010',
	});
	const marker = new AdvancedMarkerElement({
		map,
		position: {lat: 32.2735, lng: -110.98621},
		title: 'Sebring Automotive',
	});
}
window.initMap = initMap;