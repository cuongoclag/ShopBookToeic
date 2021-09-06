package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.repository.ReviewRepository;
import com.webtoeic.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminReviewController {
    @Autowired
    ReviewRepository reviewRepository;
    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = { "/admin/listReview" }, method = RequestMethod.GET)
    public String listRating(final ModelMap model, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        model.addAttribute("review", reviewRepository.findAll());
        return "admin/listReview";
    }
    @RequestMapping(value = { "/admin/delete-review/{id}" }, method = RequestMethod.GET)
    public String deleteReview(@PathVariable("id") long id){
        reviewService.delete(id);
        return "redirect:/admin/listReview";
    }
}
