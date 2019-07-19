package com.xcq.service;

import com.xcq.entity.ApplicationEmail;
import org.springframework.transaction.annotation.Transactional;
import javax.mail.MessagingException;

public interface MailSenderSrvServices {
    /*普通格式发送
    * @recipient 收件人地址
    * @subject 主题
    * @content 正文
    * */
    @Transactional
    void sendEmail(ApplicationEmail email);

    /*带抄送
    * */
    void sendHtmlEmail(ApplicationEmail email) throws MessagingException, Exception;

    void sendHtmlEmailByAsynchronousMode(final ApplicationEmail email) throws MessagingException, Exception;

    void sendMailByAsynchronousMode(final ApplicationEmail email);

}
