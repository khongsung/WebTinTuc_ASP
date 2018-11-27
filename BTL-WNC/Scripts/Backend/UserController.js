$(".userDelete-active").off("click").on("click", function (e) {
    e.preventDefault();
    var id = $(this).data("id");
    DeleteUserById(id);
});

function DeleteUserById(id) {
    if (confirm("Bạn chắc chắn muốn xóa user này k?")) {
        $.ajax({
            url: "Backend/DeleteUser",
            data: { id: id },
            datatype: "json",
            type: "POST",
            success: function (response) {
                if (response.status == true) {
                    $("#row_" + id).remove();
                    alert("xóa thành công");
                } else {
                    alert("xóa thất bại");
                }
            }
        });
    }
}

$(".userEdit-active").off("click").on("click", function (e) {
    e.preventDefault();
    var id = $(this).data("id");
    $("#id").val(id);
    SelectUserByID(id);
});

function SelectUserByID(id) {
    $.ajax({
        url: "users/edit-"+id,
        data: { id: id },
        type: "GET",
        success: function (data) {
            var obj = JSON.parse(data);
            $("#id").val(obj.iId),
            $("#username").val(obj.sUsername),
            $("#email").val(obj.sEmail),
            $("#role option[value='"+obj.sRole+"']").prop("selected", true);
        }
    });
}

$("#edit-user").on("click", function () {
    var data = $("#submitForm").serialize();
    console.log(data);
    EditUserById(data);
});

function EditUserById(data) {
    $.ajax({
        url: "Backend/EditUserById",
        data: data,
        dataType: "json",
        type: "POST",
        success: function (response) {
            console.log(response);
            if (response.status == true) {
                location.reload();
                $("#frmEditUser").modal();
            } else {
                alert("k sửa được");
            }
        }
    });
}