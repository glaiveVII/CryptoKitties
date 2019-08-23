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

document.getElementById("copyButton").addEventListener("click", function() {
    copyToClipboard(document.getElementById("copyTarget"));
});

function copyToClipboard(elem) {
    // create hidden text element, if it doesn't already exist
    var targetId = "_hiddenCopyText_";
    var isInput = elem.tagName === "INPUT" || elem.tagName === "TEXTAREA";
    var origSelectionStart, origSelectionEnd;
    if (isInput) {
        // can just use the original source element for the selection and copy
        target = elem;
        origSelectionStart = elem.selectionStart;
        origSelectionEnd = elem.selectionEnd;
    } else {
        // must use a temporary form element for the selection and copy
        target = document.getElementById(targetId);
        if (!target) {
            var target = document.createElement("textarea");
            target.style.position = "absolute";
            target.style.left = "-9999px";
            target.style.top = "0";
            target.id = targetId;
            document.body.appendChild(target);
        }
        target.textContent = elem.textContent;
    }
    // select the content
    var currentFocus = document.activeElement;
    target.focus();
    target.setSelectionRange(0, target.value.length);

    // copy the selection
    var succeed;
    try {
        succeed = document.execCommand("copy");
    } catch(e) {
        succeed = false;
    }
    // restore original focus
    if (currentFocus && typeof currentFocus.focus === "function") {
        currentFocus.focus();
    }

    if (isInput) {
        // restore prior selection
        elem.setSelectionRange(origSelectionStart, origSelectionEnd);
    } else {
        // clear temporary content
        target.textContent = "";
    }
    return succeed;
}



initMapbox();

loadDynamicText();
