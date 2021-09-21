function markColor(id){
    //tách lấy id của câu hỏi
    var fields = id.split('.');
    var answerId = fields[1];
    document.getElementById("answer"+answerId).style.backgroundColor = "rgb(167,162,162)";
}
function correctAnswer(){
    var correctArr =[];
    for (var i = 1; i < 11; i++) {
        var nameRadio = "correctanswer"+i;
        var x = document.getElementById("submitForm").elements.namedItem(nameRadio).value;
        correctArr.push(x);}
    return correctArr;
}
function answerUser(){
    var answerArr = [];
    for (var i = 1; i < 11; i++) {
        var nameRadio = "question"+i;
        var result = document.getElementById("submitForm").elements.namedItem(nameRadio);
        if(result == null) answerArr.push("");
        else{
            var x = document.getElementById("submitForm").elements.namedItem(nameRadio).value;
            answerArr.push(x);}
    }
    return answerArr;
}
$(document).ready(function(){
    $('#btnResult').click(function(){
        // clearInterval(timecheck);
        $('#btnResult').hide();
        var answerArr = answerUser();
        var correctArr = correctAnswer();
        var countCorrect = 0;
        for(var i = 0; i< 10; i++){
            if(answerArr[i] == correctArr[i] && answerArr[i] != ' ' ) countCorrect++;
        }
        var jsonAnswerUser = JSON.stringify(answerArr);

        console.log("answerARR="+answerArr);
        console.log("correctArr="+correctArr);
        console.log("correctCount="+countCorrect);

        var Id = $("#id_bai_reading").val();
        var url="http://localhost:8080/ResultReading/"+Id+"/"+countCorrect;
        if(window.XMLHttpRequest){
            xhttp = new XMLHttpRequest();
        }
        else{
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.open("POST",url,true);
        xhttp.onreadystatechange = function(){
            if(xhttp.readyState == 4){
                var data = xhttp.responseText;
                document.getElementById("main").innerHTML = data;
            }
        }
        xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhttp.send(jsonAnswerUser);
    });
    // var timecheck;
    // function startTimer(duration, display) {
    //     var timer = duration, minutes, seconds;
    //     timecheck= setInterval(function () {
    //         minutes = parseInt(timer / 60, 10)
    //         seconds = parseInt(timer % 60, 10);
    //         minutes = minutes < 10 ? "0" + minutes : minutes;
    //         seconds = seconds < 10 ? "0" + seconds : seconds;
    //         display.textContent = minutes + ":" + seconds;
    //         if (--timer < 0) {
    //             clearInterval(timecheck);
    //             var examId = $("#id_bai_exam").val();
    //             alert("Đã hết thời gian làm bài test Reading.");
    //             $("#btnSubmit").click()
    //
    //         }
    //     },1000);
    // }
    // window.onload = function () {
    //     var thirtyMinutes = 60 * 30;
    //     display = document.querySelector('#time');
    //     startTimer(thirtyMinutes, display);
    // };
});








