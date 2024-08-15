let map;
async function initMap() {
	const { Map, InfoWindow } = await google.maps.importLibrary("maps");
	const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
	const { Place } = await google.maps.importLibrary("places");
	
	const map = new Map(document.getElementById("map"), {
		center: {lat: 32.2734, lng: -110.9862},
		zoom: 16,
		disableDefaultUI: true,
		mapId: '55c808617a8dfe78',
	});

	const place = new Place({
		id: "ChIJBZWZYeRz1oYRezPPnMGzlrI",
	});
	await place.fetchFields({
		fields: ["displayName", "formattedAddress", "location"],
	});

	const marker = new AdvancedMarkerElement({
		map,
		position: place.location,
		title: place.displayName,
	});
	const infoWindow = new InfoWindow();

	const contentString =
		'<div id="map-label"><p><b>Sebring Automotive</b></p>' +
		"<p>861 W. Thurber Rd. </p>" +
		"<p>Tucson, AZ 85705 </p>" +
		'<a target="_blank" href="https://maps.google.com/maps?ll=32.273289,-110.986443&z=19.661129596194066&t=m&hl=en-US&gl=US&mapclient=apiv3&cid=12868670629398655867">' +
		"View On Google Maps</a></div> ";
	const infowindow = new google.maps.InfoWindow({
		content: contentString,
		ariaLabel: "Sebring Automotive",
	});

	marker.addListener("click", () => {
		infowindow.open({
				anchor: marker,
				map,
		});
	});
}
window.initMap = initMap;