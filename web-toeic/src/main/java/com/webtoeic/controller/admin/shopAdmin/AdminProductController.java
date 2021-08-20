package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.entities.AjaxResponse;
import com.webtoeic.entities.Product;
import com.webtoeic.repository.CategoryRepository;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminProductController {
    @Autowired
    CategoryRepository categoryRepo;
    @Autowired
    ProductService productService;
    @Autowired
    public ProductRepository productRepo;

    @RequestMapping(value = { "/admin/list-product" }, method = RequestMethod.GET)
    public String listProduct(final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        model.addAttribute("products", productRepo.findAll());
        return "admin/listProduct";
    }

    @RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.GET)
    public String addProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        model.addAttribute("categories", categoryRepo.findAll());
        model.addAttribute("product", new Product());
        return "admin/addProduct";
    }

    @RequestMapping(value = { "/admin/edit-product/{seo}" }, method = RequestMethod.GET)
    public String editProduct(@PathVariable("seo") String seo, final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {

        model.addAttribute("categories", categoryRepo.findAll());
        ProductSearch productSearch = new ProductSearch();
        productSearch.setSeoProduct(seo);
        model.addAttribute("product", productService.search(productSearch).get(0));
        return "admin/addProduct";
    }

    @RequestMapping(value = { "/admin/save-product" }, method = RequestMethod.POST)
    public String saveProduct(@RequestParam("images") MultipartFile[] images,
                              @ModelAttribute("product") Product product, final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        productService.saveProduct(images, product);

//		return "admin/product/add-product";
        return "redirect:/admin/list-product";
//		adminProductService.saveProduct(productAvatars, product);
//		return "redirect:/admin/list-products?success_from_add_product";
    }

    @RequestMapping(value = { "/admin/list-product/delete-product-with-ajax/{seo}" }, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> subscribe(@PathVariable("seo") String seo, final ModelMap model, final HttpServletRequest request,
                                                  final HttpServletResponse response) throws Exception {
        HttpSession httpSession = request.getSession();
//		model.addAttribute("categories", categoryRepo.findAll());
//		model.addAttribute("product", productService.findProductBySeo(seo));

//			String status = String.valueOf(data.getStatus());
//			System.out.println("Status: " + status);
        ProductSearch productSearch = new ProductSearch();
        productSearch.setSeoProduct(seo);
        Product products = productService.search(productSearch).get(0);

//				System.out.println("ID:  "+products.getId());
//				System.out.println("title :  "+products.getTitle());
        products.setUpdatedDate(java.time.LocalDateTime.now());

        products.setPriceVN(products.getPriceVN());
        products.setStatus(false);
        productRepo.save(products);

        return ResponseEntity.ok(new AjaxResponse(200, "SUCCESS"));
    }
}
