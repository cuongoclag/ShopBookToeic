package com.webtoeic.validator;

import com.webtoeic.entities.Product;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.math.BigDecimal;


@Component
public class productValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Product product = (Product) target;
        BigDecimal min = new BigDecimal(0);
        BigDecimal max = new BigDecimal(2000000);

        if (product.getPrice().compareTo(min) < 0 || product.getPrice().compareTo(max) > 0   ) {
            errors.rejectValue("price", "error.price", "Giá từ 0 -> 2.000.000 đ.");
        }

        if (product.getPromotionalPrice().compareTo(min) < 0 || product.getPromotionalPrice().compareTo(max) > 0  ) {
            errors.rejectValue("promotionalPrice", "error.promotionalPrice", "Giá từ 0 -> 2.000.000 đ.");
        }

        if (product.getShortDes().length() > 3000) {
            errors.rejectValue("shortDes", "error.shortDes", "Độ dài nhỏ hơn 3000 ký tự");
        }
        if (product.getShortDes().length() > 10000) {
            errors.rejectValue("shortDetails", "error.shortDetails", "Độ dài nhỏ hơn 10000 ký tự");
        }
    }
}
