import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/flatpickr"

import { initMapbox } from '../plugins/init_mapbox';
import { loadDynamicText } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('.sweet-alert-demo', {
  title: "YOUR PURR-FECT FRIEND HAS BEEN CREATED",
  text: "This is a great KITTY, isn't it?",
  icon: "success"
});
initSweetalert('.sweet-alert-demo-2', {
  title: "THANK YOU FOR YOUR FEEDBACK",
  text: "This is a great KITTY, isn't it?",
  icon: "success"
});

const randId = document.querySelector(".rand-id");
const btn = document.querySelector("button");

// Random number from 0 to length
const randomNumber = (length) => {
  return Math.floor(Math.random() * length)
}

// Generate Pseudo Random String, if safety is important use dedicated crypto/math library for less possible collisions!
const generateID = (length) => {
  const possible =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  let text = "";

  for (let i = 0; i < length; i++) {
    text += possible.charAt(randomNumber(possible.length));
  }

  return text;
}

randId.innerText = generateID(16);

btn.addEventListener("click", () => {
  randId.innerText = generateID(16);
});




initMapbox();

loadDynamicText();
