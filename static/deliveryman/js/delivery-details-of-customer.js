
let pressed_authenticate_button = ''

$('#btn-customer-confirmation').click(function () {

    // Fetch Data
    let otp_value = document.getElementById('customer_otp_id').value
    let val_order_id = document.getElementById('txt_order_id').value

    //Initialize the otp field to empty
    document.getElementById('customer_otp_id').value = ''

    mydata = {
        otp : otp_value,
        order_id : val_order_id,
    }

    console.log(mydata)

    $.ajax(
        {
            url: "authenticate-customer",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    $(pressed_authenticate_button).closest("tr").fadeOut()

                    Swal.fire({
                        icon: 'success',
                        title: 'Customer authentication successful',
                    })

                }
                else{
                    Swal.fire({
                        icon: 'error',
                        title: 'Customer authentication failed',
                    })
                }
            }
        }
    )

})




$('.btn-authenticate-customer').click(function () {

    document.getElementById('txt_order_id').value = $(this).attr('data-order-id')
    pressed_authenticate_button = this
})


