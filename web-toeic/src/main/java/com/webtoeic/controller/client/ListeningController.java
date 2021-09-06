package com.webtoeic.controller.client;

import com.webtoeic.entities.*;
import com.webtoeic.service.ListeningExercisesQuestionsService;
import com.webtoeic.service.impl.ListeningExercisesQuestionsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.webtoeic.service.ListeningExercisesService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class ListeningController {
    @Autowired
    ListeningExercisesService listeningExercisesService;
    @Autowired
    ListeningExercisesQuestionsImpl listeningExercisesQuestionsimp;

    @GetMapping("/listListening")
    public String getListExam(@RequestParam(defaultValue = "1") int page, Model model) {

        // default value lấy từ kết quả đầu tiên
        try {
            Page<ListeningExercises> list = listeningExercisesService.getListening(page-1, 4);
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
            return "client/listListening";
        }catch(Exception e) {
            System.out.println("error:"+e);
            return "client/error";
        }
    }
    @RequestMapping(value = { "/listeningDetails/{id}" }, method = RequestMethod.GET)
    public String listeningDetails(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        List<ListeningExercisesQuestions> list = listeningExercisesQuestionsimp.findListeningById(id);
        model.addAttribute("list", list);
        return "client/listeningDetails";
    }

    @RequestMapping(value="/ResultListening/{Id}/{socaudung}",method=RequestMethod.POST)
    public String showResult(Model model,@RequestBody String[] jsonAnswerUser,
                             @PathVariable("Id") int id,
                             @PathVariable("socaudung") String socaudung) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        List<ListeningExercisesQuestions> list = listeningExercisesQuestionsimp.findListeningById(id);
        for (int i = 0;i<3;i++) {
            list.get(i).setAnswerUser(jsonAnswerUser[i]);
        }
        model.addAttribute("socaudung",socaudung);
        model.addAttribute("list",list);

        return "client/listeningDetailsResult";
    }
}
