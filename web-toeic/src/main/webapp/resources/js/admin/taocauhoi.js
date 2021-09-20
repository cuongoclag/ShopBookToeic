$(document).ready(function() {
    //add new Nhieu Cau Hoi
    $('#btnAddNewOne').click(function() {
        // formData: nameBaiThiThu,file_Excel, file_Image, file_imageQuestion, file_Listening
        var formData = new FormData();
        var file_excel = $('#file_Excel')[0].files[0];

        //var file_image_question = $('#file_image_question')
        var countFileImage = document.getElementById('file_image_question').files.length;
        var countFileMp3 = document.getElementById('file_listening').files.length;
        for (var x = 0; x < countFileImage; x++) {
            formData.append("file_image_question", document.getElementById('file_image_question').files[x]);
        }
        for (var x = 0; x < countFileMp3; x++) {
            formData.append("file_listening", document.getElementById('file_listening').files[x]);
        }
        formData.append("file_excel",file_excel);
        $.ajax({
            data: formData,
            type:'POST',
            url:"http://localhost:8080/api/admin/examtoeic/saveone",
            enctype : 'multipart/form-data',
            contentType : false,
            cache : false,
            processData : false,
            success: function(data){
                $('#examModalOne').modal('hide');
                // loadAllBaiThiThu();
                $('#info-success').text("Thêm mới thành công");
            },
            error : function(e) {
                alert("error");
                $('#examModalOne').modal('hide');
                console.log("ERROR: ", e);
            }
        });
    });

    $('#btnAddNewTow').click(function() {
        var formData = new FormData();
        var question = $('#question').val();
        var answer_1 = $('#answer_1').val();
        var answer_2 = $('#answer_2').val();
        var answer_3 = $('#answer_3').val();
        var answer_4 = $('#answer_4').val();
        var correctAnswer = $('#correctAnswer').val();
        var file_image = $('#file_Image')[0].files[0];
        var file_audio = $('#file_Audio')[0].files[0];
        var part = $('#part').val();
        var difficult = $('#difficult').val();
        var time = $('#time').val();

        formData.append("question", question);
        formData.append("answer_1", answer_1);
        formData.append("answer_2", answer_2);
        formData.append("answer_3", answer_3);
        formData.append("answer_4", answer_4);
        formData.append("correctAnswer", correctAnswer);
        formData.append("file_audio",file_audio);
        formData.append("file_image",file_image);
        formData.append("part", part);
        formData.append("difficult", difficult);
        formData.append("time", time);
        if(file_audio != null && file_image != null){
            $.ajax({
                data: formData,
                type:'POST',
                url:"http://localhost:8080/api/admin/examtoeic/savetow",
                enctype : 'multipart/form-data',
                contentType : false,
                cache : false,
                processData : false,
                success: function(data){
                    $('#ModalTow').modal('hide');
                    loadAll();
                    $('#info-success').text("Thêm mới thành công");
                },
                error : function(e) {
                    alert("error");
                    $('#ModalTow').modal('hide');
                    console.log("ERROR: ", e);
                }
            });
        }else if(file_audio != null && file_image == null){
            $.ajax({
                data: formData,
                type:'POST',
                url:"http://localhost:8080/api/admin/examtoeic/savetow1",
                enctype : 'multipart/form-data',
                contentType : false,
                cache : false,
                processData : false,
                success: function(data){
                    $('#ModalTow').modal('hide');
                    loadAll();
                    $('#info-success').text("Thêm mới thành công");
                },
                error : function(e) {
                    alert("error");
                    $('#ModalTow').modal('hide');
                    console.log("ERROR: ", e);
                }
            });
        }else if(file_audio == null && file_image != null){
            $.ajax({
                data: formData,
                type:'POST',
                url:"http://localhost:8080/api/admin/examtoeic/savetow2",
                enctype : 'multipart/form-data',
                contentType : false,
                cache : false,
                processData : false,
                success: function(data){
                    $('#ModalTow').modal('hide');
                    loadAll();
                    $('#info-success').text("Thêm mới thành công");
                },
                error : function(e) {
                    alert("error");
                    $('#ModalTow').modal('hide');
                    console.log("ERROR: ", e);
                }
            });
        }else if(file_audio == null && file_image == null){
            $.ajax({
                data: formData,
                type:'POST',
                url:"http://localhost:8080/api/admin/examtoeic/savetow3",
                enctype : 'multipart/form-data',
                contentType : false,
                cache : false,
                processData : false,
                success: function(data){
                    $('#ModalTow').modal('hide');
                    loadAll();
                    $('#info-success').text("Thêm mới thành công");
                },
                error : function(e) {
                    alert("error");
                    $('#ModalTow').modal('hide');
                    console.log("ERROR: ", e);
                }
            });
        }

    });

    $('#btnUpdateExam').click(function() {
        var examId = $('#idExam').val();
        // formData: nameBaiThiThu,file_Excel, file_Image, file_imageQuestion, file_Listening
        var formData = new FormData();
        var file_excel = $('#file_Excel')[0].files[0];
        var file_image = $('#file_Image')[0].files[0];
        var name = $('#nameBaiThiThu').val();
        //var file_image_question = $('#file_image_question')
        var countFileImage = document.getElementById('file_image_question').files.length;
        var countFileMp3 = document.getElementById('file_listening').files.length;
        for (var x = 0; x < countFileImage; x++) {
            formData.append("file_image_question", document.getElementById('file_image_question').files[x]);
        }
        for (var x = 0; x < countFileMp3; x++) {
            formData.append("file_listening", document.getElementById('file_listening').files[x]);
        }
        formData.append("file_excel",file_excel);
        formData.append("file_image",file_image);
        formData.append("name",name);
        formData.append("idExam",examId);
        $.ajax({
            data: formData,
            type:'POST',
            url:"http://localhost:8080/api/admin/exam/update",
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
    //edit baithithu
    var editId,idBaiThiThu,fields;
    $(document).on('click','.editCauHoi',function(e){
        e.stopPropagation();
        e.stopImmediatePropagation();
        editId = $(this).attr('id');
        fields = editId.split('.');
        idBaiThiThu = fields[1];

        $('#btnUpdateExam').show();
        $('#btnAddNewExam').hide();
        $('#examModal').modal('show');
        var modal = $('#examModal');
        modal.find('.modal-header #titleModal').text("Cập nhật bài thi thử");
        $('#examModal #idExam').val(idBaiThiThu);
        $.ajax({
            type:'GET',
            url:"http://localhost:8080/api/admin/exam/infoExam/"+idBaiThiThu,
            success: function(data){
                $('#examModal #nameBaiThiThu').val(data);
            },
            error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    // delete baithithu
    $(document).on('click','.deleteCauHoi',function(){
        var deleteId = $(this).attr('id');
        var fields = deleteId.split('.');
        var idCauHoi = fields[1];
        if(confirm("Bạn muốn xóa bài thi thử này?"))
        {
            $.ajax({
                type:'POST',
                url:"http://localhost:8080/api/admin/examtoeic/delete/"+idCauHoi,
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

    function loadAll(){

        $.ajax({
            dataType : 'json',
            type:'GET',
            url:"http://localhost:8080/api/admin/examtoeic/load",

            success: function(data){

                //convert array to json type
                var jsonArrayload = new Array();
                var fields,IdCauHoi,CauHoi, DapanA, DapanB, DapanC, DapanD, DapanDung, anh, amthanh, phanthi, dokho, thoigian;
                for(var i = 0; i <data.length; i++ ){
                    var jsonObject = new Object();
                    fields = data[i].split(',');

                    IdCauHoi = fields[0].split(':');
                    jsonObject.IdCauHoi = IdCauHoi[1];

                    CauHoi = fields[1].split(':');
                    jsonObject.CauHoi = CauHoi[1];

                    DapanA = fields[2].split(':');
                    jsonObject.DapanA = DapanA[1];

                    DapanB = fields[3].split(':');
                    jsonObject.DapanB = DapanB[1];

                    DapanC = fields[4].split(':');
                    jsonObject.DapanC = DapanC[1];

                    DapanD = fields[5].split(':');
                    jsonObject.DapanD = DapanD[1];

                    DapanDung = fields[6].split(':');
                    jsonObject.DapanDung = DapanDung[1];

                    anh = fields[7].split(':');
                    jsonObject.anh = anh[1];

                    amthanh = fields[8].split(':');
                    jsonObject.amthanh = amthanh[1];

                    phanthi = fields[9].split(':');
                    jsonObject.phanthi = phanthi[1];

                    dokho = fields[10].split(':');
                    jsonObject.dokho = dokho[1];

                    thoigian = fields[11].split(':');
                    jsonObject.thoigian = thoigian[1];

                    jsonArrayload.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArrayload));
                var trHTML ="";
                for(var i = 0; i <jsonArr.length ;i++) {
                    if (jsonArr[i].phanthi == 1){
                        jsonArr[i].phanthi = "Part 1"
                    }
                    if (jsonArr[i].phanthi == 2){
                        jsonArr[i].phanthi = "Part 2"
                    }

                    if (jsonArr[i].phanthi == 3){
                        jsonArr[i].phanthi = "Part 3"
                    }

                    if (jsonArr[i].phanthi == 4){
                        jsonArr[i].phanthi = "Part 4"
                    }
                    if(jsonArr[i].dokho == 1){
                        jsonArr[i].dokho = "Dễ"
                    }else if (jsonArr[i].dokho == 2){
                        jsonArr[i].dokho = "Trung Bình"
                    }else {
                        jsonArr[i].dokho = "Khó"
                    }
                    trHTML += '<tr>'
                        +'<td class= "center">' + jsonArr[i].IdCauHoi + '</td>'
                        +'<td class= "center">' + jsonArr[i].CauHoi+ '</td>'
                        +'<td class= "center">' + jsonArr[i].DapanA + '</td>'
                        +'<td class= "center">' + jsonArr[i].DapanB + '</td>'
                        +'<td class= "center">' + jsonArr[i].DapanC+ '</td>'
                        +'<td class= "center">' + jsonArr[i].DapanD + '</td>'
                        +'<td class= "center">' + jsonArr[i].DapanDung + '</td>'
                        +'<td class= "center">' + jsonArr[i].anh+ '</td>'
                        +'<td class= "center">' + jsonArr[i].amthanh + '</td>'
                        +'<td class= "center">' + jsonArr[i].phanthi + '</td>'
                        +'<td class= "center">' + jsonArr[i].dokho + '</td>'
                        +'<td class= "center">' + jsonArr[i].thoigian + '</td>'
                        +'<td class = "center"> '
                        +' <a id="delete.'+jsonArr[i].IdCauHoi+' "'

                        +'class="red deleteCauHoi" ><button class="delete btn btn-danger"><i class="fas fa-trash"></i></button></a> </td>'
                        +'</tr>';
                }

                //$('#tableExam').append(trHTML);

                $('tbody').html(trHTML);

            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    }

    //default. load all object baithithu
    window.onload = function () {
        loadAll();
    };
});
