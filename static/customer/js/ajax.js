$('#btn_buy_product').click(function () {
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


