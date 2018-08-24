var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];

if (btn) {
  btn.onclick = function() {
      modal.style.display = "block";
  }
}

if (span) {
  span.onclick = function() {
      modal.style.display = "none";
  }
}

if (window) {
  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }
}
