$('#place-bid').click(function () {

    let auc_id = $(this).attr('data-auction-id')
    let auc_amount = document.getElementById('input_quantity').value
    mydata = {
        auction_id: auc_id,
        bid_amount: auc_amount,
    }

    console.log(mydata)

    $.ajax(
        {
            url: "/place-bid",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    document.getElementById('notification_head_strong_id').innerHTML = "Successful"
                    document.getElementById('notification_body_id').innerHTML = "You're now the highest bidder."
                    $("#toast_id").toast("show")

                } else if (data.status == 3) {
                    document.getElementById('notification_head_strong_id').innerHTML = "Failed"
                    document.getElementById('notification_body_id').innerHTML = "You have to login to place a bid"
                    $("#toast_id").toast("show")
                }
            }
        }
    )

})
