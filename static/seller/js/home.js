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


