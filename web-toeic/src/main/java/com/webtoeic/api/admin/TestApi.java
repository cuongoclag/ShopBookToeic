package com.webtoeic.api.admin;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.Test;
import com.webtoeic.service.TestQuestionsService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.entities.TestQuestions;
import com.webtoeic.service.TestService;

@RestController
@RequestMapping("/api/admin/exam")
public class TestApi {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	public TestService testService;

	@Autowired
	public TestQuestionsService testQuestionsService;

	@GetMapping("/loadExam")
	public List<String> showAllExam() {

		List<Test> list = testService.getAllTest();

		List<String> response = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			String json = "baithithuid:" + list.get(i).getTestId() + ","
					+ "anhbaithithu:" + list.get(i).getTestImage() + ","
					+ "tenbaithithu:" + list.get(i).getTestTitle();

			response.add(json);
		}

		return response;

	}

	@RequestMapping(value = "/delete/{idBaiThiThu}")
	public String deleteById(@PathVariable("idBaiThiThu") int id) {
		testService.delete(id);
		return "success";
	}

	@PostMapping(value = "/save", consumes = "multipart/form-data")
	@ResponseBody
	public List<String> addBaiThiThu(@RequestParam("file_excel") MultipartFile file_excel,
									 @RequestParam("file_image") MultipartFile file_image,
									 @RequestParam("name") String name,
									 @RequestParam("file_image_question") MultipartFile[] file_image_question,
									 @RequestParam("file_listening") MultipartFile[] file_listening) {
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		Test baithithu = new Test();
		testService.save(baithithu);

		// System.out.println("id="+baithithu.getBaithithuid());
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/exam/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));
			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/examquestion/"  + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}
			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/examquestion/" + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}
			baithithu.setTestTitle(name);
			baithithu.setTestImage( file_image.getOriginalFilename());
			testService.save(baithithu);
			// save data from file excel
			TestApi btt = new TestApi();
			List<TestQuestions> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), baithithu);
			for (int i = 0; i < listCauHoiFull.size(); i++) {
				testQuestionsService.save(listCauHoiFull.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorReadFileExcel:" + e);
		}
		return response;
	}


	@PostMapping(value = "/save1", consumes = "multipart/form-data")
	@ResponseBody
	public List<String> addBaiThiThu1(@RequestParam("file_excel") MultipartFile file_excel,
									  @RequestParam("file_image") MultipartFile file_image,
									 @RequestParam("name") String name) {
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		Test test = new Test();
		testService.save(test);

		// System.out.println("id="+baithithu.getBaithithuid());
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/exam/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			test.setTestTitle(name);
			testService.save(test);
			// save data from file excel
			TestApi btt = new TestApi();
			List<TestQuestions> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), test);
			for (int i = 0; i < listCauHoiFull.size(); i++) {
				testQuestionsService.save(listCauHoiFull.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorReadFileExcel:" + e);
		}
		return response;
	}

	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiGrammar(@RequestParam("idExam") int id,
										 @RequestParam("name") String name,
										 @RequestParam("file_image") MultipartFile file_image,
										 @RequestParam("file_image_question") MultipartFile[] file_image_question,
										 @RequestParam("file_listening") MultipartFile[] file_listening,
										 @RequestParam("file_excel") MultipartFile file_excel) {

		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Test baithithu = testService.getTest(id).get(0);
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/exam/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/exam/" + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}

			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/exam/" + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}

			baithithu.setTestTitle(name);
			baithithu.setTestImage( file_image.getOriginalFilename());
			testService.save(baithithu);

			TestApi btt = new TestApi();
			List<TestQuestions> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), baithithu);

			for (int i = 0; i < listCauHoiFull.size(); i++) {
				testQuestionsService.save(listCauHoiFull.get(i));
			}

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("errorUpdate:" + e);
		}

		return response;
	}

	// get info Exam ->edit Exam
	@RequestMapping(value = "/infoExam/{idBaiThiThu}")
	public String infoGrammarById(@PathVariable("idBaiThiThu") int id) {
		Test baiexam = testService.getTest(id).get(0);
		return baiexam.getTestTitle();
	}

	public List<TestQuestions> getListFromExcel(String path_file_excel, Test baithithu) {
		List<TestQuestions> list = new ArrayList<>();

		try {
			FileInputStream excelFile = new FileInputStream(new File(path_file_excel));
			XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
			XSSFSheet worksheet = workbook.getSheetAt(0);
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
				TestQuestions cauhoiexam = new TestQuestions();

				XSSFRow row = worksheet.getRow(i);

				if (row.getCell(0) != null)
					cauhoiexam.setNumber((int) row.getCell(0).getNumericCellValue());

				if (row.getCell(1) != null)
					cauhoiexam.setIdQuestion((int) row.getCell(1).getNumericCellValue());

				if(row.getCell(2) != null){
					cauhoiexam.setQuestion(row.getCell(2).getStringCellValue().toString());
				}
				if (row.getCell(3) != null && row.getCell(3).getCellType() == row.getCell(3).CELL_TYPE_STRING)
					cauhoiexam.setAnswer_1(row.getCell(3).getStringCellValue().toString());
				if (row.getCell(3) != null && row.getCell(3).getCellType() == row.getCell(3).CELL_TYPE_NUMERIC)
					cauhoiexam.setAnswer_1(String.valueOf(row.getCell(3).getNumericCellValue()));

				if (row.getCell(4) != null && row.getCell(4).getCellType() == row.getCell(4).CELL_TYPE_STRING)
					cauhoiexam.setAnswer_2(row.getCell(4).getStringCellValue().toString());
				if (row.getCell(4) != null && row.getCell(4).getCellType() == row.getCell(4).CELL_TYPE_NUMERIC)
					cauhoiexam.setAnswer_2(String.valueOf(row.getCell(4).getNumericCellValue()));

				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_STRING)
					cauhoiexam.setAnswer_3(row.getCell(5).getStringCellValue().toString());
				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_NUMERIC)
					cauhoiexam.setAnswer_3(String.valueOf(row.getCell(5).getNumericCellValue()));

				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_STRING)
					cauhoiexam.setAnswer_4(row.getCell(6).getStringCellValue().toString());
				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_NUMERIC)
					cauhoiexam.setAnswer_4(String.valueOf(row.getCell(6).getNumericCellValue()));

				if (row.getCell(7) != null)
					cauhoiexam.setCorrectAnswer(row.getCell(7).getStringCellValue().toString());

				if (row.getCell(8) != null)
					cauhoiexam.setImage(row.getCell(8).getStringCellValue().toString());

				if (row.getCell(9) != null)
					cauhoiexam.setAudiomp3(row.getCell(9).getStringCellValue().toString());

				if (row.getCell(10) != null)
					cauhoiexam.setPart((int) row.getCell(10).getNumericCellValue());

				if (row.getCell(11) != null)
					cauhoiexam.setDifficult((int) row.getCell(11).getNumericCellValue());

				if (row.getCell(12) != null)
					cauhoiexam.setTime((int) row.getCell(12).getNumericCellValue());
				cauhoiexam.setTest(baithithu);
				list.add(cauhoiexam);

			}
		} catch (Exception e) {
			System.out.println("errorhere:" + e);
		}

		return list;

	}

}
