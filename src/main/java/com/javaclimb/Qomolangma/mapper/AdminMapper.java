package com.javaclimb.Qomolangma.mapper;

import org.springframework.stereotype.Repository;

/**
 * 管理员Dao
 */
@Repository
public interface AdminMapper {
    /**
     *验证密码是否正确
     */
    public int verifyPassword(String username,String password);
}
