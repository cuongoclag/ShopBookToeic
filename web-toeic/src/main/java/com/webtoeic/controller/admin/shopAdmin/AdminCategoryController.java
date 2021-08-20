package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.entities.AjaxResponse;
import com.webtoeic.entities.Category;
import com.webtoeic.repository.CategoryRepository;
import com.webtoeic.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminCategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = { "/admin/list-category" }, method = RequestMethod.GET)
    public String listCategory(final ModelMap model, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        model.addAttribute("categories", categoryRepository.findAll());
        return "admin/listCategory";
    }

    @RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.GET)
    public String addCategory(final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("category", new Category());
        return "admin/addCategory";
    }

    @RequestMapping(value = { "/admin/edit-category/{seo}" }, method = RequestMethod.GET)
    public String editCategory(@PathVariable("seo") String seo, final ModelMap model, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("category", categoryService.findCategoryBySeo(seo));
        return "admin/addCategory";
    }
    @RequestMapping(value = { "/admin/save-category" }, method = RequestMethod.POST)
    public String saveCategory(@ModelAttribute("category") Category category, final ModelMap model,
                               final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        categoryService.saveCategory(category);

//		return "admin/product/add-product";
        return "redirect:/admin/list-category";
//		adminProductService.saveProduct(productAvatars, product);
//		return "redirect:/admin/list-products?success_from_add_product";
    }

    @RequestMapping(value = { "/admin/list-category/delete-category-with-ajax/{seo}" }, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> subscribe(@ModelAttribute("category") Category category, @RequestBody Category data,
                                                  @PathVariable("seo") String seo, final ModelMap model, final HttpServletRequest request,
                                                  final HttpServletResponse response) throws Exception {

        Category categories = categoryService.findCategoryBySeo(seo);

        categories.setStatus(false);
        categoryRepository.save(categories);

        return ResponseEntity.ok(new AjaxResponse(401, data));
    }
}
