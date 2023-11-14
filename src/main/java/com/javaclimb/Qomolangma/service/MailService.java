package com.javaclimb.Qomolangma.service;

import com.javaclimb.Qomolangma.domain.Mail;

/**
 * 前端用户service接口
 */
public interface MailService {
    /**
     *增加
     */
    public boolean insert(Mail mail);


    public boolean delete(String email);
    /**
     * 查看密码是否正确
     */
    public boolean verifyPassword(String email,String phoneNum);


}
