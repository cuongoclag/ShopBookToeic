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
import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;
import com.webtoeic.service.ListeningExercisesQuestionsService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.service.ListeningExercisesService;

@RestController
@RequestMapping("/api/admin/bai-nghe")
public class ListeningExercisesApi {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ListeningExercisesService listeningExercisesService;

	@Autowired
	private ListeningExercisesQuestionsService listeningExercisesQuestionsService;

	@GetMapping("/all")
	public List<String> showAll(){
		List<ListeningExercises> list = listeningExercisesService.getAllListening();

		List<String> response = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++){
			String json = "baingheid:" + list.get(i).getId() + ","
					+ "tenbainghe:" + list.get(i).getListeningTitle() + ","
					+ "part:" + list.get(i).getPart();
			response.add(json);
		}
		return response;
	}
	@PostMapping(value = "/save", consumes = "multipart/form-data")
	@ResponseBody
	public List<String> addBaiNghe(@RequestParam("file_excel") MultipartFile file_excel,
									 @RequestParam("name") String name,
								   	@RequestParam("phanthi") int phanthi,
//								   @RequestParam("dokho") int dokho,
									 @RequestParam("file_image_question") MultipartFile[] file_image_question,
									 @RequestParam("file_listening") MultipartFile[] file_listening) {
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		ListeningExercises listeningExercises = new ListeningExercises();

		listeningExercisesService.save(listeningExercises);

		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/Listening/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/Listening/"  + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}

			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/Listening/" + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}

			listeningExercises.setListeningTitle(name);
			listeningExercises.setPart(phanthi);
//			listeningExercises.setDifficult(dokho);

			listeningExercisesService.save(listeningExercises);

			// save data from file excel

			ListeningExercisesApi btt = new ListeningExercisesApi();
			List<ListeningExercisesQuestions> listCauHoi = btt.getListFromExcel(pathExcel.toString(), listeningExercises);
			for (int i = 0; i < listCauHoi.size(); i++) {
				listeningExercisesQuestionsService.save(listCauHoi.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorReadFileExcel:" + e);
		}
		return response;
	}
	@RequestMapping(value = "/delete/{idBaiNghe}")
		public String deleteById(@PathVariable("idBaiNghe") int id) {
			listeningExercisesService.delete(id);
			return "success";
	}



	@RequestMapping(value = "/info/{idBaiNghe}")
	public String infoById(@PathVariable("idBaiNghe") int id) {
		ListeningExercises baiListening = listeningExercisesService.getListening(id).get(0);
		return baiListening.getListeningTitle();
	}

	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiNghe(@RequestParam("idListening") int id,
									  @RequestParam("file_excel") MultipartFile file_excel,
									  @RequestParam("name") String name,
									  @RequestParam("phanthi") int phanthi,
//									  @RequestParam("dokho") int dokho,
									  @RequestParam("file_image_question") MultipartFile[] file_image_question,
									  @RequestParam("file_listening") MultipartFile[] file_listening) {

		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		ListeningExercises listeningExercises = listeningExercisesService.getListening(id).get(0);
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/listening/" + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/listening/" + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}

			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/listening/" + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}

			listeningExercises.setListeningTitle(name);
			listeningExercises.setPart(phanthi);
//			listeningExercises.setDifficult(dokho);
			listeningExercisesService.save(listeningExercises);

			ListeningExercisesApi btt = new ListeningExercisesApi();
			List<ListeningExercisesQuestions> listCauHoi = btt.getListFromExcel(pathExcel.toString(), listeningExercises);
			for (int i = 0; i < listCauHoi.size(); i++) {
				listeningExercisesQuestionsService.save(listCauHoi.get(i));
			}
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("errorUpdate:" + e);
		}

		return response;
	}
	// lưu ảnh và audio của bài nghe vào thư mục

	public List<ListeningExercisesQuestions> getListFromExcel(String path_file_excel, ListeningExercises Listening) {
		List<ListeningExercisesQuestions> list = new ArrayList<>();

		try {
			FileInputStream excelFile = new FileInputStream(new File(path_file_excel));
			XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
			XSSFSheet worksheet = workbook.getSheetAt(0);
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
				ListeningExercisesQuestions cauhoilistening = new ListeningExercisesQuestions();
				XSSFRow row = worksheet.getRow(i);

				if (row.getCell(0) != null)
					cauhoilistening.setNumber((int) row.getCell(0).getNumericCellValue());

				if (row.getCell(1) != null)
					cauhoilistening.setImage(
							row.getCell(1).getStringCellValue().toString());

				if (row.getCell(2) != null)
					cauhoilistening.setAudiomp3(
							row.getCell(2).getStringCellValue().toString());

				if (row.getCell(3) != null)
					cauhoilistening.setParagraph(row.getCell(3).getStringCellValue().toString());

				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_STRING)
					cauhoilistening.setAnswer_1(row.getCell(5).getStringCellValue().toString());
				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_NUMERIC)
					cauhoilistening.setAnswer_1(String.valueOf(row.getCell(5).getNumericCellValue()));

				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_STRING)
					cauhoilistening.setAnswer_2(row.getCell(6).getStringCellValue().toString());
				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_NUMERIC)
					cauhoilistening.setAnswer_2(String.valueOf(row.getCell(6).getNumericCellValue()));

				if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_STRING)
					cauhoilistening.setAnswer_3(row.getCell(7).getStringCellValue().toString());
				if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_NUMERIC)
					cauhoilistening.setAnswer_3(String.valueOf(row.getCell(7).getNumericCellValue()));

				if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_STRING)
					cauhoilistening.setAnswer_4(row.getCell(8).getStringCellValue().toString());
				if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_NUMERIC)
					cauhoilistening.setAnswer_4(String.valueOf(row.getCell(8).getNumericCellValue()));
				if (row.getCell(9) != null)
					cauhoilistening.setCorrectAnswer(row.getCell(9).getStringCellValue().toString());
				cauhoilistening.setListeningExercises(Listening);
				list.add(cauhoilistening);

			}
		} catch (Exception e) {
			System.out.println("errorhere:" + e);
		}

		return list;

	}
}
