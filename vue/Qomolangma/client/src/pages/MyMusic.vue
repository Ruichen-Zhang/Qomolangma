<template>
    <div class="my-music">
        <div class="album-slide">
            <div class="album-img">
                <img :src="attachImageUrl(avator)">
            </div>
            <ul class="album-info">
                <li>昵称:{{username}}</li>
                <li>性别:{{userSex}}</li>
                <li>生日：{{birth}}</li>
                <li>故乡：{{location}}</li>
            </ul>
        </div>
        <div class="album-content">
            <div class="album-title">
                个性签名：{{introduction}}
            </div>
            <div class="songs-body">
                <album-content :songList="collectList">
                    <template slot="title">我的收藏</template>
                </album-content>
            </div>
        </div>

          <el-button type="primary" size="mini" @click="centerDialogVisible2 = true" class="button1">上传书籍</el-button>
        <el-button type="primary" size="mini" @click="gocreate" class="button1">书籍管理</el-button>
       <el-dialog title="章节上传" :visible.sync="centerDialogVisible2" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" action="" id="hh">



                <div>
                    <label>章节上传</label>
                    <input type="file" name="file" multiple="multiple">
                </div>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible2 = false">取消</el-button>
                <el-button size="mini" @click="addmSong">确定</el-button>
            </span>
        </el-dialog>
    </div>


</template>s

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getUserOfId,getCollectOfUserId,songOfSongId} from '../api/index';
import AlbumContent from "../components/AlbumContent";

export default {
    name: 'my-music',
    mixins: [mixin],
    components:{
        AlbumContent
    },
    change(){
	this.$forceUpdate();  //强制刷新
},
    data(){
        return {

            avator: '',       //用户头像
            username: '',     //昵称
            userSex: '',      //性别
            birth: '',        //生日
            location: '',     //故乡
            introduction: '', //签名
            collection: [],     //收藏的歌曲列表
            collectList: [],
              singerId: '',               //歌手id
            singerName: '',             //歌手名

             centerDialogVisible2: false,//添加弹窗是否显示

            registerForm:{      //添加框
                name: '',
                singerName: '',
                introduction: '',
                lyric: ''
            },
             form:{      //编辑框
                id: '',
                name: '',
                introduction: '',
                lyric: ''
            },
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'userId',           //当前登录用户id
        ])
    },
    mounted(){
        this.getMsg(this.userId);
        this.getCollection(this.userId);
    },
    methods:{
        getMsg(userId){
            getUserOfId(userId)
                .then(res =>{
                    this.avator = res.avator;
                    this.username = res.username;
                    if(res.sex==0){
                        this.userSex = '女';
                    }else if (res.sex==1){
                        this.userSex = '男';
                    }
                    this.birth = this.attachBirth(res.birth);
                    this.location = res.location;
                    this.introduction = res.introduction;
                })
                .catch(err => {
                    console.log(err);
                })
        },
        //获取我的收藏列表
        getCollection(userId){
            getCollectOfUserId(userId)
                .then(res =>{
                        this.collection = res;
                        //通过歌曲id获取歌曲信息
                        for(let item of this.collection){
                            this.getSongsOfIds(item.songId);
                        }
                    })
                .catch(err => {
                    console.log(err);
                })
        },
        //通过歌曲id获取歌曲信息
        getSongsOfIds(id){
            songOfSongId(id)
                .then(res =>{
                        this.collectList.push(res);
                    })
                .catch(err => {
                    console.log(err);
                })
        },
        addmSong(){
            let _this = this;
            var form = new FormData(document.getElementById('hh'));
            form.append('singerId',1001);


            form.set('name',"");

            var req = new XMLHttpRequest();
            req.onreadystatechange = function(){
                //req.readyState == 4 获取到返回的完整数据
                //req.status == 200 和后台正常交互完成
                if(req.readyState == 4 && req.status == 200){
                    let res = JSON.parse(req.response);
                    if(res.code){
                        _this.getData();
                        _this.registerForm = {};
                        _this.notify(res.msg,'success');
                    }else{
                         _this.notify('保存失败','error');
                    }
                }
            }
            req.open('post',`http://localhost:8888/song/addm2`,false);
            req.send(form);
             _this.notify('保存成功','success');
            _this.centerDialogVisible2 = false;

        },
        beforeSongUpload(file){
            var testMsg = file.name.substring(file.name.lastIndexOf('.') + 1);
            if(testMsg!='mp3'){
                this.$message({
                    message: '上传文件只能是mp3格式',
                    type: 'error'
                });
                return false;
            }
            return true;
        },
        //上传歌曲成功之后要做的工作
        handleSongSuccess(res){
            let _this = this;
            if(res.code == 1){
                _this.getData();
                _this.$notify({
                    title: '上传成功',
                    type: 'success'
                });
            }else{
                _this.$notify({
                    title: '上传失败',
                    type: 'error'
                });
            }
        },
        //更新歌曲url
        uploadSongUrl(id){
            return `${this.$store.state.HOST}/song/updateSongUrl?id=${id}`
        },
        gocreate(){
            this.changeIndex('修改');
            this.$router.push({path: '/listvue'});
        },
         changeIndex(value){
            this.$store.commit('setActiveName',value);
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>
