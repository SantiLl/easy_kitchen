import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

flatpickr(".datepicker", {
  defaultDate: "today",
  altInput: true,
  dateFormat: "d.m.Y",
  minDate: "today",
  maxDate: new Date().fp_incr(30)
});

initMapbox();

initAutocomplete();
