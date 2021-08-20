package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.Grammar;
@Repository
public interface GrammarRepository extends JpaRepository<Grammar,Integer> {
	List<Grammar> findBygrammarId(int id);

	@Query("select grammar FROM Grammar grammar WHERE grammar.grammarTitle LIKE CONCAT('%',:search,'%')")
	List<Grammar> searchGrammar(@Param("search") String search);
}
