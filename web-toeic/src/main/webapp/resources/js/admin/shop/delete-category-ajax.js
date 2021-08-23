function confirmDelete(seo) {
	var del = confirm("Do you want to hide this category?");
	if (del == true) {
		Category.deleteCategory(seo);
	} else {

	}
}
var Category = {
	deleteCategory : function(seo) {
		var data = {};
		// alert(seo);
		data["seo"] = seo;
		$.ajax({
			url : "/admin/list-category/delete-category-with-ajax/" + seo,
			type : "post",
			contentType : "application/json", // dữ liệu gửi lên web-service
			// có dạng là json.
			data : JSON.stringify(data), // object json -> string json

			dataType : "json", // dữ liệu từ web-service trả về là json.
			success : function(jsonResult) { // được gọi khi web-service trả
												// về dữ liệu.

				// alert(jsonResult.data.seo);
				// alert(jsonResult.data.status);
				// alert(jsonResult.message);
				// $("#message").html(jsonResult.data);
				// $('#blogModal').modal('show');
				if (jsonResult.status == 401) {
					alert('Success');
					location.reload(true);
				} else {
					alert('Error');
				}
			},
			error : function(jqXhr, textStatus, errorMessage) { // error
				// callback

			}
		});
	}
}
