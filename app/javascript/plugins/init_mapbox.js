import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/clotildelacaille/ckowykosf11l418oahozxlsmj'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    console.log(marker);
    console.log(marker.marker_icon);
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

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};
export { initMapbox };
