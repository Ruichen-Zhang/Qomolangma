<template>
  <body>
	<h1>Music 后台管理登录</h1>
  	<div class="login">
     <header>
	    <h2>Login Now</h2>
	 </header>
	 <div class="sr">
	    <el-form :model="ruleForm" :rules="rules"  ref="ruleForm">
      <el-form-item prop="username">
        <el-input v-model="ruleForm.username" ></el-input>
      </el-form-item>
       <el-form-item prop="password">
        <el-input v-model="ruleForm.password" ></el-input>
      </el-form-item>

      <el-button  class="dl" type="primary" @click="submitForm" >登录</el-button>

      </el-form>
			</div>

  </div>

<h3>Design by Qomolangma</h3>


</body>
</template>

<script>
import { mixin } from "../mixins/index";
import { getLoginStatus } from "../api/index";
export default{
	mixins:[mixin],
  data:function(){
    return {
      ruleForm:{
        username: "admin",
        password:"1"
      },
      rules: {
        username:[
         { required:true,message:"请输入用户名",ttigger:"blur"}
        ],
        password:[
         { required:true,message:"请输入密码",ttigger:"blur"}
        ]
      }
    };
  },
  methods:{
    submitForm(){
      let params=new URLSearchParams();
	  params.append("name",this.ruleForm.username);
	  params.append("password",this.ruleForm.password);
	  getLoginStatus(params)
        .then((res) =>{
          if(res.code == 1){
			  localStorage.setItem('userName',this.ruleForm.username);
            this.$router.push("/Info");
            this.notify("登录成功","success");
          }else{
            this.notify("登录失败","error");
          }
        });
    }

  }
}
</script>

<style scoped>


ol,ul{list-style:none;margin:0px;padding:0px;}

body {
	background:url('../assets/img/background.jpg') no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
    background-position: center;
}

h1 {
    text-align: center;
    font-size: 42px;
    margin-top: 50px;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 5px;
}


input[type="text"],input[type="password"]{
	width:87.5%;
	padding: 15px 50px 15px 10px;
	background: rgba(255, 255, 255, 0.15);
	background:#fff;
	border:none;
	outline:none;
	font-size:14px;
	margin-bottom:20px;
	background: rgb(255, 255, 255) url("../assets/img/user.png") no-repeat -600px 11px;
}


ul li input[type="checkbox"] {
	display: none;
}
ul li input[type="checkbox"]+label {
	position: relative;
	padding-left: 25px;
	border: #F0F8FF;
	color: #FFFFFF;
	display: inline-block;
	font-size: 14px;

}
ul li input[type="checkbox"]+label span:first-child {
	width: 13px;
	height: 13px;
	display: inline-block;
	border: 1px solid #FFFFFF;
	position: absolute;
	top: 1px;
	left: 4px;
	bottom: 4px;
}
ul li input[type="checkbox"]:checked+label span:first-child:before {
	content: "";
	background: url(../assets/img/tick.png ) no-repeat;
	position: absolute;
	left: 2px;
	top: 2px;
	font-size: 10px;
	width: 10px;
	height: 10px;
}




	input[type="text"], input[type="password"] {
		width: 86.5%;
		background: rgb(255, 255, 255) url("../assets/img/user.png") no-repeat 370px 11px;
	}
	input[type="password"]{
		background: rgb(255, 255, 255) url("../assets/img/password.png") no-repeat 370px 11px;
	}








@keyframes cc{
	0%{opacity: 0.4;transform: scale(0.1) ;top: -500px;}
	50%{opacity: 0.4;transform: scale(0.5) rotateX(90deg);top: -250px;}
	90%{opacity: 1;transform: scale(1) rotateX(0deg);top: -75px;}
}

.login{
	height:180px;
	width:405px;
	position: relative;
	top: -75px;
	margin: 15% auto;
	background: no-repeat center center;
	border-radius: 910px;
    color: #27d;
    animation: cc 4s ease-in-out ;
}


.dl{
	background:#BE77FF;
	padding:13px 0;
	font-size:16px;
	color:#fff;
	cursor:pointer;
	outline:none;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
	width:102%;
	border:none;
	margin-top:25px;
}
h1,h2,h3{
	font-family: 'Lato', sans-serif;

}

h2 {
    color: #fff;
	font-size:30px;
	margin-bottom:30px;
}
h3 {
    white-space:nowrap;
    font-size:14px;
	color:#fff;
	text-align: center;
	margin-top:150px;
}


a{
	text-decoration:none;
	color:#fff;
}

.tz{
	text-align: center;
	color:#fff;
}
</style>
