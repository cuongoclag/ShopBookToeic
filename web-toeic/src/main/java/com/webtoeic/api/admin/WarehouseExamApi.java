package com.webtoeic.api.admin;

import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;
import com.webtoeic.entities.WarehouseExam;
import com.webtoeic.service.WarehouseExamService;
import com.webtoeic.service.impl.WarehouseExamImpl;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/admin/examtoeic")
public class WarehouseExamApi {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private WarehouseExamService warehouseExamService;

    @Autowired
    private WarehouseExamImpl warehouseExamImpl;

    @PostMapping(value = "/saveone", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addQuestionOne(@RequestParam("file_excel") MultipartFile file_excel,
                                     @RequestParam("file_image_question") MultipartFile[] file_image_question,
                                     @RequestParam("file_listening") MultipartFile[] file_listening) {
        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        try {
            // save file upload to local folder
            Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/examquestion/" + file_excel.getOriginalFilename());
            file_excel.transferTo(new File(pathExcel.toString()));

            for (MultipartFile single_image : file_image_question) {
                Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/examquestion/"  + single_image.getOriginalFilename());
                single_image.transferTo(new File(pathImageQuestion.toString()));
            }
            for (MultipartFile single_listening : file_listening) {
                Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/examquestion/" + single_listening.getOriginalFilename());
                single_listening.transferTo(new File(pathListening.toString()));
            }
            // save data from file excel
            WarehouseExamApi btt = new WarehouseExamApi();
            List<WarehouseExam> listCauHoiFull = btt.getListFromExcel(pathExcel.toString());
            for (int i = 0; i < listCauHoiFull.size(); i++) {
                warehouseExamService.save(listCauHoiFull.get(i));
            }
        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }
        return response;
    }

    @PostMapping(value = "/savetow", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addQuestionTow( @RequestParam("question") String question,
                                        @RequestParam("answer_1") String answer_1,
                                        @RequestParam("answer_2") String answer_2,
                                        @RequestParam("answer_3") String answer_3,
                                        @RequestParam("answer_4") String answer_4,
                                        @RequestParam("correctAnswer") String correctAnswer,
                                        @RequestParam("file_image") MultipartFile file_image,
                                        @RequestParam("file_audio") MultipartFile file_audio,
                                        @RequestParam("part") int part,
                                        @RequestParam("difficult") int difficult,
                                        @RequestParam("time") int time) {
        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        WarehouseExam exam = new WarehouseExam();
        try {
            exam.setQuestion(question);
            exam.setAnswer_1(answer_1);
            exam.setAnswer_2(answer_2);
            exam.setAnswer_3(answer_3);
            exam.setAnswer_4(answer_4);
            exam.setCorrectAnswer(correctAnswer);
            Path pathImage = Paths.get(rootDirectory + "/resources/file/images/examquestion/" + file_image.getOriginalFilename());
            file_image.transferTo(new File(pathImage.toString()));

            Path pathAudio = Paths.get(rootDirectory + "/resources/file/audio/examquestion/" + file_audio.getOriginalFilename());
            file_audio.transferTo(new File(pathAudio.toString()));

            exam.setImage( file_image.getOriginalFilename());
            exam.setAudiomp3(file_audio.getOriginalFilename());
            exam.setPart(part);
            exam.setDifficult(difficult);
            exam.setTime(time);
            warehouseExamService.save(exam);
            // save data from file excel
        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }
        return response;
    }

    @PostMapping(value = "/savetow1", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addQuestionTow1( @RequestParam("question") String question,
                                        @RequestParam("answer_1") String answer_1,
                                        @RequestParam("answer_2") String answer_2,
                                        @RequestParam("answer_3") String answer_3,
                                        @RequestParam("answer_4") String answer_4,
                                        @RequestParam("correctAnswer") String correctAnswer,
                                        @RequestParam("file_audio") MultipartFile file_audio,
                                        @RequestParam("part") int part,
                                        @RequestParam("difficult") int difficult,
                                        @RequestParam("time") int time) {
        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        WarehouseExam exam = new WarehouseExam();
        try {
            exam.setQuestion(question);
            exam.setAnswer_1(answer_1);
            exam.setAnswer_2(answer_2);
            exam.setAnswer_3(answer_3);
            exam.setAnswer_4(answer_4);
            exam.setCorrectAnswer(correctAnswer);

            Path pathAudio = Paths.get(rootDirectory + "/resources/file/audio/examquestion/" + file_audio.getOriginalFilename());
            file_audio.transferTo(new File(pathAudio.toString()));

            exam.setAudiomp3(file_audio.getOriginalFilename());
            exam.setPart(part);
            exam.setDifficult(difficult);
            exam.setTime(time);
            warehouseExamService.save(exam);
            // save data from file excel
        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }
        return response;
    }

    @PostMapping(value = "/savetow2", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addQuestionTow2( @RequestParam("question") String question,
                                         @RequestParam("answer_1") String answer_1,
                                         @RequestParam("answer_2") String answer_2,
                                         @RequestParam("answer_3") String answer_3,
                                         @RequestParam("answer_4") String answer_4,
                                         @RequestParam("correctAnswer") String correctAnswer,
                                         @RequestParam("file_image") MultipartFile file_image,
                                         @RequestParam("part") int part,
                                         @RequestParam("difficult") int difficult,
                                         @RequestParam("time") int time) {
        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        WarehouseExam exam = new WarehouseExam();
        try {
            exam.setQuestion(question);
            exam.setAnswer_1(answer_1);
            exam.setAnswer_2(answer_2);
            exam.setAnswer_3(answer_3);
            exam.setAnswer_4(answer_4);
            exam.setCorrectAnswer(correctAnswer);
            Path pathImage = Paths.get(rootDirectory + "/resources/file/images/examquestion/" + file_image.getOriginalFilename());
            file_image.transferTo(new File(pathImage.toString()));
            exam.setImage( file_image.getOriginalFilename());
            exam.setPart(part);
            exam.setDifficult(difficult);
            exam.setTime(time);
            warehouseExamService.save(exam);
            // save data from file excel
        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }
        return response;
    }

    @PostMapping(value = "/savetow3", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addQuestionTow3( @RequestParam("question") String question,
                                         @RequestParam("answer_1") String answer_1,
                                         @RequestParam("answer_2") String answer_2,
                                         @RequestParam("answer_3") String answer_3,
                                         @RequestParam("answer_4") String answer_4,
                                         @RequestParam("correctAnswer") String correctAnswer,
                                         @RequestParam("part") int part,
                                         @RequestParam("difficult") int difficult,
                                         @RequestParam("time") int time) {
        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        WarehouseExam exam = new WarehouseExam();
        try {
            exam.setQuestion(question);
            exam.setAnswer_1(answer_1);
            exam.setAnswer_2(answer_2);
            exam.setAnswer_3(answer_3);
            exam.setAnswer_4(answer_4);
            exam.setCorrectAnswer(correctAnswer);
            exam.setPart(part);
            exam.setDifficult(difficult);
            exam.setTime(time);
            warehouseExamService.save(exam);
            // save data from file excel
        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }
        return response;
    }

    public List<WarehouseExam> getListFromExcel(String path_file_excel) {
        List<WarehouseExam> list = new ArrayList<>();

        try {
            FileInputStream excelFile = new FileInputStream(new File(path_file_excel));
            XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
            XSSFSheet worksheet = workbook.getSheetAt(0);
            for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
                WarehouseExam cauhoiexam = new WarehouseExam();

                XSSFRow row = worksheet.getRow(i);

                if (row.getCell(0) != null)
                    cauhoiexam.setPart((int) row.getCell(0).getNumericCellValue());

                if (row.getCell(1) != null)
                    cauhoiexam.setDifficult((int) row.getCell(1).getNumericCellValue());

                if (row.getCell(2) != null)
                    cauhoiexam.setTime((int) row.getCell(2).getNumericCellValue());

                if (row.getCell(3) != null)
                    cauhoiexam.setImage(row.getCell(3).getStringCellValue().toString());

                if (row.getCell(4) != null)
                    cauhoiexam.setAudiomp3(row.getCell(4).getStringCellValue().toString());

                if (row.getCell(5) != null)
                    cauhoiexam.setQuestion(row.getCell(5).getStringCellValue().toString());

                if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_STRING)
                    cauhoiexam.setAnswer_1(row.getCell(6).getStringCellValue().toString());
                if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_NUMERIC)
                    cauhoiexam.setAnswer_1(String.valueOf(row.getCell(6).getNumericCellValue()));

                if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_STRING)
                    cauhoiexam.setAnswer_2(row.getCell(7).getStringCellValue().toString());
                if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_NUMERIC)
                    cauhoiexam.setAnswer_2(String.valueOf(row.getCell(7).getNumericCellValue()));

                if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_STRING)
                    cauhoiexam.setAnswer_3(row.getCell(8).getStringCellValue().toString());
                if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_NUMERIC)
                    cauhoiexam.setAnswer_3(String.valueOf(row.getCell(8).getNumericCellValue()));

                if (row.getCell(9) != null && row.getCell(9).getCellType() == row.getCell(9).CELL_TYPE_STRING)
                    cauhoiexam.setAnswer_4(row.getCell(9).getStringCellValue().toString());
                if (row.getCell(9) != null && row.getCell(9).getCellType() == row.getCell(9).CELL_TYPE_NUMERIC)
                    cauhoiexam.setAnswer_4(String.valueOf(row.getCell(9).getNumericCellValue()));
                if (row.getCell(10) != null)
                    cauhoiexam.setCorrectAnswer(row.getCell(10).getStringCellValue().toString());
                list.add(cauhoiexam);
            }
        } catch (Exception e) {
            System.out.println("errorhere:" + e);
        }
        return list;
    }


    @GetMapping("/loadPart1")
    public List<String> loadPart1() {
        List<WarehouseExam> list = warehouseExamImpl.randomPart1();

        List<String> response1 = new ArrayList<String>();

        for (int i = 0; i < list.size(); i++) {
            String json = "IdCauHoi:" + list.get(i).getIdQuestion() + ","
                    + "CauHoi:" + list.get(i).getQuestion() + ","
                    + "DapanA:" + list.get(i).getAnswer_1() + ","
                    + "DapanB:" + list.get(i).getAnswer_2() + ","
                    + "DapanC:" + list.get(i).getAnswer_3() + ","
                    + "DapanD:" + list.get(i).getAnswer_4() + ","
                    + "DapanDung:" + list.get(i).getCorrectAnswer() + ","
                    + "anh:" + list.get(i).getImage() + ","
                    + "amthanh:" + list.get(i).getAudiomp3() + ","
                    + "phanthi:" + list.get(i).getPart() + ","
                    + "dokho:" + list.get(i).getDifficult() + ","
                    + "thoigian:" + list.get(i).getTime();

            response1.add(json);
        }
        return response1;
    }

    @GetMapping("/loadPart2")
    public List<String> loadPart2() {
        List<WarehouseExam> list = warehouseExamImpl.randomPart2();

        List<String> response2 = new ArrayList<String>();

        for (int i = 0; i < list.size(); i++) {
            String json = "IdCauHoi:" + list.get(i).getIdQuestion() + ","
                    + "CauHoi:" + list.get(i).getQuestion() + ","
                    + "DapanA:" + list.get(i).getAnswer_1() + ","
                    + "DapanB:" + list.get(i).getAnswer_2() + ","
                    + "DapanC:" + list.get(i).getAnswer_3() + ","
                    + "DapanD:" + list.get(i).getAnswer_4() + ","
                    + "DapanDung:" + list.get(i).getCorrectAnswer() + ","
                    + "anh:" + list.get(i).getImage() + ","
                    + "amthanh:" + list.get(i).getAudiomp3() + ","
                    + "phanthi:" + list.get(i).getPart() + ","
                    + "dokho:" + list.get(i).getDifficult() + ","
                    + "thoigian:" + list.get(i).getTime();

            response2.add(json);
        }
        return response2;
    }

    @GetMapping("/loadPart3")
    public List<String> loadPart3() {
        List<WarehouseExam> list = warehouseExamImpl.randomPart3();

        List<String> response3 = new ArrayList<String>();

        for (int i = 0; i < list.size(); i++) {
            String json = "IdCauHoi:" + list.get(i).getIdQuestion() + ","
                    + "CauHoi:" + list.get(i).getQuestion() + ","
                    + "DapanA:" + list.get(i).getAnswer_1() + ","
                    + "DapanB:" + list.get(i).getAnswer_2() + ","
                    + "DapanC:" + list.get(i).getAnswer_3() + ","
                    + "DapanD:" + list.get(i).getAnswer_4() + ","
                    + "DapanDung:" + list.get(i).getCorrectAnswer() + ","
                    + "anh:" + list.get(i).getImage() + ","
                    + "amthanh:" + list.get(i).getAudiomp3() + ","
                    + "phanthi:" + list.get(i).getPart() + ","
                    + "dokho:" + list.get(i).getDifficult() + ","
                    + "thoigian:" + list.get(i).getTime();

            response3.add(json);
        }
        return response3;
    }

    @GetMapping("/loadPart4")
    public List<String> loadPart4() {
        List<WarehouseExam> list = warehouseExamImpl.randomPart4();

        List<String> response4 = new ArrayList<String>();

        for (int i = 0; i < list.size(); i++) {
            String json = "IdCauHoi:" + list.get(i).getIdQuestion() + ","
                    + "CauHoi:" + list.get(i).getQuestion() + ","
                    + "DapanA:" + list.get(i).getAnswer_1() + ","
                    + "DapanB:" + list.get(i).getAnswer_2() + ","
                    + "DapanC:" + list.get(i).getAnswer_3() + ","
                    + "DapanD:" + list.get(i).getAnswer_4() + ","
                    + "DapanDung:" + list.get(i).getCorrectAnswer() + ","
                    + "anh:" + list.get(i).getImage() + ","
                    + "amthanh:" + list.get(i).getAudiomp3() + ","
                    + "phanthi:" + list.get(i).getPart() + ","
                    + "dokho:" + list.get(i).getDifficult() + ","
                    + "thoigian:" + list.get(i).getTime();

            response4.add(json);
        }
        return response4;
    }
//-----------------------Delete---------------------------------------
    @RequestMapping(value = "/delete/{idCauHoi}")
    public String deleteById(@PathVariable("idCauHoi") int id) {
        warehouseExamService.delete(id);
        return "success";
    }
    @GetMapping("/load")
    public List<String> load() {
        List<WarehouseExam> list = warehouseExamService.getAllWarehouseExam();

        List<String> responseLoad = new ArrayList<String>();

        for (int i = 0; i < list.size(); i++) {
            String json = "IdCauHoi:" + list.get(i).getIdQuestion() + ","
                    + "CauHoi:" + list.get(i).getQuestion() + ","
                    + "DapanA:" + list.get(i).getAnswer_1() + ","
                    + "DapanB:" + list.get(i).getAnswer_2() + ","
                    + "DapanC:" + list.get(i).getAnswer_3() + ","
                    + "DapanD:" + list.get(i).getAnswer_4() + ","
                    + "DapanDung:" + list.get(i).getCorrectAnswer() + ","
                    + "anh:" + list.get(i).getImage() + ","
                    + "amthanh:" + list.get(i).getAudiomp3() + ","
                    + "phanthi:" + list.get(i).getPart() + ","
                    + "dokho:" + list.get(i).getDifficult() + ","
                    + "thoigian:" + list.get(i).getTime();

            responseLoad.add(json);
        }
        return responseLoad;
    }
}
