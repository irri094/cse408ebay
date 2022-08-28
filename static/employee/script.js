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
            url: "accept/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    Swal.fire(
                        'Order Accepted!',
                        'Order is now in Hub',
                        'success'
                    )

                }
                else if(data.status == 0) {

                }
            }
        }
    )
})

$('#btn-reject').click(function () {
    console.log("reject confirmation button pressed")

    let o_name = document.getElementById('ord_id').innerText
    
    // let inv_id = $("#auction_product_id").val()
    mydata = {
        name: o_name,
    }

    console.log()

    $.ajax(
        {
            url: "reject/",
            method: 'GET',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                    Swal.fire(
                        'Order Rejected!',
                        'Order returned to Seller',
                        'success'
                    )

                }
                else{

                }
            }
        }
    )
})