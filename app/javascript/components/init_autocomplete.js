import places from 'places.js';

const initAutocomplete = () => {
  const addressLocation = document.getElementById('location');
  if (addressLocation) {
    places({ container: addressLocation})
  }
  const addressDestination = document.getElementById('destination');
  if (addressDestination) {
    places({ container: addressDestination })
  }
};

(function() {
  var placesAutocomplete = places({
    appId: 'UM97PT333Y',
    apiKey: 'b0410f10f8af91d8e14252dccbfe943d',
    container: document.getElementById('location')
  });

  var $address = document.getElementById('address-value')
  placesAutocomplete.on('change', function(e) {
    $address.textContent = e.suggestion.value
  });

  placesAutocomplete.on('clear', function() {
    $address.textContent = 'none';
  });
});

export { initAutocomplete };
