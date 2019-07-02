package com.xcq.service;

import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;

public interface MailSenderSrvServices {
    /*普通格式发送
    * @toAddress 收件人地址
    * @fromAddress 发件人地址
    * @subject 主题
    * @msgBody 正文
    * */
    @Transactional
    void sendEmail(String recipient,String subject,String content);

    /*html格式发送
    * */
    void sendHtmlEmail(String recipient,String subject,String content) throws MessagingException, Exception;

}
