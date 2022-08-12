$('#btn_buy_product').click(function () {
    mydata = {}
    $.ajax(
        {
            url: "/buy_product",
            method: 'GET',
            data: mydata,
            success: function (data) {
                console.log("everything done properly")
            }
        }
    )
})


$("#cart_table_id").on("click", ".btn-update-cart", function () {
    console.log("btn update pressed")

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