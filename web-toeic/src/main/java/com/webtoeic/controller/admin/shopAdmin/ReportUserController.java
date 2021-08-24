package com.webtoeic.controller.admin.shopAdmin;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.devpro.repositories.UserRepo;
import com.devpro.services.UserService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
public class ReportUserController {
	@Autowired
	private UserRepo userRepo;
	
	@GetMapping("/pdf")
	public ResponseEntity<byte[]> generatePdf() throws FileNotFoundException, JRException {
		JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(userRepo.findAll());
		JasperReport compileReport =  JasperCompileManager.compileReport(new FileInputStream("src/main/resources/jasper/invoice_template.jrxml"));
		
		HashMap<String, Object> map = new HashMap<>();
		JasperPrint report = JasperFillManager.fillReport(compileReport, map, beanCollectionDataSource);
		//JasperExportManager.exportReportToPdfFile(report, "invoice.pdf");
		byte[] data = JasperExportManager.exportReportToPdf(report);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_DISPOSITION,"inline;filename=invoice.pdf");
		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(data);
	}
}
