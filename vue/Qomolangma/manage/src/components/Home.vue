<template>
    <div>
        <the-aside></the-aside>
        <the-header></the-header>
        
        <div class="content-box" :class="{'content-collapse':collapse}">
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import TheHeader from './TheHeader';
import TheAside from './TheAside';
import bus from "../assets/js/bus";

export default {
    components:{
        TheHeader,
        TheAside
    },
    data(){
        return {
            collapse: false
        }
    },

}
</script>