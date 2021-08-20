package com.webtoeic.service;

import com.webtoeic.entities.Category;
import com.webtoeic.entities.Test;
import com.webtoeic.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import com.webtoeic.common.Utilities;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepo;
    @PersistenceContext
    protected EntityManager entityManager;

    public Category findCategoryBySeo(final String seo) {

//		String jpql = "Select p from Product p where p.seo = '" + seo + "'";
//		Query query = entityManager.createQuery(jpql, Product.class);

        String sql = "select * from tbl_category where seo = '" + seo + "'";
        Query query = entityManager.createNativeQuery(sql, Category.class);
        return (Category) query.getSingleResult();
    }
    @Transactional(rollbackOn = Exception.class)
    public void saveCategory(Category category) throws Exception {
        try {
            category.setSeo(Utilities.createSeoLinkCategory(category.getName()));

            categoryRepo.save(category);
        } catch (Exception e) {
            throw e;
        }
    }

    public List<Category> findAllCategory(){
        return categoryRepo.findAll();
    }
}
