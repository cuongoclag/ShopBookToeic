package com.webtoeic.api.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.ListeningExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.service.ListeningExercisesService;

@RestController
@RequestMapping("/api/admin/bai-nghe")
public class ListeningExercisesApi {

	@Autowired
	private ListeningExercisesService listeningExercisesService;

	@GetMapping("/all")
	public ResponseEntity<Page<ListeningExercises>> findAllByPartAndDifficult(@RequestParam(defaultValue = "1") int page,
																			  @RequestParam(defaultValue="") String part, @RequestParam(defaultValue="") String doKho) {
		return new ResponseEntity<>(listeningExercisesService.findAllListBaiTapNgheByPartAndDoKhoAdmin(page, 6, part, doKho),
				HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<ListeningExercises> findById(@PathVariable long id) {
		Optional<ListeningExercises> bn = listeningExercisesService.findBaiTapNgheById(id);
		return bn.isPresent() ? new ResponseEntity<>(bn.get(), HttpStatus.OK): new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}

	@PostMapping(value = "/save")
	public ResponseEntity<?> saveBaiNghe(@ModelAttribute ListeningExercises baiNgheInfor, HttpServletRequest request) {
//			@RequestPart("photoBaiNghe") MultipartFile photoBaiNghe, @RequestPart("audio") MultipartFile audio,
//			@RequestPart("fileExcelCauHoi") MultipartFile fileExcelCauHoi,
		try {
			System.out.println(baiNgheInfor.toString());
			ListeningExercises baiNghe = listeningExercisesService.saveBaiTapNghe(baiNgheInfor, request);
			saveFileForBaiNghe(baiNghe, request);
			return new ResponseEntity<>(HttpStatus.CREATED);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteById(@PathVariable long id) {
		listeningExercisesService.deleteBaiTapNghe(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	// lưu ảnh và audio của bài nghe vào thư mục
	private void saveFileForBaiNghe(ListeningExercises bn, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile fileAudio = bn.getAudio();
		MultipartFile fileImage = bn.getListeningPhoto();
		MultipartFile fileExcel = bn.getFileExcelQuestions();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path pathImage = Paths.get(rootDirectory + "/resources/file/images/baiNgheId=" + bn.getId() + ".png");
		Path pathAudio = Paths.get(rootDirectory + "/resources/file/audio/baiNgheId=" + bn.getId() + ".mp3");
		Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/baiNgheId=" + bn.getId() + ".xlsx");
		fileAudio.transferTo(new File(pathAudio.toString()));
		fileImage.transferTo(new File(pathImage.toString()));
		fileExcel.transferTo(new File(pathExcel.toString()));

	}


}
