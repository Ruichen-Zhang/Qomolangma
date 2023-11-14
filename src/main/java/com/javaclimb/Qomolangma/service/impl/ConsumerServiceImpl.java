package com.javaclimb.Qomolangma.service.impl;

import com.javaclimb.Qomolangma.mapper.ConsumerMapper;
import com.javaclimb.Qomolangma.domain.Consumer;
import com.javaclimb.Qomolangma.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 前端用户service实现类
 */
@Service
public class ConsumerServiceImpl implements ConsumerService {

    @Autowired
    private ConsumerMapper consumerMapper;

    /**
     * 增加
     *
     * @param consumer
     */
    @Override
    public boolean insert(Consumer consumer) {
        return consumerMapper.insert(consumer)>0;
    }

    /**
     * 修改
     *
     * @param consumer
     */
    @Override
    public boolean update(Consumer consumer) {
        return consumerMapper.update(consumer)>0;
    }
    /**
     * 修改
     *
     * @param email
     * @param password
     */
    @Override
    public boolean change(String email,String password) {
        return consumerMapper.change(email,password)>0;
    }

    /**
     * 删除
     *
     * @param id
     */
    @Override
    public boolean delete(Integer id) {
        return consumerMapper.delete(id)>0;
    }

    /**
     * 根据主键查询整个对象
     *
     * @param id
     */
    @Override
    public Consumer selectByPrimaryKey(Integer id) {
        return consumerMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询所有用户
     */
    @Override
    public List<Consumer> allConsumer() {
        return consumerMapper.allConsumer();
    }

    /**
     * 查看密码是否正确
     *
     * @param email
     * @param password
     */
    @Override
    public boolean verifyPassword(String email, String password) {
        return consumerMapper.verifyPassword(email,password)>0;
    }

    /**
     * 根据账号查询
     *
     * @param username
     */
    @Override
    public Consumer getByUsername(String username) {
        return consumerMapper.getByUsername(username);
    }

    @Override
    public Consumer getByEmail(String email) {
        return consumerMapper.getByEmail(email);
    }
}
