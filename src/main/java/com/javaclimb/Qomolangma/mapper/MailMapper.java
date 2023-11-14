package com.javaclimb.Qomolangma.mapper;

import com.javaclimb.Qomolangma.domain.Mail;
import org.springframework.stereotype.Repository;

/**
 * 前端用户Dao
 */
@Repository
public interface MailMapper {
    /**
     *增加
     */
    public int insert(Mail mail);


    public int delete(String email);


    public int verifyPassword(String email,String phoneNum);

}
















