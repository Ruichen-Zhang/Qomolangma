<template>
    <div class="sidebar">
         <div class="sidebar_user_info">
                <div class="user_profle_side">
                                       <div class="user_img"><img class="img-responsive" src="../assets/img/user.jpg" alt="#" /></div>
                                       <div class="user_info">
                                          <h6> {{userName}}  </h6>
                                          <h5>&nbsp;</h5>
                                          <p><span class="online_animation"></span> Online</p>
                                       </div>
                                    </div>
         </div>
         <h4>&nbsp; &nbsp; &nbsp;General</h4>
        <el-menu

            :default-active="onRoutes"
            :collapse="collapse"
            background-color="transparent"
            text-color="#ffffff"
            active-text-color="#20a0ff"

            router
         >
            <template v-for="item in items">
                <template>
                    <el-menu-item :index="item.index" :key="item.index"  >
                         <i :class="item.icon"></i>
                        {{item.title}}
                    </el-menu-item>
                </template>
            </template>
             </el-menu>

    </div>
</template>

<script>
import bus from "../assets/js/bus"
export default {
    data(){
        return{
            collapse: false,
            items:[
                {
                    icon: 'el-icon-document',
                    index: 'Info',
                    title: '系统首页'
                },
                {
                    icon: 'el-icon-document',
                    index: 'Consumer',
                    title: '用户管理'
                },
                {
                    icon: 'el-icon-document',
                    index: 'Singer',
                    title: '作者管理'
                },
                {
                    icon: 'el-icon-document',
                    index: 'SongList',
                    title: '书籍管理'
                },

            ]
        }
    },
    computed:{
        onRoutes(){
            return this.$route.path.replace('/','');
        }
    },
    computed:{
        userName(){
            return localStorage.getItem('userName');
        }},
    created(){
        //通过Bus进行组件间的通信，来折叠侧边栏
        bus.$on('collapse',msg =>{
            this.collapse = msg
        })
    }
}
</script>

<style scoped>
.sidebar {
    min-width: 200px;
    max-width: 200px;
    background-color: #15283c;
    color: #fff;
    transition: all 0.3s;
    position: relative;
    z-index: 11;
    box-shadow: 0 0 3px 0px rgba(0, 0, 0, 0.4);
    float: left;
    width: 100%;
    background-image: url('../assets/img/pattern_h.png');
    position: fixed;
    height: 100%;

}
.sidebar::-webkit-scrollbar{
    width: 0;
}

.sidebar-el-menu:not(.el-menu--collapse){
    width: 150px;

}
.el-menu{
     border:0!important;

}

.sidebar >ul {
    height: 100%;
}
.sidebar_user_info {
    padding: 15px 25px;
    background: #214162;
}


.user_profle_side {
    display: flex;
}


.user_img img {
    border-radius: 100% 100%;
}

.user_info {
    margin: 0 0 0 15px;
    padding-top: 15px;
}

.online_animation {
    width: 12px;
    height: 12px;
    background: #1ed085;
    border-radius: 100%;
    margin-top: 0;
    position: relative;
    top: 1px;
    -webkit-animation: online 2s infinite;

    animation: online 2s infinite
}


@-webkit-keyframes online {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes online {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.user_info p {
    font-size: 13px;
    font-weight: 500;
    color: #1ed085;
    margin: 0;
}

.user_info h6 {
    font-size: 20px;
    font-weight: 500;
    color: #fff;
    letter-spacing: 0;
}

.user_img {
    width: 75px;
    height: 75px;
    float: left;
}

.img-responsive {
    max-width: 100%;
}


span {
    display: inline-block;
}

.sidebar h4 {
    background: #15283c;
    margin: 0;
    padding: 21px 25px 19px;
    font-weight: 500;
    font-size: 18px;
    color: #fff;
    border-bottom: solid #ff5722 1px;

}


h5{
    font-size:4px;
}
</style>
