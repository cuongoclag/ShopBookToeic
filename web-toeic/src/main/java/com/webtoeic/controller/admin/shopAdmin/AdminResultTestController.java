package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.repository.ResultTestRepository;
import com.webtoeic.service.ResultTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminResultTestController {
    @Autowired
    private ResultTestRepository resultTestRepository;

    @Autowired
    private ResultTestService resultTestService;

    @RequestMapping(value = { "/admin/listResultTest" }, method = RequestMethod.GET)
    public String listResultTest(final ModelMap model, final HttpServletRequest request,
                             final HttpServletResponse response) throws Exception {
        model.addAttribute("liestResult", resultTestRepository.findAll());
        return "admin/listResultTest";
    }

    @RequestMapping(value = { "/admin/delete/{id}" }, method = RequestMethod.GET)
    public String deleteReview(@PathVariable("id") int id){
        resultTestRepository.deleteById(id);
        return "redirect:/admin/listResultTest";
    }
}
