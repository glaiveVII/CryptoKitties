import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/flatpickr"

import { initMapbox } from '../plugins/init_mapbox';
import { initSweetalert } from './init_mapbox';

initSweetalert('.sweet-alert-dem', {
  title: "You will receive 1 eth",
  text: "AirTop is great, isn't it?",
  icon: "success"
});


initMapbox();

