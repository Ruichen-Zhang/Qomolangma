<template>
<div :style="background" class="bgBackground">
 
<div class="signinform">
        <h1> </h1>
        <!-- container -->
        <div class="container">
            <!-- main content -->
            <div class="w3l-form-info">
                <div class="w3_info">
                    <h2>登录</h2>
                    
                    <el-form :model="loginForm" ref="loginForm" label-width="70px" class="demo-ruleForm" :rules="rules">
            <el-form-item prop="email" label="邮箱">
                <el-input v-model="loginForm.email" placeholder="邮箱"></el-input>
            </el-form-item>
            <el-form-item prop="password" label="密码">
                <el-input type="password" v-model="loginForm.password" placeholder="密码"></el-input>
            </el-form-item>
            <div class="form-row bottom">
                            <div class="form-check">
                                <input type="checkbox" id="remenber" name="remenber" value="remenber">
                                <label for="remenber"> 记住密码?</label>
                            </div>
                            <a @click="gochange" class="forgot">忘记密码?</a>
                        </div>
           
               
                <el-button type="primary" @click="handleLoginIn" class="btn btn-primary btn-block">登录</el-button>
           
            <p class="continue"><span>其他登录方式</span></p>
                    <div class="social-login">
                        <a href="https://graph.qq.com/oauth2.0/authorize?client_id=100495085&response_type=code&redirect_uri=https://music.163.com/back/qq&forcelogin=true&state=NRTxJdZALQ&checkToken=9ca17ae2e6ffcda170e2e6eea5db7e939da987f661f5ef8fb7c44f868a8a83c14bb08aa3adaa409191b684c42af0feaec3b92aaf959cbbf03e8396fa94c85f938f9bb6d15fa78b8fd2c64d89b1afa8bc53ae91ee9e">
                            <img class="facebook" src="../assets/img/qq.png">
                                

                            <img/>
                        </a>
                        <a href="https://open.weixin.qq.com/connect/qrconnect?appid=wxe280063f5fb2528a&response_type=code&redirect_uri=https://music.163.com/back/weichat&forcelogin=true&scope=snsapi_login&state=toLuDJdBKr&checkToken=9ca17ae2e6ffcda170e2e6eea5db7e939da987f661f5ef8fb7c44f868a8a83c14bb08aa3adaa409191b684c42af0feaec3b92ab7889ca8bc52a6eb87b2b44a878b8fa3c44fa79f8f89c649a59e9c93aa67bca7ee9e&lang=zh_CN#wechat_redirect">
                            <img class="facebook" src="../assets/img/wx.png">
                                

                            <img/>
                        </a>
                        <a href="https://api.weibo.com/oauth2/authorize?client_id=301575942&response_type=code&redirect_uri=http://music.163.com/back/weibo&forcelogin=true&scope=friendships_groups_read,statuses_to_me_read,follow_app_official_microblog&state=yUjpOkRIFH&checkToken=9ca17ae2e6ffcda170e2e6eea5db7e939da987f661f5ef8fb7c44f868a8a83c14bb08aa3adaa409191b684c42af0feaec3b92a8ca6e58bc55c94989c87b44f839e8eb7c14f949f9ad1cb50a58a8788ed61bab4ee9e###">
                            <img class="facebook" src="../assets/img/wb.png">
                                

                            <img/>
                        </a>
                    </div> 
                   
                    <p class="account">没有账号?  <a @click="goSignUp">注册</a></p>
        </el-form>
                   
                </div>
            </div>
            <!-- //main content -->
        </div>
        <!-- //container -->
        <!-- footer -->
        
        <!-- footer -->
    </div></div>
</template>
<script>
import loginLogo from '../components/LoginLogo'
import {mixin} from '../mixins'
import {loginIn} from '../api/index'

export default {
    name: 'login-in',
    mixins: [mixin],
    components: {
        loginLogo
    },
    data() {
        return {
            loginForm: {
                email: '',       //用户名
                password: '',       //密码
            },
            rules: {
                email: [
                    { required: true, trigger: 'blur',message: '请输入邮箱' },
                    { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                ],
                password: [
                    { required: true, trigger: 'blur',message: '请输入密码' }
                ]
            },
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
      }
        }    
    },

    mounted() {
        this.changeIndex('登录');
    },
    methods:{
        handleLoginIn(){
            let _this = this;
            let params = new URLSearchParams();
            params.append('email',this.loginForm.email);
            params.append('password',this.loginForm.password);
            loginIn(params)
                .then(res => {
                    if(res.code == 1){
                        _this.notify('登录成功','success');
                        _this.$store.commit('setLoginIn',true);
                        _this.$store.commit('setUserId',res.userMsg.id);
                        _this.$store.commit('setUsername',res.userMsg.username);
                        _this.$store.commit('setAvator',res.userMsg.avator);                                                
                        setTimeout(function(){
                            _this.changeIndex('首页');
                            _this.$router.push({path: '/'});
                        },2000);
                    }else{
                        _this.notify('邮箱或密码错误','error');
                    }
                })
                .catch(err => {
                    _this.notify('邮箱或密码错误','error');
                })
        },
        goSignUp(){
            this.changeIndex('注册');
            this.$router.push({path: '/sign-up'});
        },
        gochange(){
            this.changeIndex('修改');
            this.$router.push({path: '/change'});
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