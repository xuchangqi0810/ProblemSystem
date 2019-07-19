package com.xcq.service.impl;

import com.xcq.entity.ApplicationEmail;
import com.xcq.service.MailSenderSrvServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service("MailSenderSrvService")
public class MailSenderSrvServiceImpl implements MailSenderSrvServices {
    @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    private TaskExecutor taskExecutor;

    /**
     *   JavaMailSenderImpl支持MimeMessages和SimpleMailMessages。
     * MimeMessages为复杂邮件模板，支持文本、附件、html、图片等。
     * SimpleMailMessages实现了MimeMessageHelper，为普通邮件模板，支持文本
     */


    /**
     * 描述：Spring 依赖注入
     * @author wanghaoyu
     * @date
     * @version 1.0
     * @param mailSender
     * @since 1.8
     *
     */
    public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }

    /**
     * 单发：同步发送
     *
     */
    @Override
    public void sendEmail(ApplicationEmail email) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1099242331@qq.com");//发件人
            messageHelper.setTo(email.getRecipient());
            messageHelper.setSubject(email.getSubject());
            messageHelper.setText(email.getContent(),true);//true代表支持html格式
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
                e.printStackTrace();
        }


    }

    /**
     * 带抄送：同步发送
     *
     */
    @Override
    public void sendHtmlEmail(ApplicationEmail email) throws MessagingException, Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            messageHelper.setFrom("1099242331@qq.com");//发件人
            messageHelper.setTo(email.getRecipient());
            messageHelper.setSubject(email.getSubject());
            messageHelper.setText(email.getContent(),true);
            mimeMessage.setRecipients(Message.RecipientType.CC,"xuchangqi0810@dingtalk.com");//抄送人
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 单发：异步发送
     *
     */
    @Override
    public void sendHtmlEmailByAsynchronousMode(final ApplicationEmail email) throws MessagingException, Exception {
        taskExecutor.execute(new Runnable() {
            public void run() {
                try {
                    sendHtmlEmail(email);
                } catch (Exception e) {
                }
            }
        });
    }

    /**
     * 带抄送：异步发送
     *
     */
    public void sendMailByAsynchronousMode(final ApplicationEmail email){
        taskExecutor.execute(new Runnable(){
            public void run(){
                try {
                    sendEmail(email);
                } catch (Exception e) {
                }
            }
        });
    }

}
