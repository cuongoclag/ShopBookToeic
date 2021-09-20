package com.webtoeic.controller.admin;

import com.webtoeic.entities.Test;
import com.webtoeic.service.impl.TestImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ToeicExamController {
    @Autowired
    private TestImpl testimp;
    @RequestMapping(value = { "/save-toeicExam" }, method = RequestMethod.POST)
    public String saveToeicExam(@ModelAttribute("test") Test test, final ModelMap model,
                                final HttpServletRequest request, final HttpServletResponse response) throws Exception {


        testimp.save(test);

//		return "admin/product/add-product";
        return "redirect:/admin/exam";
//		adminProductService.saveProduct(productAvatars, product);
//		return "redirect:/admin/list-products?success_from_add_product";
    }
}
