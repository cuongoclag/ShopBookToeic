package com.webtoeic.api.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.service.ReadingExercisesQuestionsService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.service.ReadingExercisesService;

@RestController
@RequestMapping("/api/admin/bai-doc")
public class ReadingExerciseApi {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ReadingExercisesService readingExercisesService;

	@Autowired
	private ReadingExercisesQuestionsService readingExercisesQuestionsService;

	@GetMapping("/all")
	public List<String> showAll(){
		List<ReadingExercises> list = readingExercisesService.getAllReading();

		List<String> response = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++){
			String json = "baidocid:" + list.get(i).getId() + ","
					+ "anhbaidoc:" + list.get(i).getReadingImage() + ","
					+ "tenbaidoc:" + list.get(i).getReadingTitle() ;
			response.add(json);
		}
		return response;
	}

	@RequestMapping(value = "/delete/{idBaiDoc}")
	public String deleteById(@PathVariable("idBaiDoc") int id) {
		readingExercisesService.delete(id);
		return "success";
	}
	@PostMapping(value = "/save", consumes = "multipart/form-data")
	@ResponseBody
	public List<String> addBaiDoc(@RequestParam("file_excel") MultipartFile file_excel,
								  @RequestParam("file_image") MultipartFile file_image,
								   @RequestParam("name") String name ){
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		ReadingExercises readingExercises = new ReadingExercises();

		readingExercisesService.save(readingExercises);

		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/reading/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/reading/" + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			readingExercises.setReadingTitle(name);
			readingExercises.setReadingImage(file_image.getOriginalFilename());
			readingExercisesService.save(readingExercises);

			// save data from file excel

			ReadingExerciseApi btt = new ReadingExerciseApi();
			List<ReadingExercisesQuestions> listCauHoi = btt.getListFromExcel(pathExcel.toString(), readingExercises);
			for (int i = 0; i < listCauHoi.size(); i++) {
				readingExercisesQuestionsService.save(listCauHoi.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorReadFileExcel:" + e);
		}
		return response;
	}

	@RequestMapping(value = "/info/{idBaiDoc}")
	public String infoById(@PathVariable("idBaiDoc") int id) {
		ReadingExercises baiReading = readingExercisesService.getReading(id).get(0);
		return baiReading.getReadingTitle();
	}
//	update
	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiDoc(@RequestParam("idReading") int id,
									 @RequestParam("file_excel") MultipartFile file_excel,
									 @RequestParam("file_image") MultipartFile file_image,
									 @RequestParam("name") String name) {

		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		ReadingExercises readingExercises = readingExercisesService.getReading(id).get(0);
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/reading/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/listening/" + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			readingExercises.setReadingTitle(name);
			readingExercises.setReadingImage(file_image.getOriginalFilename());
			readingExercisesService.save(readingExercises);

			ReadingExerciseApi btt = new ReadingExerciseApi();
			List<ReadingExercisesQuestions> listCauHoi = btt.getListFromExcel(pathExcel.toString(), readingExercises);
			for (int i = 0; i < listCauHoi.size(); i++) {
				readingExercisesQuestionsService.save(listCauHoi.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("errorUpdate:" + e);
		}

		return response;
	}
	// lưu ảnh và audio của bài nghe vào thư mục

	public List<ReadingExercisesQuestions> getListFromExcel(String path_file_excel, ReadingExercises Reading) {
		List<ReadingExercisesQuestions> list = new ArrayList<>();

		try {
			FileInputStream excelFile = new FileInputStream(new File(path_file_excel));
			XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
			XSSFSheet worksheet = workbook.getSheetAt(0);
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
				ReadingExercisesQuestions cauhoireading = new ReadingExercisesQuestions();
				XSSFRow row = worksheet.getRow(i);

				if (row.getCell(0) != null)
					cauhoireading.setNumber((int) row.getCell(0).getNumericCellValue());

				if (row.getCell(1) != null)
					cauhoireading.setQuestion(row.getCell(1).getStringCellValue().toString());

				if (row.getCell(2) != null && row.getCell(2).getCellType() == row.getCell(2).CELL_TYPE_STRING)
					cauhoireading.setAnswer_1(row.getCell(2).getStringCellValue().toString());
				if (row.getCell(2) != null && row.getCell(2).getCellType() == row.getCell(2).CELL_TYPE_NUMERIC)
					cauhoireading.setAnswer_1(String.valueOf(row.getCell(2).getNumericCellValue()));

				if (row.getCell(3) != null && row.getCell(3).getCellType() == row.getCell(3).CELL_TYPE_STRING)
					cauhoireading.setAnswer_2(row.getCell(3).getStringCellValue().toString());
				if (row.getCell(3) != null && row.getCell(3).getCellType() == row.getCell(3).CELL_TYPE_NUMERIC)
					cauhoireading.setAnswer_2(String.valueOf(row.getCell(3).getNumericCellValue()));

				if (row.getCell(4) != null && row.getCell(4).getCellType() == row.getCell(4).CELL_TYPE_STRING)
					cauhoireading.setAnswer_3(row.getCell(4).getStringCellValue().toString());
				if (row.getCell(4) != null && row.getCell(4).getCellType() == row.getCell(4).CELL_TYPE_NUMERIC)
					cauhoireading.setAnswer_3(String.valueOf(row.getCell(4).getNumericCellValue()));

				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_STRING)
					cauhoireading.setAnswer_4(row.getCell(5).getStringCellValue().toString());
				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_NUMERIC)
					cauhoireading.setAnswer_4(String.valueOf(row.getCell(5).getNumericCellValue()));

				if (row.getCell(6) != null)
					cauhoireading.setCorrectAnswer(row.getCell(6).getStringCellValue().toString());
				cauhoireading.setReadingExercises(Reading);
				list.add(cauhoireading);
			}
		} catch (Exception e) {
			System.out.println("errorhere:" + e);
		}
		return list;
	}
}
