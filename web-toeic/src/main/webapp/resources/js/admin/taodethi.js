$(document).ready(function () {
    let myData1 = [];
    let myData2 = [];
    let myData3 = [];
    let myData4 = [];
    let myData5 = [];
    let myData6 = [];
    let myData7 = [];
    $('#btnPart1').click(function(){
        $.ajax({
            dataType : 'json',
            type:'GET',
            url:"http://localhost:8080/api/admin/examtoeic/loadPart1",

            success: function(data){
                myData1 = data;
                //convert array to json type
                var jsonArray = new Array();
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

                    jsonArray.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML ="";
                for(var i = 0; i <jsonArr.length ;i++) {
                    if (jsonArr[i].phanthi == 1){
                        jsonArr[i].phanthi = "Part 1"
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
                        +'</tr>';
                }

                //$('#tableExam').append(trHTML);
                $('#part1').html(trHTML);

            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
//--------------------------------------------------------------------------------Part 2--------------------------------------------------------------------
    $('#btnPart2').click(function(){
        $.ajax({
            dataType : 'json',
            type:'GET',
            url:"http://localhost:8080/api/admin/examtoeic/loadPart2",

            success: function(data){
                myData2 = data;
                //convert array to json type
                var jsonArray = new Array();
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

                    jsonArray.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML ="";
                for(var i = 0; i <jsonArr.length ;i++) {
                    if (jsonArr[i].phanthi == 2){
                        jsonArr[i].phanthi = "Part 2"
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
                        +'</tr>';
                }

                //$('#tableExam').append(trHTML);
                $('#part2').html(trHTML);

            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
//--------------------------------------------------------------------------------Part 3--------------------------------------------------------------------
    $('#btnPart3').click(function(){
        $.ajax({
            dataType : 'json',
            type:'GET',
            url:"http://localhost:8080/api/admin/examtoeic/loadPart3",

            success: function(data){
                myData3 = data;
                //convert array to json type
                var jsonArray = new Array();
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

                    jsonArray.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML ="";
                for(var i = 0; i <jsonArr.length ;i++) {
                    if (jsonArr[i].phanthi == 3){
                        jsonArr[i].phanthi = "Part 3"
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
                        +'</tr>';
                }

                //$('#tableExam').append(trHTML);
                $('#part3').html(trHTML);

            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });


    $('#btnPart4').click(function(){
        $.ajax({
            dataType : 'json',
            type:'GET',
            url:"http://localhost:8080/api/admin/examtoeic/loadPart4",

            success: function(data){
                myData4 = data;
                //convert array to json type
                var jsonArray = new Array();
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

                    jsonArray.push(jsonObject);
                }
                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML ="";
                for(var i = 0; i <jsonArr.length ;i++) {
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
                        +'</tr>';
                }

                //$('#tableExam').append(trHTML);
                $('#part4').html(trHTML);

            }, error : function(e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    //-----------------------------------load Question----------------------------------------------------
    $('.btnQuestion').click(function () {

        var mydata =  myData1.concat(myData2, myData3, myData4, myData5, myData6, myData7)

        if(mydata.length == 0){
            console.error('Chua có data');
            return;
        }else {
            var jsonArray = new Array();
            var fields,IdCauHoi,CauHoi, DapanA, DapanB, DapanC, DapanD, DapanDung, anh, amthanh, phanthi, dokho, thoigian;
            for(var i = 0; i <mydata.length; i++ ){
                var jsonObject = new Object();
                fields = mydata[i].split(',');

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

                jsonArray.push(jsonObject);
            }
            var jsonArr = JSON.parse(JSON.stringify(jsonArray));
            var trHTML ="";

            for(var i = 0; i <jsonArr.length ;i++) {
                var num = i+1;
                trHTML += '<tr>'
                    +'<td class= "center">' + num + '</td>'
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
                    +'</tr>';
            }
            $('#listQuestion').html(trHTML);
        }
    });

    //-----------------------------------Xuat Excel ------------------------------------------------------

    $('#toExcel').click(function () {
        var mydata =  myData1.concat(myData2, myData3, myData4, myData5, myData6, myData7)
        if(mydata.length == 0){
            alert("Danh Sách Câu Hỏi Trống!");
        }else {
            tableToExcel('tblExport','W3C Example Table');
        }
    });

    var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-Excel;base64,'
            , template = '<html xmlns:o="urn:schemas-Microsoft-com:office:office" xmlns:x="urn:schemas-Microsoft-com:office:Excel" xmlns="http://www.w3.org/TR/REC-html40"><meta http-equiv="content-type" content="application/vnd.ms-Excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
        return function(table, name) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
        }
    })()

    function exportExcel(tableName, headerColor, fileName) {
        if(tableName.trim() === ""){
            alert("Khong Co Bang.");
            return;
        }
        if(headerColor.trim() ===""){
            headerColor = "#87AFC6";
        }
        if(fileName.trim() === ""){
            fileName = "ExportExcel";
        }
        var export_data = "";
        var arrTable = tableName.split("|");
        if(arrTable.length > 0){
            for(var i = 0; i < arrTable.length; i++){
                export_data += "<table><tr>";
                var objectTable = document.getElementById(arrTable[i]);
                if(objectTable === undefined){
                    alert("Không Tìm Thấy Bảng");
                    return;
                }
                for(var j = 0; j < objectTable.rows.length; j++){
                    export_data += objectTable.rows[j].innerHTML + "</tr>";
                }
                export_data += "</table>"
            }
            sa = window.open("data:application/vnd.ms-excel," + encodeURIComponent(export_data))
        }
    }

})