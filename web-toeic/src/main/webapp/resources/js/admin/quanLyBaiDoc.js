$(document).ready(function(){
//---------------------------- Insert Bai Nghe -----------------------
	$('#btnAddNewReading').click(function () {
		var formData = new FormData();
		var file_excel = $('#file_Excel')[0].files[0];
		var file_image = $('#file_Image')[0].files[0];
		var name = $('#namebaidoc').val();

		formData.append("file_excel", file_excel);
		formData.append("file_image",file_image);
		formData.append("name", name);

		$.ajax({
			data: formData,
			type: 'POST',
			url:"http://localhost:8080/api/admin/bai-doc/save",
			enctype : 'multipart/form-data',
			contentType : false,
			cache : false,
			processData : false,
			success: function (data) {
				$('#baiDocModal').modal('hide');
				loadAll();
				$('#info-success').text("Thêm Bai Đọc Thành Công");
			}, error:function (e) {
				alert("error");
				$("#baiNgheModal").modal('hide');
				console.log("ERROR: ", e);
			}
		});
	});
	// Update
	$('#btnUpdateReading').click(function() {
		var ReadingId = $('#idReading').val();

		var formData = new FormData();
		var file_excel = $('#file_Excel')[0].files[0];
		var file_image = $('#file_Image')[0].files[0];
		var name = $('#namebaidoc').val();

		formData.append("file_excel",file_excel);
		formData.append("file_image",file_image);
		formData.append("name",name);
		formData.append("idReading",ReadingId);
		$.ajax({
			data: formData,
			type:'POST',
			url:"http://localhost:8080/api/admin/bai-doc/update",
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

	var editId,idBaiDoc,fields;
	$(document).on('click','.editBaiDoc',function(e){
		e.stopPropagation();
		e.stopImmediatePropagation();
		editId = $(this).attr('id');
		fields = editId.split('.');
		idBaiDoc = fields[1];

		$('#btnUpdateReading').show();
		$('#btnAddNewReading').hide();
		$('#baiDocModal').modal('show');
		var modal = $('#baiDocModal');
		modal.find('.modal-header #titleModal').text("Cập nhật bài Đoc");
		$('#baiDocModal #idReading').val(idBaiDoc);
		$.ajax({
			type:'GET',
			url:"http://localhost:8080/api/admin/bai-doc/info/"+idBaiDoc,
			success: function(data){
				$('#baiDocModal #namebaidoc').val(data);
			},
			error : function(e) {
				alert("error");
				console.log("ERROR: ", e);
			}
		});
	});
	// delete
	$(document).on('click','.deleteBaiDoc',function(){
		var deleteId = $(this).attr('id');
		var fields = deleteId.split('.');
		var idBaiDoc = fields[1];
		if(confirm("Bạn muốn xóa bài đọc này?"))
		{
			$.ajax({
				type:'POST',
				url:"http://localhost:8080/api/admin/bai-doc/delete/"+idBaiDoc,
				success: function(data){
					loadAll();
					$('#info-success').text("Xóa bài thành công");
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
			url:"http://localhost:8080/api/admin/bai-doc/all",
			success:function(data){
				var jsonArray = new Array();
				var fields,id,tenbaidoc, anhbaidoc;
				for(var i = 0; i <data.length; i++){
					var jsonObject = new Object();
					fields = data[i].split(',');

					id = fields[0].split(':');
					jsonObject.baidocid = id[1];

					tenbaidoc = fields[1].split(':');
					jsonObject.tenbaidoc = tenbaidoc[1];

					anhbaidoc = fields[2].split(':');
					jsonObject.anhbaidoc = anhbaidoc[1];

					jsonArray.push(jsonObject);
				}
				var jsonArr = JSON.parse(JSON.stringify(jsonArray));
				var trHTML = "";
				for(var i = 0; i<jsonArr.length; i++){
					trHTML += '<tr><td class="center">' + jsonArr[i].baidocid + '</td>'
						+'<td class="center">' + jsonArr[i].tenbaidoc + '</td>'
						+'<td class="center">' + jsonArr[i].anhbaidoc + '</td>'
						+'<td class = "center"> <a id="edit.'+ jsonArr[i].baidocid +' "'
						+'class="yellow editBaiDoc"><button class="btn btn-warning"><i class="fas fa-edit"></i></button></a> '
						+'<a id="delete.'+jsonArr[i].baidocid+' "'
						+'class="red deleteBaiDoc" ><button class="delete btn btn-danger"><i class="fas fa-trash"></i></button></a> </td>'
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