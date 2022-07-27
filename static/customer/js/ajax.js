$('#btn_buy_product').click(function () {
    console.log("button pressed")

    mydata = {

    }

    $.ajax(
        {
            url: "/buy_product",
            method: 'GET',
            data: mydata,
            success: function (data) {
                console.log("everything done properly")
            }
        }
    )

})


