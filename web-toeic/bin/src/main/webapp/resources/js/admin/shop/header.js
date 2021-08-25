setInterval(function() {
	// khởi tạo đối tượng thời gian
	var date = new Date();
	// lấy thông tin ngày, tháng , năm, giờ, phút , giây
	var ngay = date.getDate();
	var thang = date.getMonth() +1;
	var nam = date.getFullYear();
	var gio = date.getHours();
	var phut = date.getMinutes();
	var giay = date.getSeconds();
	// --------------
	var strNgayTrongTuan = "";
	dayOfWeek = date.getDay();
	switch (dayOfWeek) {
	case 0:
		strNgayTrongTuan = "Sundat";
		break;
	case 1:
		strNgayTrongTuan = "Monday";
		break;
	case 2:
		strNgayTrongTuan = "Tuesday";
		break;
	case 3:
		strNgayTrongTuan = "Wednesday";
		break;
	case 4:
		strNgayTrongTuan = "Thursday";
		break;
	case 5:
		strNgayTrongTuan = "Friday";
		break;
	case 6:
		strNgayTrongTuan = "Saturday";
		break;
	}
	// --------------
	strAMPM = "";
	if (gio <= 12)
		strAMPM = "AM";
	else
		strAMPM = "PM";
	// --------------
	// tạo biến thời gian
	var strTime = strNgayTrongTuan + " , " + ngay + "/" + thang + "/" + nam
			+ " " + gio + ":" + phut + ":" + giay + " " + strAMPM;
	document.getElementById("time").innerHTML = strTime;
}, 1000);