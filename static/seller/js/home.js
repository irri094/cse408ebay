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


$('#btn_transfer_wallet').click(function () {
    console.log("Wallet tranfer done successfully")

    mydata = {

    }

    $.ajax(
        {
            url: "wallet_to_bank/",
            method: 'GET',
            data : mydata,
            success: function (data) {
                if (data.status == 1) {

                    document.getElementById('current_wallet_amount').innerHTML = data.current_wallet

                    Swal.fire({
                    icon: 'success',
                    title: 'Amount successfully transferred!',
                })

                }
            }
        }
    )

})
