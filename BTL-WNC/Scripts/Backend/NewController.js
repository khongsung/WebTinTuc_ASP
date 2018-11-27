$(".btn-active").off("click").on("click", function () {
    news.init();
});

var news = {
    init: function () {
        news.registerEvens();
    },
    registerEvens: function () {

        $(".btn-active").off("click").on("click", function (e) {
            e.preventDefault();
            
            var id = $(this).data("id");
            if (confirm("bạn muốn xóa?")) {
                $.ajax({
                    url: "Backend/DeleteNews",
                    data: {id : id},
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == true) {
                            $("#row_" + id).remove();
                            alert("xóa thành công");
                        } else
                            alert("Xóa thất bại")
                    }
                });
            }
            
        });
        
        
    }
}

$(".status").off("click").on("click", function () {
    changeStatus.init();
});

var changeStatus = {
    init : function() {
        changeStatus.registerEvens();
    },
    registerEvens: function() {
        $(".status").off("click").on("click", function (e) {
            e.preventDefault();

            var id = $(this).data("status");
            $.ajax({
                url: "Backend/NewsChangeStatus",
                data : {id : id},
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true)
                        $("#status_" + id).html("Hiện");
                    else
                        $("#status_" + id).html("Ẩn");
                }
            })
        });
    }
}