$(document).ready(function () {
    //---------------------------- Insert Bai Nghe -----------------------
    $('#btnAddNewLiestening').click(function () {
        var formData = new FormData();

        var file_excel = $('#file_Excel')[0].files[0];
        var file_image = $('#file_Image')[0].files[0];
        var name = $('#namebainghe').val();

        var countFileImage = document.getElementById('file_image_question').files.length;
        var countFileMp3 = document.getElementById('file_listening').files.length;

        for(var x = 0; x < countFileImage; x++){
            formData.append("file_image_question", document.getElementById('file_image_question').files[x]);
        }

        for(var x = 0; x <countFileMp3; x++){
            formData.append("file_listening", document.getElementById('file_listening').files[x]);
        }

        formData.append("file_excel", file_excel);
        formData.append("file_image",file_image);
        formData.append("name", name);

        $.ajax({
            data: formData,
            type: 'POST',
            url:"http://localhost:8080/api/admin/bai-nghe/save",
            enctype : 'multipart/form-data',
            contentType : false,
            cache : false,
            processData : false,
            success: function (data) {
                $('#baiNgheModal').modal('hide');
                loadAll();
                $('#info-success').text("Thêm Bai Nghe Thành Công");
            }, error:function (e) {
                alert("error");
                $("#baiNgheModal").modal('hide');
                console.log("ERROR: ", e);
            }
        });
    });
    // Update
    $('#btnUpdateLiestening').click(function() {
        var ListeningId = $('#idListening').val();

        var formData = new FormData();
        var file_excel = $('#file_Excel')[0].files[0];
        var file_image = $('#file_Image')[0].files[0];
        var name = $('#namebainghe').val();

        var countFileImage = document.getElementById('file_image_question').files.length;
        var countFileMp3 = document.getElementById('file_listening').files.length;

        for(var x = 0; x < countFileImage; x++){
            formData.append("file_image_question", document.getElementById('file_image_question').files[x]);
        }
        for(var x = 0; x <countFileMp3; x++){
            formData.append("file_listening", document.getElementById('file_listening').files[x]);
        }
        formData.append("file_excel",file_excel);
        formData.append("file_image",file_image);
        formData.append("name",name);
        formData.append("idListening",ListeningId);
        $.ajax({
            data: formData,
            type:'POST',
            url:"http://localhost:8080/api/admin/bai-nghe/update",
            enctype : 'multipart/form-data',
            contentType : false,
            cache : false,
            processData : false,

            success: function(data){
                $('#examModal').modal('hide');
                $('#info-success').text("Cập nhật bài thi thử thành công");
                loadAll();
            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    //edit

    var editId,idBaiNghe,fields;
    $(document).on('click','.editBaiNghe',function(e){
        e.stopPropagation();
        e.stopImmediatePropagation();
        editId = $(this).attr('id');
        fields = editId.split('.');
        idBaiNghe = fields[1];

        $('#btnUpdateLiestening').show();
        $('#btnAddNewLiestening').hide();
        $('#baiNgheModal').modal('show');
        var modal = $('#baiNgheModal');
        modal.find('.modal-header #titleModal').text("Cập nhật bài Nghe");
        $('#baiNgheModal #idListening').val(idBaiNghe);
        $.ajax({
            type:'GET',
            url:"http://localhost:8080/api/admin/bai-nghe/info/"+idBaiNghe,
            success: function(data){
                $('#baiNgheModal #namebainghe').val(data);
            },
            error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    // delete baithithu
    $(document).on('click','.deleteBaiNghe',function(){
        var deleteId = $(this).attr('id');
        var fields = deleteId.split('.');
        var idBaiNghe = fields[1];
        if(confirm("Bạn muốn xóa bài thi thử này?"))
        {
            $.ajax({
                type:'POST',
                url:"http://localhost:8080/api/admin/bai-nghe/delete/"+idBaiNghe,
                success: function(data){
                    loadAll();
                    $('#info-success').text("Xóa bài thi thử thành công");
                },
                error : function(e) {
                    alert("error");
                    console.log("ERROR: ", e);
                }
            });
        }
    });



    function loadAll() {
        $.ajax({
            dataType: 'json',
            type: 'GET',
            url:"http://localhost:8080/api/admin/bai-nghe/all",
            success:function(data){
                var jsonArray = new Array();
                var fields,id,tenbainghe, anhbainghe;
                for(var i = 0; i <data.length; i++){
                    var jsonObject = new Object();
                        fields = data[i].split(',');

                        id = fields[0].split(':');
                        jsonObject.baingheid = id[1];

                        tenbainghe = fields[1].split(':');
                        jsonObject.tenBaiNghe = tenbainghe[1];

                        anhbainghe = fields[2].split(':');
                        jsonObject.anhbainghe = anhbainghe[1];

                        jsonArray.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML = "";
                for(var i = 0; i<jsonArr.length; i++){
                    trHTML += '<tr><td class="center">' + jsonArr[i].baingheid + '</td>'
                        +'<td class="center">' + jsonArr[i].tenBaiNghe+ '</td>'
                        +'<td class="center">' + jsonArr[i].anhbainghe+ '</td>'
                        +'<td class = "center"> <a id="edit.'+ jsonArr[i].baingheid +' "'
                        +'class="yellow editBaiNghe"><button class="btn btn-warning"><i class="fas fa-edit"></i></button></a> '
                        +'<a id="delete.'+jsonArr[i].baingheid+' "'
                        +'class="red deleteBaiNghe" ><button class="delete btn btn-danger"><i class="fas fa-trash"></i></button></a> </td>'
                        +'</tr>';
                }
                $('tbody').html(trHTML);
            }, error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    }

    window.onload = function () {
        loadAll();
    };
});