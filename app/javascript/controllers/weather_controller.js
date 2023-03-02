import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  connect() {
    $("#select_country").off().change(function (e) {
      e.preventDefault();
      const country = {
        country: $(this).val()
      };
      $.ajax({
        type: "POST",
        url: "/city",
        data: country,
        async: false,
        success: function (response) {
          $('#select_state').empty().append('<option value="">Select State</option>')
          $.each(response, function( index, value ) {
            $('#select_state').append(`<option value="${index}">
                                       ${value}
                                  </option>`);

          });
        },
        error: function(response){
        }
      });
    });


    $("#select_state").off().change(function (e) {
      e.preventDefault();
      const state = {
        selected_country: $("#select_country").val(),
        state: $(this).val()
      };
      $.ajax({
        type: "POST",
        url: "/city",
        data: state,
        async: false,
        success: function (response) {
          $('#select_city').empty().append('<option value="">Select City</option>')
          $.each(response, function( index, value ) {
            $('#select_city').append(`<option value="${value}">
                                       ${value}
                                  </option>`);

          });
        },
        error: function(response){
        }
      });
    });

    $("#select_city").off().change(function (e){
      e.preventDefault();
      $("#city_name").val($(this).val());
    });

  }
}
