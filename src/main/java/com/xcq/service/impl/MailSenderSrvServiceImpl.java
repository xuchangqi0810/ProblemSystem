package com.xcq.service.impl;

import com.xcq.service.MailSenderSrvServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.util.Date;

@Service("MailSenderSrvService")
public class MailSenderSrvServiceImpl implements MailSenderSrvServices {
    @Autowired
    private JavaMailSender mailSender;
    @Override
    public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(fromAddress);
        simpleMailMessage.setTo(toAddress);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(msgBody);
        mailSender.send(simpleMailMessage);
    }

    @Override
    public void sendHtmlEmail(String toAddress, String fromAddress, String subject, String htmlBody) throws Exception {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, "gb2312");
        helper.setTo(toAddress);
        helper.setSentDate(new Date());
        helper.setFrom(fromAddress);
        message.setContent(htmlBody,"text/html;charset=gb2312");
        message.setSubject(subject);
        mailSender.send(message);
    }

    public JavaMailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
}
