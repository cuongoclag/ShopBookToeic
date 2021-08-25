package com.webtoeic.controller.client;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.entities.Category;
import com.webtoeic.entities.Grammar;
import com.webtoeic.entities.Product;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.service.CategoryService;
import com.webtoeic.service.GrammarService;
import com.webtoeic.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductRepository productRepository;


    //Trả về trang listBook
    @RequestMapping(value = "/listBook")
    public String listBook(Model model, @Param("keyword") String keyword, final HttpServletRequest request){
        ProductSearch productSearch = new ProductSearch();
        keyword = request.getParameter("keyword");
        productSearch.setStatusProduct(1);
        if (keyword != null) {
            productSearch.setKeyword(keyword);
        }
//        List<Product> product = productService.search(productSearch);
        productSearch.parseRequest(request);

//        List<Product> productList = productService.findAllProduct();
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("listProduct", productService.search(productSearch));
//        model.addAttribute("listProduct", productList);
        model.addAttribute("listCategory", categoryList);
        return "client/listBook";
    }
    // ----------------------------------------------------------
    @RequestMapping(value = { "/bookDetails/{id}" }, method = RequestMethod.GET)
    public String detailsBook(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        List<Product> list = productService.findProductById(id);
        model.addAttribute("list", list);
        return "client/detailBook";
    }

//
//    ---------------------------------------------------------------------------------
//    @RequestMapping(value = "/searchBook/{search}", method = RequestMethod.POST)
//    public String searchVocab(Model model, @PathVariable("search") String search,
//                              @RequestParam(defaultValue = "1") int page) {
//        if (search.equals("all"))
//        {
//            Page<Product> list = productRepository.getProduct(page - 1, 4);
//            int totalPage = list.getTotalPages();
//            model.addAttribute("totalPage", totalPage);
//            model.addAttribute("listData", list.getContent());
//            model.addAttribute("currentPage", page);
//            List<Integer> pagelist = new ArrayList<Integer>();
//            // Lap ra danh sach cac trang
//            if (page == 1 || page == 2) {
//                for (int i = 2; i <= 3 && i <= totalPage; i++) {
//                    pagelist.add(i);
//                }
//            } else if (page == totalPage) {
//                for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
//                    pagelist.add(i);
//                }
//                Collections.sort(pagelist);
//            } else {
//                for (int i = page; i <= page + 1 && i <= totalPage; i++) {
//                    pagelist.add(i);
//                }
//                for (int i = page - 1; i >= page - 1 && i > 1; i--) {
//                    pagelist.add(i);
//                }
//                Collections.sort(pagelist);
//            }
//            model.addAttribute("pageList", pagelist);
//            model.addAttribute("search",search);
//
//        }
//        else
//        {
//            List<Product> list = productRepository.searchListBook(search);
//            model.addAttribute("listData", list);
//            model.addAttribute("search",search);
//        }
//        return "client/resultSearchGrammar";
//    }
}
