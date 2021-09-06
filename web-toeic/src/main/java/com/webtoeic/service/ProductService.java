package com.webtoeic.service;

import com.webtoeic.common.ProductSearch;
import com.webtoeic.common.Utilities;
import com.webtoeic.entities.Product;
import com.webtoeic.entities.ProductImages;
import com.webtoeic.entities.Review;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.SaleOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Session;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.OptionalDouble;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepo;
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    SaleOrderRepository saleOrderRepo;

    @SuppressWarnings("unchecked")
    public List<Product> search(final ProductSearch productSearch) {
        String jpql = "Select p from Product p where 1=1";
        if (productSearch.getSeoCategory() != null && !productSearch.getSeoCategory().isEmpty()) {
            jpql += " and p.category.seo= '" + productSearch.getSeoCategory() + "'";

        }
        if (productSearch.getSeoProduct() != null && !productSearch.getSeoProduct().isEmpty()) {
            jpql += " and p.seo= '" + productSearch.getSeoProduct() + "'";

        }
        if (productSearch.getKeyword() != null && !productSearch.getKeyword().isEmpty()) {
            jpql += " and p.status= " + productSearch.getStatusProduct() +" and CONCAT(p.title, ' ', p.shortDes, ' ',p.category.seo,' ',p.category.name,' ', p.seo, ' ', p.price) LIKE '%"
                    + productSearch.getKeyword() + "%'";

        }
        if (productSearch.getStatusProduct() == 1) {
            jpql += " and p.status= " + productSearch.getStatusProduct() ;

        }
        if (productSearch.getTypePrice() != null && !productSearch.getTypePrice().isEmpty()) {
            int price = Integer.parseInt(productSearch.getTypePrice());
            if (price == 1) {
                jpql += " and p.status= " + productSearch.getStatusProduct() +" and price >= " + 0 + " and price <= " + 200000;
            }
            if (price == 2) {
                jpql += " and p.status= " + productSearch.getStatusProduct() +" and price >= " + 200000 + " and price <= " + 400000;

            }
            if (price == 3) {
                jpql += " and p.status= " + productSearch.getStatusProduct() +" and price >= " + 400000 + " and price <= " + 600000;

            }
            if (price == 4) {
                jpql += " and p.status= " + productSearch.getStatusProduct() +" and price >= " + 600000 + " and price <= " + 800000;

            }
            if (price == 5) {
                jpql +=" and p.status= " + productSearch.getStatusProduct() + " and price >= " + 800000;
            }
        }
        if (productSearch.getSort() != null && !productSearch.getSort().isEmpty()) {
            jpql += " and p.status= " + productSearch.getStatusProduct() +" order by p.price " + productSearch.getSort();
        }
        Query query = entityManager.createQuery(jpql, Product.class);

        if (productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) { // phân trang
            query.setFirstResult((productSearch.getCurrentPage() - 1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
            query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
        }
        return query.getResultList();
    }

    public List<Product> findProductByStatus() {

        String sql = "select * from tbl_product where status = '1'";
        Query query = entityManager.createNativeQuery(sql, Product.class);
        return query.getResultList();
    }
    public List<Product> findAllProduct(){
        return productRepo.findAll();
    }

    public Product findProductById(int id) {

        String sql = "select * from tbl_product where id = '" + id + "'";
        Query query = entityManager.createNativeQuery(sql, Product.class);
        return (Product) query.getSingleResult();
    }


    @Transactional
    public void updateRating(int productId) {
        List<Review> reviews = productRepo.findById(productId).get().getReviews();
        OptionalDouble rating = reviews.stream().mapToDouble(a -> a.getRating()).average();
        String sql = "update tbl_product set rating = '"+Math.round(rating.getAsDouble())+"' where id = '"+productId+"'";
        //UPDATE `test_spring`.`product` SET `rating`='2' WHERE `id`='2';
//        Query query = sessionFactory.getCurrentSession().createQuery(queryString);
        Query query = entityManager.createNativeQuery(sql, Product.class);
        System.out.println(query);
        query.executeUpdate();
    }


    private boolean isEmptyUploadFile(MultipartFile[] images) {
        if (images == null || images.length <= 0)
            return true;
        if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
            return true;
        return false;
    }

    @Transactional(rollbackOn = Exception.class)
    public void saveProduct(MultipartFile[] images, Product product) throws Exception {
        try {
            product.setSeo(Utilities.createSeoLink(product.getTitle()));

            if (product.getId() != null) { // chỉnh sửa
                // lấy dữ liệu cũ của sản phẩm
                Product productInDb = productRepo.findById(product.getId()).get();

                if (!isEmptyUploadFile(images)) { // nếu admin sửa ảnh sản phẩm
                    // lấy danh sách ảnh của sản phẩm cũ
                    List<ProductImages> productImages = productInDb.getProductImages();
                    // xoá ảnh cũ đi
                    for (ProductImages _images : productImages) {
                        new File("E:\\ShopBookToeic\\web-toeic\\src\\main\\webapp\\resources\\file\\images\\upload\\" + _images.getPath()).delete();
                    }
                    product.clearProductImages();
                } else { // ảnh phải giữ nguyên
                    product.setProductImages(productInDb.getProductImages());
                }

            }
            if (!isEmptyUploadFile(images)) { // nếu admin upload ảnh
                for (MultipartFile image : images) {
                    // Lưu file vào host.
                    image.transferTo(new File(
                            "E:\\ShopBookToeic\\web-toeic\\src\\main\\webapp\\resources\\file\\images\\upload\\" + image.getOriginalFilename()));
                    ProductImages productImages = new ProductImages();
                    productImages.setTitle(image.getOriginalFilename());
                    productImages.setPath(image.getOriginalFilename());

                    // cho quan hệ 1 - n
                    product.addProductImages(productImages);
                }
            }
            productRepo.save(product);
        } catch (Exception e) {
            throw e;
        }
    }


}
