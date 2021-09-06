package com.webtoeic.service;

import com.webtoeic.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
    @Autowired
    ReviewRepository reviewRepository;

    public void delete(Long id){
        reviewRepository.deleteById(id);
    }
}
