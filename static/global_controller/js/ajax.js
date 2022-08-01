$('#add_to_cart').click(function () {
    console.log("button pressed")

    let cart_button = document.getElementById("add_to_cart")
    let seller_id = cart_button.getAttribute("data-seller-id")
    let product_id = cart_button.getAttribute("data-product-id")
    let product_quantity = $("#input_quantity").val()

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


