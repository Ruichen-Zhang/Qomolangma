<template>
<div :style="background" class="bgBackground">
<div>
    <img src="../assets/img/1.png"  class="a1"><img/>
    <div class="signup">
        <div class="w3_info2">
      
        <el-form :model="registerForm" ref="registerForm" label-width="70px" class="demo-ruleForm" :rules="rules">
            <el-form-item prop="email" label="邮箱">
                <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
            </el-form-item>
            <el-form-item prop="password" label="密码">
                <el-input type="password" v-model="registerForm.password" placeholder="密码"></el-input>
            </el-form-item>
            <el-form-item prop="sex" label="性别">
                <el-radio-group v-model="registerForm.sex">
                    <el-radio :label="0">女</el-radio>
                    <el-radio :label="1">男</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item prop="phoneNum" label="验证码">
                <el-input v-model="registerForm.phoneNum" placeholder="邮箱验证码"  style="width:205px; "></el-input>
                <el-button type="primary" @click="send" style="background-color: #bc0000;border-color: #9146ff;">发送</el-button>
            </el-form-item>
            <el-form-item prop="username" label="用户名">
                <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
            </el-form-item>
            <el-form-item prop="birth" label="生日">
                <el-date-picker v-model="registerForm.birth" placeholder="选择日期" style="width: 100%;"></el-date-picker>
            </el-form-item>
            <el-form-item prop="introduction" label="签名">
                <el-input v-model="registerForm.introduction" placeholder="签名"></el-input>
            </el-form-item>
            <el-form-item prop="location" label="地区">
                <el-select v-model="registerForm.location" placeholder="地区" style="width: 100%;">
                    <el-option v-for=" item in cities" :key="item.value" :label="item.label" :value="item.value"></el-option>
                </el-select>
            </el-form-item>
            <div class="login-btn">
                
                <el-button type="primary" @click="SignUp" class="btn btn-primary btn-block">确定</el-button>
            </div>
        </el-form>
    </div></div>
</div>
</div>
</template>
<script>
import loginLogo from '../components/LoginLogo'
import {rules,cities} from '../assets/data/form'
import {mixin} from '../mixins'
import {SignUp} from '../api/index'
import {send} from '../api/index'

export default {
    name: 'sing-up',
    mixins: [mixin],
    components: {
        loginLogo
    },
    data() {
        return {
            registerForm: {
                username: '',       //用户名
                password: '',       //密码
                sex: '',            //性别
                phoneNum:'',    //手机
                email: '',          //邮箱
                birth: '',          //生日
                introduction: '',   //签名
                location: ''       //地区
            },
            cities: [],            //所有的地区--省
            rules: {}   ,
            background: {
      	// 背景图片地址
        backgroundImage: 'url(' + require('../assets/img/back.png') + ')',
        // 背景图片是否重复
        backgroundRepeat: 'no-repeat',
        // 背景图片大小
        backgroundSize: 'cover',
        // 背景颜色
        backgroundColor: '#000',
        // 背景图片位置
        backgroundPosition: 'center top'
      }            //表单提交的规则
        }        
    },
    created() {
        this.rules = rules;
        this.cities = cities;
    },
    methods:{
        SignUp(){
            let _this = this;
            let d = this.registerForm.birth;
            let datetime = d.getFullYear() + '-' +(d.getMonth() + 1) +'-' + d.getDate();
            let params = new URLSearchParams();
            params.append('username',this.registerForm.username);
            params.append('password',this.registerForm.password);
            params.append('sex',this.registerForm.sex);
            params.append('email',this.registerForm.email);
            params.append('phoneNum',this.registerForm.phoneNum);
            params.append('birth',datetime);
            params.append('introduction',this.registerForm.introduction);
            params.append('location',this.registerForm.location);
            params.append('avator','/img/user.jpg');
            SignUp(params)
                .then(res => {
                    if(res.code == 1){
                        _this.notify('注册成功','success');
                        _this.$store.commit('setLoginIn',true);
                        _this.$store.commit('setUserId',res.userMsg.id);
                        _this.$store.commit('setUsername',res.userMsg.username);
                        _this.$store.commit('setAvator',res.userMsg.avator);                                                
                        setTimeout(function(){
                            _this.changeIndex('首页');
                            _this.$router.push({path: '/'});
                        },2000);
                    }else  if(res.code == 2){
                        _this.notify('验证码错误','error');
                    }else  if(res.code == 4){
                        _this.notify('邮箱已存在','error');
                    }
                    else{ _this.notify('注册失败','error');}
                })
                .catch(err => {
                    _this.notify('注册失败','error');
                })
        },
        goback(index){
            this.$router.go(index);
        },
        send(){
             let _this = this;
           
            let params1 = new URLSearchParams();
            
            params1.append('email',this.registerForm.email);
            send(params1)
                .then(res => {
                    if(res.code == 1){
                        _this.notify('发送成功','success');
                        
                    }else{
                        _this.notify('发送失败','error');
                    }
                })
                .catch(err => {
                    _this.notify('发送失败','error');
                })
        },
        changeIndex(value){
            this.$store.commit('setActiveName',value);
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/sign-up.scss';
</style>