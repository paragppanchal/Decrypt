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

// compare-modal
$('.js-results-list').each (function(){
  const button = $('.js-exchange-modal-click', this);
  const modal = $('.js-exchange-modal', this);
  button.on('click', function(){
    modal.toggleClass('exchange-modal-active');
  })

})

