package com.webtoeic.controller.client;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webtoeic.entities.*;
import com.webtoeic.service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.ProductService;
import com.webtoeic.service.SaleOrderService;
import org.springframework.web.multipart.MultipartFile;

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

	@Autowired
	private NguoiDungService nguoiDungService;
	
	private static final String QR_CODE_IMAGE_PATH = "C:\\Users\\ACER\\Documents\\workspace-spring-tool-suite-4-4.11.0.RELEASE\\ShopBookToeic\\web-toeic\\src\\main\\webapp\\resources\\file\\images\\QRCode.png";
	
	@RequestMapping(value = { "/cart/check-out" }, method = RequestMethod.GET)
	public String checkOut(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
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
					sum = sum.add(saleOrderProducts.getProduct().getPromotionalPrice());
				}
				Locale locale = new Locale("vi", "VN");
				NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
				sumVN = fmt.format(sum);
			}
			model.addAttribute("TOTAL", sumVN);
			return "client/checkout";
		}		
	}

	@RequestMapping(value = "/cart/check-out/update", method = RequestMethod.POST)
	public String update(@RequestParam("quantities") int[] quantities, HttpSession httpSession) {
		Cart cart = null;
		
		if(httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
			List<CartItem> cartItems = cart.getCartItems();
			for(int i = 0; i < cartItems.size(); i++) {
				cartItems.get(i).setQuantity(quantities[i]);
			}
			
			httpSession.setAttribute("GIO_HANG", cart);
		}

		return "redirect:/cart/check-out";
	}

	@RequestMapping(value = {
			"/cart/check-out/delete-product-cart-with-ajax/{productId}" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> subscribe(@RequestBody CartItem data, @PathVariable("productId") int productId,
												  final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Cart cart = null;
		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
		} else {
			cart = new Cart();
			httpSession.setAttribute("GIO_HANG", cart);
		}

		List<CartItem> cartItems = cart.getCartItems();

		for (int a = 0; a < cartItems.size(); a++) {
			if (cartItems.get(a).getProductId() == productId) {
				cartItems.remove(a);
			}
		}

		return ResponseEntity.ok(new AjaxResponse(200, "Success"));
	}

	@RequestMapping(value = {"/cart/mua-hang"}, method = RequestMethod.POST)
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
			data.setUnitPrice(product.getPromotionalPrice());
			cart.getCartItems().add(data);
		}
		for (CartItem item : cartItems) {
			quantity += item.getQuantity();
		}

		httpSession.setAttribute("SL_SP_GIO_HANG", quantity);

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(quantity)));
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

	@RequestMapping(value = { "/cart/finish" }, method = RequestMethod.POST)
	public String finish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				model.addAttribute("user", getSessionUser(request));
//				model.addAttribute("customerName", ((NguoiDung) principal).getFullName());
//				model.addAttribute("customerAddress", ((NguoiDung) principal).getAddress());
//				model.addAttribute("customerPhone", ((NguoiDung) principal).getPhone());
//				model.addAttribute("customerEmail", ((NguoiDung) principal).getEmail());
			} else {
				return "dangNhap";
			}
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
		return "client/finish";
	}


	@RequestMapping(value = { "/cart/thankyou" }, method = RequestMethod.POST)
	public String thankyou(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;
		Long userId = null;
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
		NguoiDung currentUser = getSessionUser(request);
		customerPhone = currentUser.getPhone();
		customerAddress = currentUser.getAddress();
		customerName = currentUser.getFullName();
		customerEmail = currentUser.getEmail();
		userId = currentUser.getId();
		saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, userId, httpSession);
		return "client/thankyou";
	}
	
	@RequestMapping(value = { "/paypal" }, method = RequestMethod.POST)
	public String paypal(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				model.addAttribute("user", getSessionUser(request));	
			}
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
		return "client/paypal";
	}

	@RequestMapping(value = { "/cart/thankyouPayPal" }, method = RequestMethod.POST)
	public String thankyouPayPal(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;
		Long userId = null;
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
		NguoiDung currentUser = getSessionUser(request);
		customerPhone = currentUser.getPhone();
		customerAddress = currentUser.getAddress();
		customerName = currentUser.getFullName();
		customerEmail = currentUser.getEmail();
		userId = currentUser.getId();
		saleOrderService.saveOrderProductPayPal(customerAddress, customerName, customerPhone, customerEmail, userId, httpSession);
		return "client/thankyouPayPal";
	}
	
	@RequestMapping(value = { "/qrpayment" }, method = RequestMethod.POST)
	public String qrpayment(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				model.addAttribute("user", getSessionUser(request));	
			}
		}

		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart)
 		httpSession.getAttribute("GIO_HANG");
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
		QRCodeGenerator.generateQRCodeImage("Thanh toán thành công ví QRCode tổng giá tiền là "+ sumVN, 350, 350, QR_CODE_IMAGE_PATH);
        model.addAttribute("qrcode","http://localhost:8080/resources/file/images/QRCode.png");
		//saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, httpSession);
		return "client/qrpayment";
	}

	@RequestMapping(value = { "/cart/thankyouQR" }, method = RequestMethod.POST)
	public String thankyouQR(@RequestParam("images") MultipartFile images, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;
		Long userId = null;
		String fileName = StringUtils.cleanPath(images.getOriginalFilename());
		images.transferTo(new File(
				"C:\\Users\\ACER\\Documents\\workspace-spring-tool-suite-4-4.11.0.RELEASE\\ShopBookToeic\\web-toeic\\upload\\" + images.getOriginalFilename()));

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
		NguoiDung currentUser = getSessionUser(request);
		customerPhone = currentUser.getPhone();
		customerAddress = currentUser.getAddress();
		customerName = currentUser.getFullName();
		customerEmail = currentUser.getEmail();
		userId = currentUser.getId();
		saleOrderService.saveOrderProductQR(customerAddress, customerName, customerPhone, customerEmail, userId, fileName, httpSession);

		return "client/thankyouQR";
	}
}
