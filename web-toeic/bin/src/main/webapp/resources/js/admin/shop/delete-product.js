function confirmDelete(seo) {
	var del = confirm("Do you want to hide this product?");
	if (del == true) {
		Product.deleteProduct(seo);
	} else {

	}
}
var Product = {
	deleteProduct : function(seo) {
		var data = {};
		$.ajax({
			url : "/admin/list-product/delete-product-with-ajax/" + seo,
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
				if (jsonResult.status == 200) {
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
