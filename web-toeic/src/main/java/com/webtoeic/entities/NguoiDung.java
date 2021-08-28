package com.webtoeic.entities;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.webtoeic.jpautil.VaiTroTypeConverter;

@Entity
@Table(name = "User")
public class NguoiDung {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String email;

	@JsonIgnore
	private String password;

	@Transient
	@JsonIgnore
	private String confirmPassword;
	private String fullName;
	private String phone;
	private String address;
	private String resetPasswordToken;

	@Transient
	private boolean loginOauth2;

	public boolean isLoginOauth2() {
		return loginOauth2;
	}

	public void setLoginOauth2(boolean loginOauth2) {
		this.loginOauth2 = loginOauth2;
	}

	@Convert(converter = VaiTroTypeConverter.class)
	private Roles roles;

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public NguoiDung(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public NguoiDung() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "NguoiDung [id=" + id + ", email=" + email + ", password=" + password + ", confirmPassword=" + confirmPassword + ", hoTen=" + fullName
				+ ", soDienThoai=" + phone + ", diaChi=" + address + ", vaiTro=" + roles + "]";
	}

}
