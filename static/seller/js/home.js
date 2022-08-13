$('#btn_transfer_button_id').click(function () {
    console.log("button pressed")

    mydata = {
        csrfmiddlewaretoken: $('input[name="csrfmiddlewaretoken"]').val(),
        test: $("#bank_transfer_amount_id").val()
    }


    $.ajax(
        {
            url: "test_function/",
            method: 'POST',
            data: mydata,
            success: function (data) {
                if (data.status == 1) {

                }
            }
        }
    )

})


$('#btn-auction-confirmation-id').click(function () {
    console.log("auction confirmation button pressed")

    $.ajax(
        {
            url: "auction/",
            method: 'GET',
            success: function (data) {
                if (data.status == 1) {
                    swal("Auction Successful!", "Your products have been listed for auction", "success");
                    console.log("yesssss")
                }
            }
        }
    )

})