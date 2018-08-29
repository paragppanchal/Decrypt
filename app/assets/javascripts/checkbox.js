// $('#checkbox').change(function(){

//     if($(this).is(':checked')){
//         // Checkbox is checked.
//         $("#divToBeRefreshed").html('your content');
//     }else{
//         // Checkbox is not checked.
//     }

// });

document.querySelectorAll('.refine-results ul li input').forEach((checkbox) => {

  checkbox.addEventListener('change', () => {
    // console.log(checkbox);
    document.querySelector('.refine-results form button').click();
  })
})

// uncheck check on refine search

$(document).ready(function(){
  $('.js-select-all').on('change', function(){
    $('input:checkbox').prop('checked', this.checked);

    $('.js-select-all-fields').toggle(!this.checked);
    $('.js-unselect-all-fields').toggle(this.checked);
  })
})
