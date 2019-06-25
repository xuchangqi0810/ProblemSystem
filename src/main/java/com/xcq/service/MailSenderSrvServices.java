package com.xcq.service;

import javax.mail.MessagingException;

public interface MailSenderSrvServices {
    /*普通格式发送
    * @toAddress 收件人地址
    * @fromAddress 发件人地址
    * @subject 主题
    * @msgBody 正文
    * */
    void sendEmail(String toAddress, String fromAddress, String subject, String msgBody);

    /*html格式发送
    * */
    void sendHtmlEmail(String toAddress, String fromAddress, String subject, String htmlBody) throws MessagingException, Exception;

}
