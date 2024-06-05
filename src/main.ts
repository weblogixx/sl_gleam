import '@shoelace-style/shoelace/dist/themes/light.css';
import '@shoelace-style/shoelace';
import * as gleam from './sl_gleam.gleam';

document.addEventListener('DOMContentLoaded', () => {
  gleam.main();
});

