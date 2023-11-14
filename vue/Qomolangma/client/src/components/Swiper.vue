<template>
    <div class="swiper">

        <el-carousel class="lun_imgs" ref="carousel" @click.native="linkTo" :interval="4000" type="card" height="300px" indicator-position="none">
           <el-carousel-item class="lun_img" v-for="item in imgs" v-bind:key="item.url" >
             <img :src="item.url"/>
           </el-carousel-item>
         </el-carousel>

    </div>
</template>

<script>
import {swiperList} from "../assets/data/swiper";
export default {
    name: "swiper",

     data: function () {
    return {
      platform: 'pc',
      imgs: [
                {url: require('@/assets/img/swiper/1.jpg'), link: '/song-list-album/96'},
                {url: require('@/assets/img/swiper/2.jpg'), link: '/song-list-album/97'},
                {url: require('@/assets/img/swiper/3.jpg'), link: '/search?keywords=歌唱祖国'},
                {url: require('@/assets/img/swiper/4.jpg'), link: '/search?keywords=把一切献给党'},
                {url: require('@/assets/img/swiper/5.jpg'), link: '/search?keywords=我和我的祖国'},
                {url: require('@/assets/img/swiper/6.jpg'), link: '/search?keywords=国际歌'},
                {url: require('@/assets/img/swiper/7.jpg'), link: '/search?keywords=我和我的祖国'},
                {url: require('@/assets/img/swiper/8.jpg'), link: '/search?keywords=万疆'},

             ]
    }
  },


    created () {
        this.swiperList = swiperList;
    },
    methods: {
        linkTo () {
            let activeIndex = this.$refs.carousel.activeIndex
            this.$router.push(this.imgs[activeIndex].link)
        }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/swiper.scss';
</style>
