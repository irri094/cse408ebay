$('#btn_buy_product').click(function () {

    $.ajax(
        {
            url: "/buy_product",
            method: 'GET',
            success: function (data) {

                if(data.status == 1){
                    console.log("product bought")

                    document.getElementById('cart-table-body-id').innerHTML = ""

                    swal("Order Successful!", "All of your products have been successfully ordered ", "success");

                    // document.getElementById('notification_head_strong_id').innerHTML = "Successful"
                    // document.getElementById('notification_body_id').innerHTML = "You have successfully bought the products."
                    // $("#toast_id").toast("show")

                }
            }
        }
    )
})


$("#cart_table_id").on("click", ".btn-update-cart", function () {

    let id = $(this).attr('data-cart-detail')
    let quantity_field_id = "#input_quantity_" + id
    let product_quantity = $(quantity_field_id).val()

    mydata = {
        update_id: $(this).attr('data-cart-detail'),
        new_quantity : product_quantity,
    }

    console.log(mydata)
    $.ajax(
        {
            url: "update_to_cart/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                console.log("success")
            }
        }
    )

})


$("#cart_table_id").on("click", ".btn-remove-cart-entry", function () {
    console.log("btn remove pressed")


    mydata = {
        remove_id: $(this).attr('data-history-detail')
    }

    console.log(mydata)
    $.ajax(
        {
            url: "remove_from_cart/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                console.log("success")
            }
        }
    )

})


$('#btn_recharge_wallet').click(function () {
    console.log('button pressed')

    $.ajax(
        {
            url: "recharge_wallet/",
            method: 'GET',
            success: function (data) {
                console.log("everything done properly and received")
            }
        }
    )
})