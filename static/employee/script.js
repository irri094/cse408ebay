$('#btn-accept').click(function () {
    console.log("accept confirmation button pressed")

    let o_name = document.getElementById('ord_id').innerText
    let acpt = this
    
    // let inv_id = $("#auction_product_id").val()
    mydata = {
        name: o_name,
    }

    console.log(acpt)

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

                    $(acpt).closest("tr").fadeOut()

                }
                else{
                    Swal.fire({
                        icon: 'error',
                        text: 'start time and end time are incompatible',
                    })
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
                    Swal.fire({
                        icon: 'error',
                        text: 'start time and end time are incompatible',
                    })
                }
            }
        }
    )
})

$('#btn-accept-all').click(function () {
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
                    Swal.fire({
                        icon: 'error',
                        text: 'start time and end time are incompatible',
                    })
                }
            }
        }
    )
})

$('#btn-reject-all').click(function () {
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
                    Swal.fire({
                        icon: 'error',
                        text: 'start time and end time are incompatible',
                    })
                }
            }
        }
    )
})