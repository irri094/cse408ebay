$('#add_to_cart').click(function () {
    console.log("button pressed")

    let cart_button = document.getElementById("add_to_cart")
    let seller_id = cart_button.getAttribute("data-seller-id")
    let product_id = cart_button.getAttribute("data-product-id")
    let product_quantity = $("#input_quantity").val()

    mydata = {
        seller_id: seller_id,
        product_id: product_id,
        quantity : product_quantity
    }

    console.log(mydata)

    $.ajax(
        {
            url: "/add_to_cart",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1){
                    console.log("data added to cart done")
                }
            }
        }
    )

})


