package com.webtoeic.controller.client;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.webtoeic.entities.Cart;
import com.webtoeic.entities.CartItem;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.PayPal;
import com.webtoeic.entities.SaleOrder;
import com.webtoeic.entities.SaleOrderProducts;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.NguoiDungService;
import com.webtoeic.service.PaypalService;
import com.webtoeic.service.ProductService;
import com.webtoeic.service.SaleOrderService;

@Controller
public class PaypalController {
	@Autowired
	ProductRepository productRepo;
	@Autowired
	SaleOrderRepository saleOrderRepo;
	@Autowired
	ProductService productService;
	@Autowired
	SaleOrderService saleOrderService;

	@Autowired
	PaypalService service;
	
	@Autowired
	private NguoiDungService nguoiDungService;

	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";

	@GetMapping("/paypal")
	public String home() {
		return "client/paypal";
	}

	@PostMapping("/pay")
	public String payment(@ModelAttribute("paypal") PayPal order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
					"http://localhost:8080/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if(link.getRel().equals("approval_url")) {
					return "redirect:"+link.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
		
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	 @GetMapping(value = CANCEL_URL)
	    public String cancelPay() {
	        return "cancel";
	    }
	 
		@ModelAttribute("loggedInUser")
		public NguoiDung loggedInUser() {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			NguoiDung nguoiDung = new NguoiDung();
			if (auth.getClass().isAssignableFrom(OAuth2AuthenticationToken.class)) {
				String principal = auth.getPrincipal().toString();
				String[] part = principal.split(",");
				String name = part[2].split("=")[1];
				nguoiDung.setFullName(name);
				nguoiDung.setLoginOauth2(true);
				return nguoiDung;
			} else {
				return nguoiDungService.findByEmail(auth.getName());
			}
		}

		public NguoiDung getSessionUser(HttpServletRequest request) {
			NguoiDung nguoiDung = (NguoiDung) request.getSession().getAttribute("loggedInUser");
			return nguoiDung;
		}

	    @GetMapping(value = SUCCESS_URL)
	    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
	        try {
	            Payment payment = service.executePayment(paymentId, payerId);
	            if (payment.getState().equals("approved")) {
	            	HttpSession httpSession = request.getSession();
	        		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
	        				Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	        				model.addAttribute("user", getSessionUser(request));
	        		}

	        		SaleOrder saleOrder = new SaleOrder();
	        		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
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
	        		model.addAttribute("quantityCart", cartItems.size());
	        		model.addAttribute("cartItems", cartItems);
	        		model.addAttribute("sumVN", sumVN);
	        		model.addAttribute("sum", sum);
	        		//saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, httpSession);
	                return "client/success";
	            }
	        } catch (PayPalRESTException e) {
	         System.out.println(e.getMessage());
	        }
	        return "redirect:/";
	    }

}