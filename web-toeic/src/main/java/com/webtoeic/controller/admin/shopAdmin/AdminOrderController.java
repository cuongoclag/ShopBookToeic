package com.webtoeic.controller.admin.shopAdmin;

import com.webtoeic.entities.AjaxResponse;
import com.webtoeic.entities.SaleOrder;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminOrderController {
    @Autowired
    public SaleOrderRepository saleOrderRepo;

    @Autowired
    public SaleOrderService saleOrderService;

    @RequestMapping(value = { "/admin/list-order" }, method = RequestMethod.GET)
    public String listOrder(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        model.addAttribute("saleOrders", saleOrderRepo.findAll());
        return "admin/ListOrder";
    }
    @RequestMapping(value = { "/admin/view-order/{id}" }, method = RequestMethod.GET)
    public String viewListProductOrder(final ModelMap model, @PathVariable("id") int id,
                                       final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        model.addAttribute("saleOrder", saleOrderService.findSaleOrderById(id));
        model.addAttribute("saleOrderProduct", saleOrderService.findOrderProductByOrderId(id));
        return "admin/ViewOrder";
    }

    @RequestMapping(value = { "/admin/list-order/delete-saleOrder-with-ajax/{id}" }, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> subscribe(@PathVariable("id") int id, final ModelMap model,
                                                  final HttpServletRequest request, final HttpServletResponse response) throws Exception {

        SaleOrder saleOrders = saleOrderService.findSaleOrderById(id);
        saleOrders.setStatus(false);
        saleOrderRepo.save(saleOrders);
        return ResponseEntity.ok(new AjaxResponse(200, "SUCCESS"));
    }
}
