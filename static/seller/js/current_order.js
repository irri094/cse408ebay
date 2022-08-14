$('#btn-deliveryman-confirmation').click(function () {
    console.log("confirm button pressed")

    mydata = {}

    console.log(mydata)

    $.ajax(
        {
            url: "confirm_deliveryman/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {
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
