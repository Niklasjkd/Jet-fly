const flightCosts = () => {
  // const plane = document.querySelector(".plane_class").data("plane");
  const plane = $(".plane_class").data("plane");
  const price_per_min = plane.price_per_min;
  const price_base = plane.base_price;
  const location = plane.location;
  const destination = document.getElementById('destination').innerText;

  const price_per_hour_label = document.getElementById('flight_price_label');
  const total_price_label = document.getElementById('total_price_label');

  const url = "https://www.distance24.org/route.json?stops=" + "Düsseldorf" + "|" + destination;

  console.log(destination)
  console.log(url)

  fetch('https://jsonplaceholder.typicode.com/users', {
    mode: 'no-cors'})
  .then(checkStatus)
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch((error) => {
    console.log('There was an error', error);
  });



  // fetch(url, {
  //   mode: 'no-cors'
  // }).then((resp) => {

  //   const json = resp.json()
  //   if (resp.status >= 200 && resp.status < 300) {
  //     console.log(data)

  //     // 0,15832 flight time in min for 1 kilometer
  //   const flight_cost = data.distance * 0.15832 * plane.price_per_min

  //   price_per_hour_label.innerText = "Flight Cost: $" + flight_cost + " +"
  //   total_price_label.innerText = "Total Cost: $" + flight_cost + plane.base_price
  //   } else {
  //     console.log("no" + resp.status)
  //   }



  // });
}

function checkStatus(response) {
  if (response.ok) {
      return response;
  }
  console.log(response)
  console.log(response.statusText)
  let error = new Error(response.statusText);
  error.response = response;
  return Promise.reject(error);
}

export { flightCosts };
