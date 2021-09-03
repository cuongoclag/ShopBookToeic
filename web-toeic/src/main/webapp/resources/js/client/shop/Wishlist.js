function confirmDelete(productId) {
	var del = confirm("Bạn muốn xóa sản phẩm khỏi danh sách yêu thích?");
	if (del == true) {
		Cart.deleteProduct(productId);
	} else {
	}
}
var Cart = {
		deleteProduct : function(productId) {
			var data = {};
			$.ajax({
				url : "/wishlist/delete-product-wishlist-with-ajax/" + productId,
				type : "post",
				contentType : "application/json", // dữ liệu gửi lên web-service
				// có dạng là json.
				data : JSON.stringify(data), // object json -> string json

				dataType : "json", // dữ liệu từ web-service trả về là json.
				success : function(jsonResult) { // được gọi khi web-service trả

					if (jsonResult.status == 200) {
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