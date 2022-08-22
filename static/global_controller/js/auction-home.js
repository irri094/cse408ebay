var i = 0;
var txt = "Want to place bid and win an auction? You're in the right place"; /* The text */
var speed = 40; /* The speed/duration of the effect in milliseconds */
if (i < txt.length) {
    document.getElementById("landing-text").innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
function typeWriter() {
  if (i < txt.length) {
    document.getElementById("landing-text").innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
}