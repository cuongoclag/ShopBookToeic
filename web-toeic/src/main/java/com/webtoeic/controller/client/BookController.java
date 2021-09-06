package com.webtoeic.controller.client;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.entities.*;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.ReviewRepository;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

@Controller
public class BookController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    ProductRepository productRepo;
    @Autowired
    SaleOrderRepository saleOrderRepo;
    @Autowired
    SaleOrderService saleOrderService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    ReviewRepository reviewRepository;


    //Trả về trang listBook
    @RequestMapping(value = "/listBook")
    public String listBook(Model model, @Param("keyword") String keyword, final HttpServletRequest request){
        ProductSearch productSearch = new ProductSearch();

        String price = request.getParameter("price");
        keyword = request.getParameter("keyword");
        productSearch.setStatusProduct(1);
        if (keyword != null) {
            productSearch.setKeyword(keyword);
        }
        if (price != null) {
            productSearch.setTypePrice(price);
        }

        productSearch.parseRequest(request);

        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("listProduct", productService.search(productSearch));
        model.addAttribute("listCategory", categoryList);
        return "client/listBook";
    }
    // ----------------------------------------------------------
    @RequestMapping(value = { "/bookDetails/{id}" }, method = RequestMethod.GET)
    public String detailsBook(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        Product list = productService.findProductById(id);
        model.addAttribute("list", list);

        Review newReview = new Review();
        newReview.setProduct(list);
        newReview.setRating(5);
        model.addAttribute("review",newReview);
        return "client/detailBook";
    }

    @RequestMapping(value = "/createReview",method = RequestMethod.POST/*, consumes = {"application/json;charset=utf-8"}*/)
    public String saverating(@RequestParam("hdrating") float hdrating,Review review) {
        review.setRating(hdrating);
            reviewRepository.save(review);
        productService.updateRating(review.getProduct().getId());
        return "redirect:/bookDetails/" + review.getProduct().getId();
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

    @RequestMapping(value = { "/wishlist" }, method = RequestMethod.GET)
    public String checkOut(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        HttpSession httpSession = request.getSession();
        SaleOrder saleOrder = new SaleOrder();
        Cart cart = (Cart) httpSession.getAttribute("WISHLIST");
        if(cart == null) {
            return "client/wishlist";
        } else {
            List<CartItem> cartItems = cart.getCartItems();
            BigDecimal sum = new BigDecimal(0);
            String sumVN = null;
            for (CartItem item : cartItems) {
                SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
                saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
                saleOrderProducts.setQuantity(item.getQuantity());
                saleOrder.addSaleOrderProducts(saleOrderProducts);



                for (int i = 1; i <= item.getQuantity(); i++) {
                    sum = sum.add(saleOrderProducts.getProduct().getPromotionalPrice());
                }
                Locale locale = new Locale("vi", "VN");
                NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
                sumVN = fmt.format(sum);
            }
            model.addAttribute("TOTAL", sumVN);
            return "client/wishlist";
        }
    }

    @RequestMapping(value = {"/wishlist"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> muaHang(@RequestBody CartItem data, final ModelMap model,
                                                final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        HttpSession httpSession = request.getSession();

        Cart cart = null;

        if (httpSession.getAttribute("WISHLIST") != null) {
            cart = (Cart) httpSession.getAttribute("WISHLIST");
        } else {
            cart = new Cart();
            httpSession.setAttribute("WISHLIST", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();
        boolean isExists = false;
        int quantity = 0;
        for (CartItem item : cartItems) {
            if (item.getProductId() == data.getProductId()) {
                isExists = true;
                item.setQuantity(item.getQuantity() + data.getQuantity());
            }
        }
        if (!isExists) {

            Product product = productRepo.getOne(data.getProductId());
            data.setProductName(product.getTitle());
            data.setUnitPrice(product.getPromotionalPrice());
            cart.getCartItems().add(data);
        }
        for (CartItem item : cartItems) {
            quantity += item.getQuantity();
        }

        httpSession.setAttribute("SL_SP_WISHLIST", quantity);

        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(quantity)));
    }

    @RequestMapping(value = {
            "/wishlist/delete-product-wishlist-with-ajax/{productId}" }, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> subscribe(@RequestBody CartItem data, @PathVariable("productId") int productId,
                                                  final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {

        HttpSession httpSession = request.getSession();
        Cart cart = null;
        if (httpSession.getAttribute("WISHLIST") != null) {
            cart = (Cart) httpSession.getAttribute("WISHLIST");
        } else {
            cart = new Cart();
            httpSession.setAttribute("WISHLIST", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();

        for (int a = 0; a < cartItems.size(); a++) {
            if (cartItems.get(a).getProductId() == productId) {
                cartItems.remove(a);
            }
        }

        return ResponseEntity.ok(new AjaxResponse(200, "Success"));
    }
}
