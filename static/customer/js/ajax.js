$('#btn_buy_product').click(function () {

    $.ajax(
        {
            url: "/buy_product",
            method: 'GET',
            success: function (data) {

                if (data.status == 1) {
                    console.log("product bought")

                    document.getElementById('cart-table-body-id').innerHTML = ""

                    // swal("Order Successful!", "All of your products have been successfully ordered ", "success");

                    Swal.fire({
                        icon: 'success',
                        title: 'Order Successful!',
                        text: 'All of your products have been successfully ordered',

                    })

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
        new_quantity: product_quantity,
    }

    console.log(mydata)
    $.ajax(
        {
            url: "update_to_cart/",
            method: 'GET',
            data: mydata,
            success: function (data) {

                if (data.status == 1) {

                    document.getElementById('cart_count').innerHTML = data.cart_size
                    document.getElementById('notification_head_strong_id').innerHTML = "Successful"
                    document.getElementById('notification_body_id').innerHTML = "Product updated successfully"
                    $("#toast_id").toast("show")

                }
                console.log("success")
            }
        }
    )

})


$("#cart_table_id").on("click", ".btn-remove-cart-entry", function () {
    console.log("btn remove pressed")

    let del_button = this

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

                $(del_button).closest("tr").fadeOut()

                console.log('success')

            }
        }
    )

})


$('#btn_recharge_wallet').click(function () {
    console.log('recharged wallet ajax22')

    let mobilenumber = $("#mobilenumber").val()
    console.log(mobilenumber)
    let otp = $("#otp").val()
    let taka = $("#taka").val()


    mydata = {
        phone: mobilenumber,
        otp: otp,
        taka: taka
    }
    // print(mydata)

    $.ajax(
        {
            url: "recharge_wallet/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                console.log(data)
                // swal("Recharge Successful " + data.amount + " taka!", "", "success");
                document.getElementById('current_wallet_amount').innerText = data.current_wallet

                let current_amount = document.getElementById('total-recharge-id').innerText
                current_amount = parseInt(current_amount) + parseInt(data.amount)
                document.getElementById('total-recharge-id').innerText = current_amount

                Swal.fire({
                    icon: 'success',
                    title: 'Recharge Successful ' + data.amount + ' taka!',
                })

            }
        }
    )
})


$('.recharge-method').click(function () {
    let method = $(this).attr('data-method')
    document.getElementById('recharge_method_id').innerHTML = method
    console.log('recharge method updated')
})
