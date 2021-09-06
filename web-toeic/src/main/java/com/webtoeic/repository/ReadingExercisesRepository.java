package com.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webtoeic.entities.ReadingExercises;

import java.util.List;

public interface ReadingExercisesRepository extends JpaRepository<ReadingExercises, Integer> {
    List<ReadingExercises> findById(int id);
}
