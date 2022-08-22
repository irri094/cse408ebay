


$('#place-bid').click(function () {

    let auc_id = $(this).attr('data-auction-id')

    mydata = {
        auction_id: auc_id
    }

    console.log(mydata)

    $.ajax(
        {
            url: "/place-bid",
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
