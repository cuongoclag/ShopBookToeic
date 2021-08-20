package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.Roles;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.webtoeic.entities.NguoiDung;

public interface NguoiDungRepository extends JpaRepository<NguoiDung, Long> {

	NguoiDung findByEmail(String email);
	
	Page<NguoiDung> findByRoles(Roles roles, Pageable of);

	List<NguoiDung> findByRoles(Roles roles);

	List<NguoiDung> findAll();
}
