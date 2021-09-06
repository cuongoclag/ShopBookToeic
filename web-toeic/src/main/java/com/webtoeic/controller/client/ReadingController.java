package com.webtoeic.controller.client;

import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.service.impl.ReadingExercisesQuestionsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.service.ReadingExercisesService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class ReadingController {
    @Autowired
    ReadingExercisesService readingExercisesService;
    @Autowired
    ReadingExercisesQuestionsImpl readingExercisesQuestionsimp;
    @GetMapping("/listReading")
    public String getListExam(@RequestParam(defaultValue = "1") int page, Model model) {

        // default value lấy từ kết quả đầu tiên
        try {
            Page<ReadingExercises> list = readingExercisesService.getReading(page-1, 4);
            int totalPage = list.getTotalPages();
            List<Integer> pagelist = new ArrayList<Integer>();
            //Lap ra danh sach cac trang
            if(page==1 || page ==2 )
            {
                for(int i = 2; i <=3 && i<=totalPage; i++)
                {
                    pagelist.add(i);
                }
            }else if(page == totalPage)
            {
                for(int i = totalPage; i >= totalPage - 2 && i> 1; i--)
                {
                    pagelist.add(i);
                }
                Collections.sort(pagelist);
            }else
            {
                for(int i = page; i <= page + 1 && i<= totalPage; i++)
                {
                    pagelist.add(i);
                }
                for(int i = page-1; i >= page - 1 && i> 1; i--)
                {
                    pagelist.add(i);
                }
                Collections.sort(pagelist);
            }
            model.addAttribute("pageList",pagelist);
            model.addAttribute("totalPage",totalPage);
            model.addAttribute("listData",list.getContent());
            model.addAttribute("currentPage",page);
            return "client/listReading";
        }catch(Exception e) {
            System.out.println("error:"+e);
            return "client/error";
        }
    }
    @RequestMapping(value = { "/readingDetails/{id}" }, method = RequestMethod.GET)
    public String readingDetails(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
                                   final HttpServletResponse response) throws Exception {
        List<ReadingExercisesQuestions> list = readingExercisesQuestionsimp.findReadingById(id);
        model.addAttribute("list", list);
        return "client/readingDetails";
    }
    @RequestMapping(value="/ResultReading/{Id}/{socaudung}",method=RequestMethod.POST)
    public String showResult(Model model,@RequestBody String[] jsonAnswerUser,
                             @PathVariable("Id") int id,
                             @PathVariable("socaudung") String socaudung) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        List<ReadingExercisesQuestions> list = readingExercisesQuestionsimp.findReadingById(id);
        for (int i = 0;i<3;i++) {
            list.get(i).setAnswerUser(jsonAnswerUser[i]);
        }
        model.addAttribute("socaudung",socaudung);
        model.addAttribute("list",list);

        return "client/readingDetailsResult";
    }
}
