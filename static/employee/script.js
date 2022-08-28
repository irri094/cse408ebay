$('#btn-accept').click(function () {
    console.log("accept confirmation button pressed")

    let o_name = document.getElementById('ord_id').innerText
    
    // let inv_id = $("#auction_product_id").val()
    mydata = {
        name: o_name,
    }

    console.log()

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