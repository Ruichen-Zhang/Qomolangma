package com.javaclimb.Qomolangma.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.Qomolangma.domain.Mail;
import com.javaclimb.Qomolangma.service.MailService;
import com.javaclimb.Qomolangma.common.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/consumer")

public class Mailcontraller {
    @Value("${spring.mail.username}")
    private String from;

    @Autowired
    private MailService mailService;
    @Autowired
    private JavaMailSender javaMailSender;
    @RequestMapping(value = "/send",method = RequestMethod.POST)
    public Object sendemail(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String to = request.getParameter("email").trim();
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);



        String subject="珠穆朗玛";
        message.setSubject(subject);
        String context=String.valueOf((int)(Math.random()*1000) + 1234);
        String text2="您的验证码为："+context+"     (验证码15分钟内有效）";
        message.setText(text2);
        javaMailSender.send(message);
        Mail mail=new Mail();
        mail.setEmail(to);
        mail.setPhoneNum(context);
        boolean flag = mailService.insert(mail);
        if(flag){   //保存成功
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"发送成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"发送失败");
        return jsonObject;

    }
}
