let map = L.map('map').setView([23.727361, 90.389549], 16);
let osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Bengal Bay contributors'
}).addTo(map);

// L.marker([23.727361, 90.389549]).addTo(map)

// L.marker([23.727361, 90.389549],
//     {
//         draggable: true,
//     }).addTo(map)

let dummy_corrd = [23.727361, 90.389549]

let dummy_marker = L.marker(dummy_corrd,
    {
        draggable: true,
    }).addTo(map)


dummy_marker.on("drag", function (e) {
    var marker = e.target;
    var position = marker.getLatLng();

    $('#coordinate').val(position.lat + ", " + position.lng)

    console.log("position " + position)
    map.panTo(new L.LatLng(position.lat, position.lng));
});