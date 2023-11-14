<template>
<div :style="background" class="bgBackground">

<div class="signinform">
        <h1> </h1>
        <!-- container -->
        <div class="container">
            <!-- main content -->
            <div class="w3l-form-info">
                <div class="w3_info">
                    <h2>修改密码</h2>

                    <el-form :model="loginForm" ref="loginForm" label-width="70px" class="demo-ruleForm" :rules="rules">
            <el-form-item prop="email" label="邮箱">
                 <el-input v-model="loginForm.email" placeholder="邮箱"></el-input>
             </el-form-item>
            <el-form-item prop="phoneNum" label="验证码">
                 <el-input v-model="loginForm.phoneNum" placeholder="邮箱验证码"  style="width:205px; "></el-input>
                    <el-button type="primary" @click="send" style="background-color: #9146ff;border-color: #9146ff;">发送</el-button>
            </el-form-item>
            <el-form-item label="新密码" prop="newPwd">
            <el-input v-model="loginForm.newPwd" clearable size="small" type="password" placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-form-item label="新密码" prop="confirmPwd">
            <el-input v-model="loginForm.confirmPwd" clearable size="small" type="password" placeholder="请再次输入密码"></el-input>
            </el-form-item>


                <el-button type="primary" @click="change" class="btn btn-primary btn-block">修改密码</el-button>


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
import {send,change} from '../api/index'

export default {
    name: 'login-in',
    mixins: [mixin],
    components: {
        loginLogo
    },
    data() {
        var validatePass = (rule, value, callback) => {
        if (value === '') {
            callback(new Error('请输入密码'));
        } else {
            if (this.loginForm.confirmPwd !== '') {
                this.$refs.loginForm.validateField('confirmPwd');
            }
             callback();
        }
     };
    var validatePass2 = (rule, value, callback) => {
        if (value === '') {
            callback(new Error('请再次输入密码'));
         } else if (value !== this.loginForm.newPwd) {
            callback(new Error('两次输入密码不一致!'));
        } else {
             callback();
         }
     };
        return {
            changePwdDialog:false,
            loginForm: {
                email: '',
                phoneNum:''   ,   //用户名
                newPwd: '',
                confirmPwd:''  ,    //密码
            },
            rules: {
                email: [
                    { required: true, trigger: 'blur',message: '请输入邮箱' },
                    { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                ],

                phoneNum: [
                {required: true, message: '请输入验证码', trigger: 'blur' }
                 ],
                newPwd: [
                { required: true, message: '请输入密码', trigger: 'blur' },
                { min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur' },
                { validator: validatePass, trigger: 'blur' }
                ],
                confirmPwd:[
                { required: true, message: '请确认密码', trigger: 'blur' },

                { validator: validatePass2, trigger: 'blur', required: true }
                ],

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
        this.changeIndex('修改');
    },
    methods:{
       change(){
            let _this = this;
            let params = new URLSearchParams();
            params.append('email',this.loginForm.email);
            params.append('phoneNum',this.loginForm.phoneNum);
            params.append('confirmPwd',this.loginForm.confirmPwd);
            change(params)
                .then(res => {
                    if(res.code == 1){
                        _this.notify('修改成功','success');
                        _this.$store.commit('setLoginIn',true);
                        _this.$store.commit('setUserId',res.userMsg.id);
                        _this.$store.commit('setUsername',res.userMsg.username);
                        _this.$store.commit('setAvator',res.userMsg.avator);
                        setTimeout(function(){
                            _this.changeIndex('首页');
                            _this.$router.push({path: '/'});
                        },2000);
                    }else{
                        _this.notify('z错误','error');
                    }
                })
                .catch(err => {
                    _this.notify('错误','error');
                })
        },

        send(){
             let _this = this;

            let params1 = new URLSearchParams();

            params1.append('email',this.loginForm.email);
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
