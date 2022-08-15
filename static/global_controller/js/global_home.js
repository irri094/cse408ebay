/*!
* Start Bootstrap - Shop Homepage v5.0.5 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project


$('.btn-add-to-cart-global-home').click(function () {
    console.log("button pressed")

    let seller_id = $(this).attr('data-seller-id')
    let product_id = $(this).attr("data-product-id")
    let product_quantity = 1

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
