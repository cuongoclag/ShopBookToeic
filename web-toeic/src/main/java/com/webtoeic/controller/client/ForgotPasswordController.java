package com.webtoeic.controller.client;

import com.webtoeic.common.Utilities;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.NguoiDungNotFoundException;
import com.webtoeic.service.NguoiDungService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class ForgotPasswordController {

    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/forgot_password")
    public String showForgorPasswordForm(Model model){
        model.addAttribute("pageTitle", "Quên Mật Khẩu");
        return "forgot_password_form";
    }

    @PostMapping("/forgot_password")
    public String processForgotPasswordForm(HttpServletRequest request, Model model){
        String email = request.getParameter("email");
        String token = RandomString.make(255);
        if (nguoiDungService.findByEmail(email) == null) {
            model.addAttribute("message", "Email của bạn chưa được đăng ký!");
        }else {
            try {
                nguoiDungService.updateResetPasswordToken(token, email);
                String resetPasswordLink = Utilities.getSiteURL(request) + "/reset_password?token=" + token;
                sendEmail(email, resetPasswordLink);
                model.addAttribute("message", "Chúng tôi đã gửi link reset password qua email của bạn!");
            } catch (NguoiDungNotFoundException ex) {
                model.addAttribute("error", ex.getMessage());
            } catch (UnsupportedEncodingException | MessagingException e) {
                model.addAttribute("error", "Lỗi gửi mail!");
            }
        }
        return "forgot_password_form";
    }

    private void sendEmail(String email, String resetPasswordLink) throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("fastsneakercompany@gmail.com", "CPD ENGLISH Support");
        helper.setTo(email);
        String subject = "Đây là link reset password của bạn";
        String content = "<p>Hello, </p>"
                + "<p>Bạn đã gửi yêu cầu reset password</p>"
                + "<p>Nhấn vào link bên dưới để thay đổi password:</p>"
                + "<p><b><a href=\"" + resetPasswordLink + "\">Thay đổi password</a></b></p>"
                + "<p>Bỏ qua email này nếu bạn nhớ mật khẩu của mình hoặc bạn chưa thực hiện yêu cầu.</p>";

        helper.setSubject(subject);
        helper.setText(content, true);
        mailSender.send(message);
    }

    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value="token") String token, Model model){
        NguoiDung nguoiDung = nguoiDungService.get(token);
        if(nguoiDung == null){
            model.addAttribute("title", "Reset password của bạn");
            model.addAttribute("message", "Token không hợp lệ");
            return "message";
        }
        model.addAttribute("token", token);
        model.addAttribute("pageTitle", "Reset password của bạn");
        return "reset_password_form";
    }

    @PostMapping("/reset_password")
    public String processResetPassword(HttpServletRequest request, Model model){
        String token = request.getParameter("token");
        String password = request.getParameter("password");

        NguoiDung nguoiDung = nguoiDungService.get(token);

        if(nguoiDung == null){
            model.addAttribute("title", "Reset password của bạn");
            model.addAttribute("message", "Token không hợp lệ");

        } else {
            nguoiDungService.updatePassword(nguoiDung, password);
            model.addAttribute("message", "Đổi password thành công");

        }
        return "dangNhap";
    }
}
