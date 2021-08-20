package com.webtoeic.api.admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.Grammar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.service.GrammarService;

@RestController
@RequestMapping("/api/admin/grammar")
public class GrammarApi {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private GrammarService grammarService;
	@GetMapping("/loadGrammar")
	public List<String> showAllGrammar() {
		List<Grammar> list = grammarService.getAllGrammar();
		List<String> response = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
//			String json ="{"+"'baithithuid':"+"'"+list.get(i).getBaithithuid()+	"',"
//					+ "'anhbaithithu':'"+list.get(i).getAnhbaithithu()+			"',"
//					+ "'tenbaithithu':'"+list.get(i).getTenbaithithu()+			"'}";
			String json = "baithithuid:" + list.get(i).getGrammarId() + "," + "anhbaithithu:"
					+ list.get(i).getGrammarImage() + "," + "tenbaithithu:" + list.get(i).getGrammarTitle();
			response.add(json);
		}
		return response;
	}
	@RequestMapping(value = "/delete/{idBaiGrammar}")
	public String deleteById(@PathVariable("idBaiGrammar") int id) {
		grammarService.delete(id);
		return "success";
	}
	// get info Grammar ->edit Grammar
	@RequestMapping(value = "/infoGrammar/{idBaiGrammar}")
	public String infoGrammarById(@PathVariable("idBaiGrammar") int id) {
		Grammar grammar = grammarService.getGrammar(id).get(0);

		String json = "name==" + grammar.getGrammarTitle() + "|" + "anhbaigrammar=="
				+ grammar.getGrammarImage() + "|" + "content==" + grammar.getContentMarkDown();

		return json;
	}
	@PostMapping(value = "/save")
	@ResponseBody
	public List<String> addBaiGrammar(
			@RequestParam("file_image") MultipartFile file_image,
			@RequestParam("name") String name,
			@RequestParam("contentMarkdown") String contentMarkdown,
			@RequestParam("contentHtml") String contentHtml) {
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Grammar baigrammar = new Grammar();
		grammarService.save(baigrammar);
		try {
			// save file upload to local folder
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/grammar/" + "" + baigrammar.getGrammarId() + "."
					+ file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));
			baigrammar.setGrammarImage(baigrammar.getGrammarId() + "." + file_image.getOriginalFilename());
			baigrammar.setGrammarTitle(name);
			baigrammar.setContentMarkDown(contentMarkdown);
			baigrammar.setContentHTML(contentHtml);
			grammarService.save(baigrammar);
		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorAddGrammar:" + e);
		}
		return response;
	}


	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiGrammar(
			@RequestParam("idGrammar") int id,
			@RequestPart("file_image") MultipartFile file_image,
			@RequestParam("name") String name,
			@RequestParam("contentMarkdown") String contentMarkdown,
			@RequestParam("contentHtml") String contentHtml) {

		List<String> response = new ArrayList<String>();

		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Grammar baigrammar = grammarService.getGrammar(id).get(0);
		grammarService.save(baigrammar);
		try {
			// save file upload to local folder
			if(!file_image.isEmpty()) {
				Path pathImage = Paths.get(rootDirectory + "/resources/file/images/grammar/" + "" + baigrammar.getGrammarId() + "."
						+ file_image.getOriginalFilename());
				file_image.transferTo(new File(pathImage.toString()));
				baigrammar.setGrammarImage(baigrammar.getGrammarId() + "." + file_image.getOriginalFilename());
			}

			baigrammar.setGrammarTitle(name);
			baigrammar.setContentMarkDown(contentMarkdown);
			baigrammar.setContentHTML(contentHtml);

			grammarService.save(baigrammar);

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorAddGrammar:" + e);

		}

		return response;
	}


}
