<<<<<<< HEAD
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) 
      .addTo(map);
  });
};
=======
import mapboxgl from 'mapbox-gl'

const initMapbox = () => {
  const mapElement = document.getElementById('map')

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5 })
  }
>>>>>>> bfdb917a09bcc155db7903892c6d688cb838892c


  if (mapElement) {
<<<<<<< HEAD
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
=======
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    })
    const markers = JSON.parse(mapElement.dataset.markers)
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
      new mapboxgl.Marker({
        color: "#AFFFFA",
        draggable: true
      })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map)
    })
    fitMapToMarkers(map, markers)
    map.addControl(new mapboxgl.NavigationControl())
>>>>>>> bfdb917a09bcc155db7903892c6d688cb838892c
  }
}

export { initMapbox }
