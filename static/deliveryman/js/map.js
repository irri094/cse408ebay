// fetching the coordinate of the deliveryman from a hidden field.
let del_man_coord = $('#deliveryman_cord_hidden').attr('data-coord-id').split(',')

// shop initialization
let map = L.map('map').setView([23.727361, 90.389549], 16);
let osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Bengal Bay contributors'
}).addTo(map);

osm.addTo(map);

// custom shop icon initialization
var shop_icon = L.icon({
    iconUrl: '../../static/icons/icon-shop.png',
    iconSize: [40, 40],
    iconAnchor: [10, 20],
});

// sets the coordinates of the deliveryman and shop

shop_corrd = ['23.727361', '90.389549'] // lat , lng
deliveryman_coord = [del_man_coord[0], del_man_coord[1]]    // lat, lng

let shop_marker = "";
let shop_route = ""
//  creates markers for the deliveryman and shop_marker
var deliveryman_marker = L.marker(deliveryman_coord).addTo(map)
// var shop_marker = L.marker(shop_corrd, {icon: shop_icon}).addTo(map)

// creates the route from deliveryman to shop
// L.Routing.control({
//     waypoints: [
//         L.latLng(shop_corrd[0], shop_corrd[1]),
//         L.latLng(deliveryman_coord[0], deliveryman_coord[1])
//     ],
//     createMarker: function () {
//         return null;
//     }
// }).addTo(map);

// 23.728370854422128 and longitude: 90.39183855056763

// let dummy_corrd = [23.728370854422128, 90.39183855056763]
//
// dummy_marker = L.marker(dummy_corrd,
//     {
//         draggable: true,
//     }).addTo(map)
//
//
// dummy_marker.on("drag", function (e) {
//     var marker = e.target;
//     var position = marker.getLatLng();
//     console.log("position " + position)
//     map.panTo(new L.LatLng(position.lat, position.lng));
// });

$('.btn-shop-navigate').click(function () {
    if (shop_marker !== "") {
        map.removeLayer(shop_marker)
        map.removeLayer(shop_route)
    }

    let shop_cordinate = $(this).attr('data-coord-id').split(',')
    shop_marker = L.marker(shop_cordinate, {icon: shop_icon}).addTo(map)

    // recenters the map to the shops coordinate
    map.setView(shop_cordinate, 16);

    // creates the route from deliveryman to shop
    shop_route = L.Routing.control({
        waypoints: [
            L.latLng(shop_cordinate[0], shop_cordinate[1]),
            L.latLng(deliveryman_coord[0], deliveryman_coord[1])
        ],
        createMarker: function () {
            return null;
        }
    }).addTo(map)


})
