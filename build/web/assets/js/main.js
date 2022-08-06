$(document).ready(function () {
    function GetParameterValues(param) {
        var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < url.length; i++) {
            var urlparam = url[i].split('=');
            if (urlparam[0] == param) {
                return urlparam[1];
            }
        }
    }

    if (GetParameterValues('edit-id') != undefined) {
        document.querySelector("[data-target='#modal-edit']").click();
    }
});

function removeRow(id) {
    Swal.fire({
        title: 'Bạn có chắc chắn muốn xoá không?',
        showCancelButton: true,
        confirmButtonText: 'Xoá',
        confirmButtonColor: '#F94C66',
        cancelButtonText: 'Huỷ',
        cancelButtonColor: '#3AB0FF',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location = '?action=delete&id=' + id;
        }
    })
}