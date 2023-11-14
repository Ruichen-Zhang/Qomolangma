<template>
    <div>
        <div class="topb">
            <h2>系统管理</h2>
        </div>
        <el-row :gutter="20" class="mgb30"><div class="wt">
            <el-col :span="5">
                <el-card>

                    <div class="grid-content">
                        <ul class="ulst">
                            <li>
                                <img class="img" src="../assets/img/us.png" alt="#" />
                            </li>
                            <li>
                            <div class="grid-cont-center">
                            <div class="grid-num">{{consumerCount}}</div>
                            <div>用户总数</div>
                            </div>
                            </li>
                        </ul>


                    </div>
                </el-card>
            </el-col></div><div class="wt">
            <el-col :span="5">
                <el-card>
                    <div class="grid-content">

                            <ul class="ulst">
                            <li>
                                <img class="img" src="../assets/img/gequ.png" alt="#" />
                            </li>
                            <li>
                                <div class="grid-cont-center">
                                    <div class="grid-num">{{songCount}}</div>
                            <div>章节总数</div>

                            </div>
                            </li>
                        </ul>

                    </div>
                </el-card>
            </el-col></div><div class="wt">
            <el-col :span="5">
                <el-card>
                    <div class="grid-content">
                        <ul class="ulst">
                            <li>
                                <img class="img" src="../assets/img/huatong.png" alt="#" />
                            </li>
                            <li>
                               <div class="grid-cont-center">
                            <div class="grid-num">{{singerCount}}</div>
                            <div>作者数量</div>
                        </div>
                            </li>
                        </ul>

                    </div>
                </el-card>
            </el-col></div><div class="wt">
            <el-col :span="5">
                <el-card>
                    <div class="grid-content">
                        <ul class="ulst">
                            <li>
                                <img class="img" src="../assets/img/gedan.png" alt="#" />
                            </li>
                            <li>
                               <div class="grid-cont-center">
                            <div class="grid-num">{{songListCount}}</div>
                            <div>书籍数量</div>
                        </div>
                            </li>
                        </ul>

                    </div>
                </el-card>
            </el-col></div>
        </el-row>


        <el-row :gutter="20" class="mgb20">
        <div class="rh">
            <el-col :span="12">
                <h3>&nbsp;</h3>
                <div style="background-color:white">
                <h4>用户性别比例</h4>
                    <ve-pie :data="consumerSex" :theme="options"></ve-pie>
                </div>
            </el-col>
            </div>
            <div class="rh">
            <el-col :span="12">
            <h3>&nbsp;</h3>

                <div style="background-color:white">
                <h4>书籍类型分布</h4>
                    <ve-histogram :data="songStyle"></ve-histogram>
                </div>
            </el-col>
            </div>
        </el-row>

    </div>
</template>
<script>
import {getAllConsumer,allSong,getAllSinger,getAllSongList} from '../api/index';
export default {
    data(){
        return {
            consumerCount: 0,       //用户总数
            songCount: 0,           //歌曲总数
            singerCount: 0,         //歌手数量
            songListCount: 0,        //歌单数量
            consumer: [],            //所有用户
            consumerSex:{           //按性别分类的用户数
                columns: ['性别','总数'],
                rows: [
                    {'性别': '男','总数': 0},
                    {'性别': '女','总数': 0}
                ]
            },
            options: {
                color: ['#e91e63','#2096f3']
            },
            options1: {
                color: ['#ff8022']
            },
            songStyle:{           //按歌单风格分类
                columns: ['风格','总数'],
                rows: [
                    {'风格': '经典','总数': 0},
                    {'风格': '网络小说','总数': 0},
                    {'风格': '评书','总数': 0},
                    {'风格': '知识','总数': 0},

                ]
            },
             options2: {
                color: ['#e91e63','#2096f3','#1dd085','#683ab7']
            },
            singerSex:{           //按性别分类的歌手数
                columns: ['性别','总数'],
                rows: [
                    {'性别': '女','总数': 0},
                    {'性别': '男','总数': 0},
                    {'性别': '组合','总数': 0},
                    {'性别': '不明','总数': 0}
                ]
            },
            country:{
                columns: ['国籍','总数'],
                rows: [
                    {'国籍': '中国','总数': 0},
                    {'国籍': '韩国','总数': 0},
                    {'国籍': '日本','总数': 0},
                    {'国籍': '美国','总数': 0},
                    {'国籍': '新加坡','总数': 0},
                    {'国籍': '意大利','总数': 0},
                    {'国籍': '马来西亚','总数': 0},
                    {'国籍': '西班牙','总数': 0}
                ]
            }
        }
    },
    created() {

    },
    mounted() {
        this.getConsumer();
        this.getSong();
        this.getSinger();
        this.getSongList();
    },
    methods: {
        getConsumer() {                     //用户总数
            getAllConsumer().then(res => {
                this.consumer = res;
                this.consumerCount = res.length;
                this.consumerSex.rows[0]['总数'] = this.setSex(1,this.consumer);
                this.consumerSex.rows[1]['总数'] = this.setSex(0,this.consumer);
            })
        },
        setSex(sex,val) {              //根据性别获取用户数
            let count = 0;
            for(let item of val){
                if(sex == item.sex){
                    count++;
                }
            }
            return count;
        },
        getSong() {                      //歌曲总数
            allSong().then(res => {
                this.songCount = res.length;
            })
        },
        getSinger() {                      //歌手数量
            getAllSinger().then(res => {
                this.singerCount = res.length;
                this.singerSex.rows[0]['总数'] = this.setSex(0,res);
                this.singerSex.rows[1]['总数'] = this.setSex(1,res);
                this.singerSex.rows[2]['总数'] = this.setSex(2,res);
                this.singerSex.rows[3]['总数'] = this.setSex(3,res);
                for(let item of res){
                    this.getByCountry(item.location);
                }
            })
        },

        getSongList() {                    //歌单数量
            getAllSongList().then(res => {
                this.songListCount = res.length;
                for(let item of res){
                    this.getByStyle(item.style);
                }
            })
        },
        getByStyle(style) {              //根据歌单风格获取数量
            for(let item of this.songStyle.rows){
                if(style.includes(item['风格'])){
                    item['总数']++;
                }
            }
        },
        getByCountry(location) {              //根据国籍获取数量
            for(let item of this.country.rows){
                if(location.includes(item['国籍'])){
                    item['总数']++;
                }
            }
        }
    }
}

</script>

<style scoped>
.grid-content {
    display: flex;
    align-items: center;
    height: 120px;
    background-color:#ffffff;
    text-align:center;

}

.ulst{
    list-style-type:none;
    padding-left: 70px;
}
.grid-cont-center {
    flex: 1;
    text-align: center;
    font-size: 14px;
    color: darkgray;
}

.grid-num {
    font-size: 30px;
    font-weight: bold;
}

h4 {
    background: #ffffff;
    margin: 0;
    padding: 21px 25px 19px;
    font-weight: 800;
    font-size: 18px;
    color: #000;
    border-bottom: solid #f8f8f8 5px;


}


.rh{


}
.wt{
    padding-left:40px;
    margin-left:100px;
    text-align: center;

}

</style>
