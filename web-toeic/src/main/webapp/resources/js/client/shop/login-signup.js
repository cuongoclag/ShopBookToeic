const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

var Sendcode = {
sendCode : function() {
		var data = {};
		$.ajax({
			url : "/send-code",
			type : "post",
			contentType : "application/json", // dữ liệu gửi lên web-service
			// có dạng là json.
			data : JSON.stringify(data), // object json -> string json

			dataType : "json", // dữ liệu từ web-service trả về là json.
			success : function(jsonResult) { 
				if (jsonResult.status == 200) {
					alert('Check your mail to get code');
				} else if (jsonResult.status == 400) {
					alert('The email address is already exist!');
				} else {
					alert('Error');
				}
			},
		});
	}
}