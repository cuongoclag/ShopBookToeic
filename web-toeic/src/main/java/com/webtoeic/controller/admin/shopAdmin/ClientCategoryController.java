package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.entities.Category;
import com.webtoeic.entities.Product;
import com.webtoeic.service.CategoryService;
import com.webtoeic.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ClientCategoryController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;
    @RequestMapping(value = "/listBook/{seo}", method = RequestMethod.GET)
    public String getFoosBySimplePathWithPathVariable(@PathVariable("seo") String seo, final ModelMap model,
                                                      final HttpServletRequest request, final HttpServletResponse response) {

        ProductSearch productSearch = new ProductSearch();
        productSearch.setSeoCategory(seo);

        List<Product> product = productService.search(productSearch);
        List<Category> categoryList = categoryService.findAllCategory();
        int numberOfPage = product.size()/productSearch.SIZE_ITEMS_ON_PAGE +1;
        System.out.println("numberOfPage: "+numberOfPage);
        ArrayList numberOP = new ArrayList();
        for (int i = 1; i < numberOfPage+1; i++) {
            numberOP.add(i);
        }
        productSearch.parseRequest(request);
        model.addAttribute("numberOP", numberOP);
        model.addAttribute("numberOfPage", numberOfPage);
        model.addAttribute("listCategory", categoryList);

        // lấy sản phẩm từ category.
        model.addAttribute("products", productService.search(productSearch));
        return "client/listBook";
    }
}
