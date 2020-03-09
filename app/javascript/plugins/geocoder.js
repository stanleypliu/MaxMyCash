import MapboxGeocoder from 'mapbox-gl-geocoder'
require('../../node_modules/@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css')

mapboxgl.accessToken = '<your access token here>';
var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
    placeholder: 'Rechercher'
});
document.getElementById('geocoder').appendChild(geocoder.onAdd());
