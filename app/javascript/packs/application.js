import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

flatpickr(".datepicker", {
  defaultDate: "today",
  altInput: true,
  dateFormat: "d.m.Y",
  minDate: "today",
  maxDate: new Date().fp_incr(30)
});
