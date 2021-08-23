package com.webtoeic.controller.shop;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.webtoeic.entities.AjaxResponse;
import com.webtoeic.entities.Cart;
import com.webtoeic.entities.CartItem;
import com.webtoeic.entities.Product;
import com.webtoeic.entities.SaleOrder;
import com.webtoeic.entities.SaleOrderProducts;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.ProductService;
import com.webtoeic.service.SaleOrderService;

@Controller
public class CartController{

	@Autowired
	ProductRepository productRepo;
	@Autowired
	SaleOrderRepository saleOrderRepo;
	@Autowired
	ProductService productService;
	@Autowired
	SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart/check-out" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession httpSession = request.getSession();
		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		
		if(cart == null) {
			return "client/checkout";
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
					sum = sum.add(saleOrderProducts.getProduct().getPrice());
				}
			}
			model.addAttribute("TOTAL", sum);
			return "client/checkout";
		}		
	}	

	@RequestMapping(value = { "/webtoeic/cart/mua-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> muaHang(@RequestBody CartItem data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		HttpSession httpSession = request.getSession();

		Cart cart = null;

		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
		} else {
			cart = new Cart();
			httpSession.setAttribute("GIO_HANG", cart);
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
			data.setUnitPrice(product.getPrice());
			cart.getCartItems().add(data);
		}
		for (CartItem item : cartItems) {
			quantity += item.getQuantity();
		}

		httpSession.setAttribute("SL_SP_GIO_HANG", quantity);

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(quantity)));
	}

}
