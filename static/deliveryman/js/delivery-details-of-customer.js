let otp_value = document.getElementById('customer_otp_id').value

document.getElementById('txt_order_id').value = 23


$('#btn-customer-confirmation').click(function () {
    console.log("button pressed")

    let otp_value = document.getElementById('customer_otp_id').value
    let val_order_id = document.getElementById('txt_order_id').value


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
    console.log("button pressed")

    let order_id = $(this).attr('data-order-id')
    document.getElementById('txt_order_id').value = order_id

    mydata = {
        seller_id: seller_id,
        product_id: product_id,
        quantity: product_quantity
    }

    console.log(mydata)

    $.ajax(
        {
            url: "/add_to_cart",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {
                    document.getElementById('cartCount').innerHTML = data.cart_size
                    document.getElementById('notification_head_strong_id').innerHTML = "Successful"
                    document.getElementById('notification_body_id').innerHTML = "Product added to cart"
                    $("#toast_id").toast("show")

                }
            }
        }
    )

})


