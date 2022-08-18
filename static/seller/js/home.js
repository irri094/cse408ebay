
//
$('#btn_wallet_proceed').click(function () {

    let amount = $("#transfer_amount").val()
    let bank_name = $("#bank_name").val()
    let bank_acc = $("#bank_account").val()

    document.getElementById('confirm_wallet_amount').innerText = amount
    document.getElementById('bank_name_id').innerText = bank_name
    document.getElementById('bank_account_id').innerText = bank_acc

})

$('#btn_transfer_wallet').click(function () {
    console.log("Wallet tranfer done successfully")

    mydata = {
        amount: $("#transfer_amount").val()
    }

    $.ajax(
        {
            url: "wallet_to_bank/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    document.getElementById('current_wallet_amount').innerHTML = data.current_wallet
                    Swal.fire({
                        icon: 'success',
                        title: 'Amount successfully transferred!',
                    })
                    $("#transfer_amount").val('')

                }
            }
        }
    )

})

$('#btn-auction-confirmation-id').click(function () {
    console.log("auction confirmation button pressed")

    let auction_start = document.getElementById('final_auction_start').innerText
    let auction_end = document.getElementById('final_auction_end').innerText
    let auction_quantity = document.getElementById('final_auction_quantity').innerText
    let auction_base_price = document.getElementById('final_auction_base_price').innerText
    let inv_id = $("#auction_product_id").val()
    mydata = {
        start : auction_start,
        end : auction_end,
        quantity : auction_quantity,
        price : auction_base_price,
        inventory_id : inv_id,
    }

    console.log()

    $.ajax(
        {
            url: "auction/",
            method: 'GET',
            data:mydata,
            success: function (data) {
                if (data.status == 1) {

                    Swal.fire(
                        'Auction Successful!',
                        'Your products have been listed for auction',
                        'success'
                    )

                }
            }
        }
    )

})

$('#btn_auction_proceed_id').click(function () {
    console.log("Wallet tranfer done successfully")

    let auction_start_time = $("#start_time_id").val()
    let auction_end_time = $("#end_time_id").val()
    let auction_base_price = $("#base_price_id").val()
    let auction_quantity = $("#auction_quantity").val()

    document.getElementById('final_auction_start').innerText = auction_start_time
    document.getElementById('final_auction_end').innerText = auction_end_time
    document.getElementById('final_auction_quantity').innerText = auction_quantity
    document.getElementById('final_auction_base_price').innerText = auction_base_price

})

$('.btn-auction').click(function () {

    let inventory_id = $(this).attr('data-inventory-id')
    $("#auction_product_id").val(inventory_id)

    let product_name = $(this).attr('data-product-name')
    document.getElementById('product_name_id').innerText = product_name
    document.getElementById('auction_product_name_id').innerText = product_name
})


