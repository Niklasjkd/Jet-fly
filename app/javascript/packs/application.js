import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import "../plugins/flatpickr"

import { initMapbox } from "../components/init_mapbox";
initMapbox();

import { initAutocomplete } from "../components/init_autocomplete";
initAutocomplete();
