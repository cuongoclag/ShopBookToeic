package com.webtoeic.controller.client;

import com.webtoeic.entities.SaleOrder;
import com.webtoeic.service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private SaleOrderService saleOrderService;
    //	---------------------- order User -------------------------------------------

    @RequestMapping(value = { "/orderUser/{id}" }, method = RequestMethod.GET)
    public String OrderUser(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
                            final HttpServletResponse response) throws Exception {
        List<SaleOrder> list = saleOrderService.findSaleOrderByUserId(id);
        model.addAttribute("listOrder", list);
        return "client/orderUser";
    }

    //---------------------Order Details User -------------------------------------
    @RequestMapping(value = { "/orderDetailsUser/{code}"}, method = RequestMethod.GET)
    public String saleOrderProduct(@PathVariable("code") String code,final ModelMap model, final HttpServletRequest request,
                                   final HttpServletResponse response) throws Exception {

        model.addAttribute("saleOrderProducts", saleOrderService.findSaleOrderProductbyCode(code));
        model.addAttribute("saleOrders", saleOrderService.findSaleOrderByCode(code));
        return "client/orderDetailsUser";
    }

// ---------------------And Order Details User -------------------------------------
}
