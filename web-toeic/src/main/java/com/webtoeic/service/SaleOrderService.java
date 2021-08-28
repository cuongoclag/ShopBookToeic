package com.webtoeic.service;

import com.webtoeic.entities.Cart;
import com.webtoeic.entities.CartItem;
import com.webtoeic.entities.SaleOrder;
import com.webtoeic.entities.SaleOrderProducts;
import com.webtoeic.repository.NguoiDungRepository;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.SaleOrderProductRepository;
import com.webtoeic.repository.SaleOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Properties;

@Service
public class SaleOrderService {
    @Autowired
    ProductRepository productRepo;
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    SaleOrderRepository saleOrderRepo;

    //Không @Autowired đc. Luu ý
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    SaleOrderProductRepository saleOrderProductsRepo;
    @Autowired
    NguoiDungRepository userRepo;

    public List<SaleOrderProducts> findOrderProductByOrderId(int id) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_saleorder_products where saleorder_id = " + id;
        Query query = entityManager.createNativeQuery(sql, SaleOrderProducts.class);
        return query.getResultList();
    }

    public SaleOrder findSaleOrderById(int id) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_saleorder where id = " + id;
        Query query = entityManager.createNativeQuery(sql, SaleOrder.class);
        return (SaleOrder) query.getSingleResult();
    }
    public SaleOrder findSaleOrderByCode(String code) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_saleorder where code = '" + code + "'";
        Query query = entityManager.createNativeQuery(sql, SaleOrder.class);
        return (SaleOrder) query.getSingleResult();
    }
    public List<SaleOrderProducts> findSaleOrderProductbyCode(String code) {

        String sql = "select * from tbl_saleorder_products where saleorder_id = (select id from tbl_saleorder where code='" + code
                + "')";
        Query query = entityManager.createNativeQuery(sql, SaleOrderProducts.class);
        return query.getResultList();
    }
    public List<SaleOrder> findSaleOrderByUserId(int id) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_saleorder where user_id = " + id;
        Query query = entityManager.createNativeQuery(sql, SaleOrder.class);
        return query.getResultList();
    }

    @Transactional(rollbackOn = Exception.class)
    public void saveSaleOrder(SaleOrder saleOrder) throws Exception {

        try {
            saleOrder.setStatus(false);
            saleOrderRepo.save(saleOrder);
        } catch (Exception e) {
            throw e;
        }
    }
    // gửi email khi đặt hàng xong
    @Transactional(rollbackOn = Exception.class)
    public void sendEmail(SaleOrder saleOrder, List<CartItem> cartItems)
            throws UnsupportedEncodingException, MessagingException {

        String subject = "Thông báo xác nhận đơn hàng";
        String senderName = "CPD ENGLSH";
        String mailContent = "<p> Dear " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<h2> Thông tin đơn hàng " + saleOrder.getCode() + "</h2>";

        for (CartItem cartItem : cartItems) {
            mailContent += "<p> " + cartItem.getProductName() + " X " + cartItem.getQuantity()
                    + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + cartItem.getUnitPriceVN()
                    + "</p>";
        }
        mailContent += "<h4> Tổng Cộng:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                + saleOrder.getTotalVN() + "</h4>";
        mailContent += "<p>-------------------------------------------------------------</p>";
        mailContent += "<h2> Thông tin khách hàng </h2>";
        mailContent += "<p> Tên Khách Hàng: " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<p> Số điện thoại liên lạc: " + saleOrder.getCustomerPhone() + "</p>";
        mailContent += "<p> Địa chỉ: " + saleOrder.getCustomerAddress() + "</p>";
        mailContent += "<p> Phương thức thanh toán: Thanh toán khi nhận hàng</p>";
        mailContent += "<p>Cám ơn bạn đã mua hàng!</p>";
        mailContent += "<p>CPD ENGLISH</p>";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable","true");

        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("fastsneakercompany@gmail.com", senderName);
        helper.setTo(saleOrder.getCustomerEmail());
        helper.setSubject(subject);
        helper.setText(mailContent, true);
        mailSender.send(message);
    }

    @Transactional(rollbackOn = Exception.class)
    public void saveOrderProduct(String customerAddress, String customerName, String customerPhone,
                                 String customerEmail, Long user , HttpSession httpSession) throws Exception {
        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setCode("ORDER-" + System.currentTimeMillis());
        saleOrder.setSeo("ORDER-" + System.currentTimeMillis());
        saleOrder.setCustomerName(customerName);
        saleOrder.setCustomerAddress(customerAddress);
        saleOrder.setCustomerPhone(customerPhone);
        saleOrder.setCustomerEmail(customerEmail);
        saleOrder.setNguoiDung(userRepo.getById(user));
        saleOrder.setStatus(true);
        saleOrder.setPayment("Thanh toan sau");

        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
        List<CartItem> cartItems = cart.getCartItems();

        BigDecimal sum = new BigDecimal(0);
        for (CartItem item : cartItems) {
            SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
            saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
            saleOrderProducts.setQuantity(item.getQuantity());
            saleOrder.addSaleOrderProducts(saleOrderProducts);
            saleOrderProducts.setStatus(true);
            for (int i = 1; i <= item.getQuantity(); i++) {
                sum = sum.add(saleOrderProducts.getProduct().getPromotionalPrice());
            }
        }
        saleOrder.setCreatedDate(java.time.LocalDateTime.now());
        saleOrder.setTotal(sum);
        saleOrderRepo.save(saleOrder);
        sendEmail(saleOrder, cartItems);
        httpSession.setAttribute("SL_SP_GIO_HANG", 0);
        httpSession.setAttribute("GIO_HANG", null);
    }

    @Transactional(rollbackOn = Exception.class)
    public void sendEmailPaypal(SaleOrder saleOrder, List<CartItem> cartItems)
            throws UnsupportedEncodingException, MessagingException {

        String subject = "Thông báo xác nhận đơn hàng";
        String senderName = "CPD ENGLISH";
        String mailContent = "<p> Dear " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<h2> Thông tin đơn hàng" + saleOrder.getCode() + "</h2>";

        for (CartItem cartItem : cartItems) {
            mailContent += "<p> " + cartItem.getProductName() + " X " + cartItem.getQuantity()
                    + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + cartItem.getUnitPriceVN()
                    + "</p>";
        }
        mailContent += "<h4> Tổng Cộng:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                + saleOrder.getTotalVN() + "</h4>";
        mailContent += "<p>-------------------------------------------------------------</p>";
        mailContent += "<h2> Thông tin khách hàng </h2>";
        mailContent += "<p> Tên Khách Hàng: " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<p> Số điện thoại liên lạc: " + saleOrder.getCustomerPhone() + "</p>";
        mailContent += "<p> Địa chỉ: " + saleOrder.getCustomerAddress() + "</p>";
        mailContent += "<p> Phương thức thanh toán: Thanh Toán PayPal</p>";
        mailContent += "<p>Cám ơn bạn đã mua hàng!</p>";
        mailContent += "<p>CPD ENGLISH</p>";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("fastsneakercompany@gmail.com", senderName);
        helper.setTo(saleOrder.getCustomerEmail());
        helper.setSubject(subject);
        helper.setText(mailContent, true);

        mailSender.send(message);
    }

    @Transactional(rollbackOn = Exception.class)
    public void saveOrderProductPayPal(String customerAddress, String customerName, String customerPhone,
                                       String customerEmail, Long user , HttpSession httpSession) throws Exception {
        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setCode("ORDER-" + System.currentTimeMillis());
        saleOrder.setSeo("ORDER-" + System.currentTimeMillis());
        saleOrder.setCustomerName(customerName);
        saleOrder.setCustomerAddress(customerAddress);
        saleOrder.setCustomerPhone(customerPhone);
        saleOrder.setCustomerEmail(customerEmail);
        saleOrder.setNguoiDung(userRepo.getById(user));
        saleOrder.setStatus(true);
        saleOrder.setPayment("paypal");

        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
        List<CartItem> cartItems = cart.getCartItems();

        BigDecimal sum = new BigDecimal(0);

        for (CartItem item : cartItems) {
            SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
            saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
            saleOrderProducts.setQuantity(item.getQuantity());
            saleOrder.addSaleOrderProducts(saleOrderProducts);
            saleOrderProducts.setStatus(true);
            for (int i = 1; i <= item.getQuantity(); i++) {
                sum = sum.add(saleOrderProducts.getProduct().getPromotionalPrice());
            }

        }
        saleOrder.setCreatedDate(java.time.LocalDateTime.now());
        saleOrder.setTotal(sum);
        saleOrderRepo.save(saleOrder);
        //sendEmailPaypal(saleOrder, cartItems);
        httpSession.setAttribute("SL_SP_GIO_HANG", 0);
        httpSession.setAttribute("GIO_HANG", null);
    }

    @Transactional(rollbackOn = Exception.class)
    public void sendEmailQR(SaleOrder saleOrder, List<CartItem> cartItems)
            throws UnsupportedEncodingException, MessagingException {

        String subject = "Thông báo xác nhận đơn hàng";
        String senderName = "CPD ENGLSH";
        String mailContent = "<p> Dear " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<h2> Thông tin đơn hàng " + saleOrder.getCode() + "</h2>";

        for (CartItem cartItem : cartItems) {
            mailContent += "<p> " + cartItem.getProductName() + " X " + cartItem.getQuantity()
                    + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + cartItem.getUnitPriceVN()
                    + "</p>";
        }
        mailContent += "<h4> Tổng Cộng:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                + saleOrder.getTotalVN() + "</h4>";
        mailContent += "<p>-------------------------------------------------------------</p>";
        mailContent += "<h2> Thông tin khách hàng </h2>";
        mailContent += "<p> Tên Khách Hàng: " + saleOrder.getCustomerName() + "</p>";
        mailContent += "<p> Số điện thoại liên lạc: " + saleOrder.getCustomerPhone() + "</p>";
        mailContent += "<p> Địa chỉ: " + saleOrder.getCustomerAddress() + "</p>";
        mailContent += "<p> Phương thức thanh toán: Thanh toán qua mã QR</p>";
        mailContent += "<p>Cám ơn bạn đã mua hàng!</p>";
        mailContent += "<p>CPD ENGLISH</p>";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable","true");

        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("fastsneakercompany@gmail.com", senderName);
        helper.setTo(saleOrder.getCustomerEmail());
        helper.setSubject(subject);
        helper.setText(mailContent, true);
        mailSender.send(message);
    }

    @Transactional(rollbackOn = Exception.class)
    public void saveOrderProductQR(String customerAddress, String customerName, String customerPhone,
                                 String customerEmail, Long user , String fileName , HttpSession httpSession) throws Exception {
        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setCode("ORDER-" + System.currentTimeMillis());
        saleOrder.setSeo("ORDER-" + System.currentTimeMillis());
        saleOrder.setCustomerName(customerName);
        saleOrder.setCustomerAddress(customerAddress);
        saleOrder.setCustomerPhone(customerPhone);
        saleOrder.setCustomerEmail(customerEmail);
        saleOrder.setNguoiDung(userRepo.getById(user));
        saleOrder.setStatus(true);
        saleOrder.setPayment(fileName);

        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
        List<CartItem> cartItems = cart.getCartItems();

        BigDecimal sum = new BigDecimal(0);
        for (CartItem item : cartItems) {
            SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
            saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
            saleOrderProducts.setQuantity(item.getQuantity());
            saleOrder.addSaleOrderProducts(saleOrderProducts);
            saleOrderProducts.setStatus(true);
            for (int i = 1; i <= item.getQuantity(); i++) {
                sum = sum.add(saleOrderProducts.getProduct().getPromotionalPrice());
            }
        }
        saleOrder.setCreatedDate(java.time.LocalDateTime.now());
        saleOrder.setTotal(sum);
        saleOrderRepo.save(saleOrder);
        //sendEmailQR(saleOrder, cartItems);
        httpSession.setAttribute("SL_SP_GIO_HANG", 0);
        httpSession.setAttribute("GIO_HANG", null);
    }
}
