package com.javaclimb.Qomolangma.service.impl;

import com.javaclimb.Qomolangma.mapper.MailMapper;
import com.javaclimb.Qomolangma.domain.Mail;
import com.javaclimb.Qomolangma.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MailServicelmpl  implements MailService {

    @Autowired
    private MailMapper mailMapper;

    /**
     * 增加
     *
     * @param mail
     */
    @Override
    public boolean insert(Mail mail) {
        return mailMapper.insert(mail)>0;
    }

    /**
     * 修改
     *
     * @param consumer
     */

    /**
     * 删除
     *
     * @param email
     */
    @Override
    public boolean delete(String email) {
        return mailMapper.delete(email)>0;
    }

    /**
     * 根据主键查询整个对象
     *
     * @param id
     */

    /**
     * 查看密码是否正确
     *
     * @param email
     * @param phoneNum
     */
    @Override
    public boolean verifyPassword(String email,String phoneNum) {
        return mailMapper.verifyPassword(email,phoneNum)>0;
    }


}