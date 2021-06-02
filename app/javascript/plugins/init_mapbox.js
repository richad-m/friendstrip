// import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
    container: mapElement,
      style: 'mapbox://styles/clotildelacaille/ckpcbb7gp4xt717o1goyt8zoc'
  });
};

const addRoute = (map, steps) => {
  map.on('load', function() {
    map.addSource('driving', {
      type: 'geojson',
      data: {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: steps
        }
      }
    });
    map.addLayer({
      id: 'driving',
      type: 'line',
      source: 'driving',
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      // paint: {
      //   'line-color': rideColor,
      //   'line-width': 4
      // }
    });
  });
}

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    const element = document.createElement('div');
    element.className = 'marker';
    element.insertAdjacentHTML("beforeend", marker.marker_icon);
    element.classList.add(marker.marker_color);
    // element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = (mapElement) => {
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    const steps = mapElement.dataset.steps;
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    if (steps) {
      addRoute(map, JSON.parse(steps));
    }
  }
};

export { initMapbox };
