import mapboxgl from 'mapbox-gl'

const initMapbox = () => {
  const mapElement = document.getElementById('map')

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5 })
  }


  if (mapElement) {
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
  }
}

export { initMapbox }
