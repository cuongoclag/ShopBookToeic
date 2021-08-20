package com.webtoeic.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.ListeningExercisesQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.ListeningExercisesQuestionsRepository;

@Service
public class ListeningExercisesQuestionsService {

	@Autowired
	private ListeningExercisesQuestionsRepository listeningExercisesQuestionsRepository;

	public Page<ListeningExercisesQuestions> findListListeningExercisesQuestionsId(int page, int size, long baiTapNgheId) {
		return listeningExercisesQuestionsRepository.findByListeningExercisesId(baiTapNgheId, PageRequest.of(page - 1, size));
	}

	public List<ListeningExercisesQuestions> findListListeningExercisesQuestionsId(long baiTapNgheId) {
		return listeningExercisesQuestionsRepository.findByListeningExercisesId(baiTapNgheId);
	}

	public Optional<ListeningExercisesQuestions> findQuestionsById(long id) {
		return listeningExercisesQuestionsRepository.findById(id);
	}

	@Transactional
	public ListeningExercisesQuestions saveListeningExercisesQuestions(ListeningExercisesQuestions listeningExercisesQuestions, HttpServletRequest request)
			throws IOException {
		ListeningExercisesQuestions ch = listeningExercisesQuestionsRepository.save(listeningExercisesQuestions);
		if (ch.getPhotoData() != null) {
			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			Path path = Paths.get(rootDirectory + "/resources/file/images/cauHoiBaiNgheId=" + ch.getId() + ".png");
			Files.write(path, listeningExercisesQuestions.getPhotoData());
		}
		return listeningExercisesQuestionsRepository.save(listeningExercisesQuestions);
	}

	public void deleteCauHoiBaiTapNghe(long id) {
		listeningExercisesQuestionsRepository.deleteById(id);
	}
}
