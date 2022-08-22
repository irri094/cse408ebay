
let auction_start_time = $("#dt_auction_time_start").val()
let auction_end_time = $("#dt_auction_time_end").val()

console.log(auction_start_time)
console.log(auction_end_time)

// var countDownDate = new Date("Jan 5, 2024 15:37:25").getTime();
var countDownDate = new Date(auction_end_time).getTime();

// Update the count down every 1 second
var x = setInterval(function () {

    // Get today's date and time
    // var now = new Date().getTime();
    var now = new Date().getTime() + 6*60*60*1000;
    // console.log(Math.floor(now/1000))

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    if(days < 0){
        days = 0
    }
    if(hours < 0){
        hours = 0
    }
    if(minutes < 0){
        minutes = 0
    }
    if(seconds < 0){
        seconds = 0
    }

    // Display the result in the element with id="demo"
    document.getElementById("countdown_id").innerHTML = days + "d " + hours + "h "
        + minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);