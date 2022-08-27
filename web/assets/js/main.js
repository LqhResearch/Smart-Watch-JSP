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

function stat(elem, labels, datas) {
    const config = {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [
                {
                    data: datas,
                    backgroundColor: [
                        'rgba(255, 99, 132)',
                        'rgba(255, 159, 64)',
                        'rgba(255, 205, 86)',
                        'rgba(75, 192, 192)',
                        'rgba(54, 162, 235)',
                        'rgba(153, 102, 255)',
                        'rgba(201, 203, 207)',
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(255, 159, 64, 0.6)',
                        'rgba(255, 205, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                        'rgba(201, 203, 207, 0.6)'
                    ],
                    borderWidth: 1
                }
            ]
        }
    };
    new Chart(elem, config);
}