// get the modal
var modal = document.getElementById('myModal');
// get the button that opwns the modal
var btn = document.getElementById("myBtn");
// get the span element that closes the modal
var span = document.getElementsByClassName("close")[0];

if (btn) {
  //when the user clocks the button, open the modal
  btn.onclick = function() {
      modal.style.display = "block";
  }
}

if (span) {
  // when the user clicks on <span> (x), close the modal
  span.onclick = function() {
      modal.style.display = "none";
  }
}
// when the user clicks anywhere outside of the modal, close it
if (window) {
  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }
}

// compare-modal

window.createModals = function(){
   $('.js-results-list').each (function(){
    const button = $('.js-exchange-modal-click', this);
    const modal = $('.js-exchange-modal', this);
    button.on('click', function(){
      modal.toggleClass('exchange-modal-active');
    });
  });
}

window.createModals();
