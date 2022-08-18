
$('#btn-auction-confirmation-id').click(function () {
    console.log("auction confirmation button pressed")

    $.ajax(
        {
            url: "auction/",
            method: 'GET',
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

//
$('#btn_wallet_proceed').click(function () {

    let amount = $("#transfer_amount").val()

    let bank_name = $("#bank_name").val()
    let bank_acc = $("#bank_account").val()

    bank_name_id
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
