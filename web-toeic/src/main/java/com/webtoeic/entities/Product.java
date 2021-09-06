package com.webtoeic.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Entity
@Table(name = "tbl_product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
    @Column(name = "id")
    private Integer id; // primary-key

    @Column(name = "created_date", nullable = true)
    private LocalDateTime createdDate;

    @Column(name = "updated_date", nullable = true)
    private LocalDateTime updatedDate;

    @Column(name = "created_by", nullable = true)
    private Integer createdBy;

    @Column(name = "updated_by", nullable = true)
    private Integer updatedBy;

    @Column(name = "status", nullable = false)
    private boolean status;

    @Column(name = "title", length = 500, nullable = false)
    private String title;

    @Column(name = "price", precision = 13, scale = 2, nullable = false)
    private BigDecimal price;

    @Column(name = "promotionalPrice", precision = 13, scale = 2, nullable = false)
    private BigDecimal promotionalPrice;

    @Column(name = "short_description", length = 3000, nullable = false)
    private String shortDes;


    @Column(name = "detail_description", length = 10000, nullable = false)
    private String shortDetails;

//    @Column(name="rating", columnDefinition = "int default 0")
//    private float rating;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<Review> reviews;

    @Transient
    private String priceVN;

    @Transient
    private String promotionalPriceVN;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id") // tên field khoá ngoại
    private Category category;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product"/* tên property product trong class ProductImages */
            , fetch = FetchType.EAGER, orphanRemoval = true)
    private List<ProductImages> productImages = new ArrayList<ProductImages>();

    @Column(name = "seo", nullable = false)
    private String seo;

    /**
     * Thêm ảnh vào sản phẩm.
     *
     * @param _productImages
     */
    public void addProductImages(ProductImages _productImages) {
        _productImages.setProduct(this);
        productImages.add(_productImages);
    }

    public void clearProductImages() {
        for (ProductImages productImages : productImages) {
            productImages.setProduct(null);
        }
        productImages.clear();
    }

    public Product() {
    }

    public Product(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPromotionalPrice() {
        return promotionalPrice;
    }

    public void setPromotionalPrice(BigDecimal promotionalPrice) {
        this.promotionalPrice = promotionalPrice;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public String getShortDetails() {
        return shortDetails;
    }

    public void setShortDetails(String shortDetails) {
        this.shortDetails = shortDetails;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ProductImages> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<ProductImages> productImages) {
        this.productImages = productImages;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

//    public float getRating() {
//        return rating;
//    }
//
//    public void setRating(float rating) {
//        this.rating = rating;
//    }

    @Transient
    public String getPriceVN() {
        Locale locale = new Locale("vi", "VN");
        NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        return fmt.format(price);
    }

    @Transient
    public void setPriceVN(String priceVN) {
        this.priceVN = priceVN;
    }

    @Transient
    public String getPromotionalPriceVN() {
        Locale locale = new Locale("vi", "VN");
        NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        return fmt.format(promotionalPrice);
    }

    @Transient
    public void setPromotionalPriceVN(String promotionalPriceVN) {
        this.promotionalPriceVN = promotionalPriceVN;
    }

}
