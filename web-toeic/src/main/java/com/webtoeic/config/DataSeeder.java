package com.webtoeic.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.Roles;
import com.webtoeic.repository.NguoiDungRepository;

@Component
public class DataSeeder implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private NguoiDungRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		// Admin account
		if (userRepository.findByEmail("admin@gmail.com") == null) {
			NguoiDung admin = new NguoiDung();
			admin.setEmail("admin@gmail.com");
			admin.setPassword(passwordEncoder.encode("123456"));
			admin.setFullName("Admin");
			admin.setPhone("123456789");
			admin.setRoles(Roles.ROLE_ADMIN);
			userRepository.save(admin);
		}

		// Member account
		if (userRepository.findByEmail("member@gmail.com") == null) {
			NguoiDung member = new NguoiDung();
			member.setFullName("Nguyễn Doãn Đại");
			member.setPhone("123456789");
			member.setEmail("member@gmail.com");
			member.setPassword(passwordEncoder.encode("123456"));
			member.setRoles(Roles.ROLE_MEMBER);
			userRepository.save(member);
		}
	}
}
