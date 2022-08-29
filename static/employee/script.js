$('.btn-hub-accept').click(function () {

    let ord_id = $(this).attr('data-order-id')
    // console.log("print hoitese")
    // // console.log(x)
    // console.log("print holo")
    // console.log("accept confirmation button pressed")

    $(this).closest("tr").fadeOut()

    // let inv_id = $("#auction_product_id").val()
    mydata = {
        order_id: ord_id,
    }

    $.ajax(
        {
            url: "/employee/accept/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    Swal.fire(
                        'Successful!',
                        'success'
                    )

                }
                else if(data.status == 0) {

                }
            }
        }
    )
})

$('.btn-hub-reject').click(function () {

    let ord_id = $(this).attr('data-order-id')
    // console.log("print hoitese")
    // // console.log(x)
    // console.log("print holo")
    // console.log("accept confirmation button pressed")

    $(this).closest("tr").fadeOut()

    // let inv_id = $("#auction_product_id").val()
    mydata = {
        order_id: ord_id,
    }

    $.ajax(
        {
            url: "/employee/reject/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    Swal.fire(
                        'Done!',
                        'success'
                    )

                }
                else{

                }
            }
        }
    )
})