window.addEventListener("popstate", function () {
    clink(location.href, false);
});

window.addEventListener('load', function () {
    var title = $('.hd-title').attr('data-title');
    $("#title-header").html(title);
});

$(document).ajaxStop(function () {
    $("#loader").removeClass("modal-loading");
});

$(function () {
    $(window).scrollTop(1);
    var url = document.location.toString();
    if (url.match('#')) {
        $('.nav-tabs a[href=#' + url.split('#')[1] + ']').tab('show');
    }
    $('.nav-tabs a').on('shown', function (e) {
        window.location.hash = e.target.hash;
    })
});


var confirmAndSubmitWorkflow = function (formId, confirmMessage, action, id) {
    var conf = confirm(confirmMessage);
    if (conf === true) {
        try {
            let form = $('#' + formId);
            if (form) {
                form.attr('action', action, 'id', id).submit()
            }

        } catch (e) {
            console.log(e);
        }

    }
    else {
        return false;
    }
}
var clink = function (href, push) {
    var push = typeof push !== 'undefined' ? push : true;
    $.ajax(href, {
        beforeSend: function () {
            $("#loader").addClass("modal-loading");
        },
        success: function (data) {
            //Remove class
            $("#loader").removeClass("modal-loading");

            $("section#view_content").html(data);
            var title = $('.hd-title').attr('data-title');
            $("#title-header").html(title);
            document.title = typeof title !== 'undefined' ? title : 'School Pay';

        },
        error: function (xhr, ajaxOptions, thrownError) {
            $("#loader").removeClass("modal-loading");
            if (xhr.status != '302') {
                if (xhr.status == '403') {
                    $("section#view_content").html('<div class="alert alert-danger"> <span style="font-size:20px;text-align:center;">No Rights to view this page</span></div>');
                } else {
                    $("section#view_content").html('<div class="alert alert-danger"> <span style="font-size:20px;text-align:center;">We could not process your request. Try again later</span></div>');
                }
            }

        }
    });

    if (push == true) {
        window.history.pushState({}, '', href);
    }
    return false;
}

var pagerlink = function (href, id) {
    var idstate = typeof id !== 'undefined' ? id : false;
    $.ajax(href, {
        beforeSend: function () {
            $("#loader").addClass("modal-loading");
        },
        success: function (data) {
            if (idstate) {
                var response = $(data).find('#' + id).children();
                var pagers = $(data).find('ul.pagination').children();
                $("#" + id).html(response);
                $("ul.pagination").html(pagers);
                $("ul.pagination").attr('data-for', id);
            } else {
                var response = $(data).find('table').children();
                var pagers = $(data).find('ul.pagination').children();
                $("table").html(response);
                $("ul.pagination").html(pagers);
            }
            // $("#loader").removeClass("modal-loading");
        }
    });
    return false;
}


$(function () {
    $(document.body).on('click', '.clink', function (event) {
        event.preventDefault();
        clink($('a', this).attr('href'));
    });
});

$(function () {
    $(document.body).on('click', 'ul.pagination li:not(".disabled")', function (event) {
        event.preventDefault();
        pagerlink($('a', this).attr('href'), $(this).parent().attr('data-for'));
    });
});

$(function () {
    $(document.body).on('click', '.aclink', function (event) {
        event.preventDefault();
        clink($(this).attr('href'));
    });

    $(document.body).on('click', '.jclink', function (event) {
        event.preventDefault();
        clink($(this).attr('data-href'));
    });

});

var clinkConf = function (href, confirmMessage) {
    var conf = confirm(confirmMessage);
    if (conf == true) {
        clink(href);
    }
    else {
        return false;
    }
}

$(function () {
    $(document.body).on('beforeSubmit', 'form.formprocess', function (e) {
        var uri = $(this).attr('action');
        var formdata = $(this).serialize();
        var method = $(this).attr('method');
        $.ajax({
            url: uri,
            type: method,
            data: formdata,
            beforeSend: function () {
                $("#loader").addClass("modal-loading");
            },
            success: function (data) {
                $("section#view_content").html(data);
                var title = $('.hd-title').attr('data-title');
                $("#title-header").html(title);
                document.title = typeof title !== 'undefined' ? title : 'School Pay';
                $("#loader").removeClass("modal-loading");
            }
        });
        return false;
    });
});


var postData = function (formId) {
    var error = [], valid = false;
    var inputFile = document.getElementById("dynamicmodel-importfile"),
        formdata = window.FormData ? new FormData() : false;
    $('form#' + formId + ' .inputRequired').each(function () {
        if ($(this).val() == '') {
            error.push($(this).attr('placeholder') + " cannot be blank");
        }
        else if ($(this).attr('type') == 'file' && $(this).val() != '') {
            var ext = ['xls', 'xlsx', 'csv'];
            if ($.inArray($(this).val().split('.').pop().toLowerCase(), ext) == -1) {
                error.push("File should be .xls or .xlsx");
            }
        }
    });
    if (error.length === 0) {
        valid = true;
    }
    else {
        errString = "";
        $.each(error, function (index, value) {
            errString += value + "<br>";
        });
        document.getElementById("errorMessage").innerHTML = "<div class='alert alert-danger'>" + errString + "</div>";
    }
    var uri = $('form#' + formId).attr('action');
    var other_data = $('form#' + formId).serializeArray();
    if (formdata && valid) {
        document.getElementById("errorMessage").innerHTML = "";
        formdata.append("file", inputFile.files[0]);
        $.each(other_data, function (key, input) {
            formdata.append(input.name, input.value);
        });
        $.ajax({
            url: uri,
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false,
            beforeSend: function () {
                document.getElementById("loading").innerHTML = "<div class='content-loading'>Importing... </div>";
            },
            complete: function () {
                document.getElementById("loading").innerHTML = "";
            },
            success: function (res) {
                document.getElementById("response").innerHTML = res;
            }
        });

    } else {
        $('form#' + formId).submit();
    }

}


$(function () {
    $(document.body).on('click', '.checkall', function () {
        $(this).parents('fieldset:eq(0)').find(':checkbox').attr('checked', this.checked);
        if (this.checked)
            $(this).parents("fieldsset:eq(0)").find(".checkbox").prop("checked", true);
        else
            $(this).parents("fieldset:eq(0)").find(".checkbox").prop("checked", false);
    });

});

$(function () {
    $(document.body).on('click', '.generate-btn', function (e) {
        if ($("input[type=checkbox]:checked").length === 0) {
            e.preventDefault();
            alert('Please select atleast one checkbox');
            return false;

        }
    });
});

$(function () {
    $(document.body).on('click', '.modal_link', function (e) {
        var title = $(this).attr('data-title');
        var content = $(this).attr('data-href');
        $('.modal').modal('show').find('.modal-title').html(title);
        $('.modal').modal('show').find('.modal-body').load(content);
    });
});

$(function () {
    $(document.body).on('click', "td[data-toggle='popover']", function () {
        var href = $(this).attr('data-href');
        var cell = $(this);
        var title_name = $(this).attr('data-name');
        if (cell.next('div.popover:visible').length) {
            cell.popover('destroy');
        } else {
            $("td[data-toggle='popover']").popover('destroy');
            $.ajax({
                url: href,
                dataType: 'html',
                success: function (res) {
                    cell.popover({
                        title: '<b>' + title_name + '</b>',
                        content: res,
                        placement: 'left',
                        html: true,
                    }).popover('show');
                }
            });
        }
    });
    $('html').on('click', function (e) {
        if (typeof $(e.target).data('original-title') == 'undefined' &&
            !$(e.target).parents().is('[data-toggle="popover"]')) {
            $('td[data-original-title]').popover('destroy');
        }
    });
});

