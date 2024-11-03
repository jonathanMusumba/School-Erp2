$(document).ready(function () {
    $(document).on("click", "[data-mymodal]", function (e) {
        e.preventDefault();
        let modal = $(this).attr('data-md');
        $(modal).modal('show');
    })
})