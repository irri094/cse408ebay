$('.btn-order').click(function () {
    console.log("order pressed")

    let order_id = $(this).attr("data-order-id")

    $('#btn-deliveryman-confirmation').attr('data-order-id', order_id)

    // let otp = document.getElementById('handover_otp_input_id').innerText
    console.log(order_id)


})


$('#btn-deliveryman-confirmation').click(function () {

    let order_id = $(this).attr("data-order-id")
    let otp = $('#handover_otp_input_id').val()
    $('#handover_otp_input_id').val("")
    mydata = {
        'otp' : otp,
        'order_id' : order_id,
    }

    console.log(mydata)

    $.ajax(
        {
            url: "confirm_deliveryman/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    status_id = "status_" +  order_id
                    document.getElementById(status_id).innerHTML='<span class="badge rounded-pill text-bg-info">Picked Up</span>'
                    console.log('deliveryman_confirmed')
                    Swal.fire(
                        'Deliveryman Authentication Successful!',
                        'You can handover the product to your deliveryman',
                        'success'
                    )
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Deliveryman Authentication Failed',
                        text: 'Please re-enter the OTP and try again',
                    })

                }
            }
        }
    )

})
