<template>
    <div class="table">
        <div class="topb">
            <h2>章节信息</h2>
        </div>
        <div class="container">
            <div class="handle-box">
                <el-button type="primary" size="mini" @click="delAll" class="button1">批量删除</el-button>
                <el-input v-model="select_word" size="mini" placeholder="请输入章节名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" class="button1">添加章节</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible2 = true" class="button1">批量添加</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="data" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="章节图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="song-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <div class="play" @click="setSongUrl(scope.row.url,scope.row.name)">
                        <div v-if="toggle == scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-zanting"></use>
                            </svg>
                        </div>
                        <div v-if="toggle != scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-bofanganniu"></use>
                            </svg>
                        </div>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="作者-章节" width="120" align="center"></el-table-column>
            <el-table-column prop="introduction" label="书籍" width="150" align="center"></el-table-column>
            <el-table-column label="内容" align="center">
                <template slot-scope="scope">
                    <ul style="height:100px;overflow:scroll;">
                        <li v-for="(item,index) in parseLyric(scope.row.lyric)" :key="index">
                            {{item}}
                        </li>
                    </ul>
                </template>
            </el-table-column>
            <el-table-column label="资源更新" align="center" width="100">
                <template slot-scope="scope">
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatorUpload"
                        :on-success="handleAvatorSuccess">
                        <el-button size="mini">更新图片</el-button>
                    </el-upload>
                    <br/>
                    <el-upload :action="uploadSongUrl(scope.row.id)" :before-upload="beforeSongUpload"
                        :on-success="handleSongSuccess">
                        <el-button size="mini">更新章节</el-button>
                    </el-upload>
                </template>
            </el-table-column>

            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="pagination">
            <el-pagination
                background
                layout = "total,prev,pager,next"
                :current-page="currentPage"
                :page-size="pageSize"
                :total="tableData.length"
                @current-change="handleCurrentChange"
                >
            </el-pagination>
        </div>

        <el-dialog title="添加章节" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" action="" id="tf">
                <div>
                    <label>章节名</label>
                    <el-input type="text" name="name"></el-input>
                </div>
                <div>
                    <label>书籍</label>
                    <el-input type="text" name="introduction"></el-input>
                </div>
                <div>
                    <label>内容</label>
                    <el-input type="textarea" name="lyric"></el-input>
                </div>
                <div>
                    <label>章节上传</label>
                    <input type="file" name="file">
                </div>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSong">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="批量添加" :visible.sync="centerDialogVisible2" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" action="" id="hh">

                <div>
                    <label>书籍</label>
                    <el-input type="text" name="introduction"></el-input>
                </div>

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

        <el-dialog title="修改章节" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px">
                <el-form-item prop="name" label="作者-章节名" size="mini">
                    <el-input v-model="form.name" placeholder="作者-章节名"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="书籍" size="mini">
                    <el-input v-model="form.introduction" placeholder="书籍"></el-input>
                </el-form-item>
                <el-form-item prop="lyric" label="内容" size="mini">
                    <el-input v-model="form.lyric" placeholder="内容" type="textarea"></el-input>
                </el-form-item>

            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="删除章节" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { mixin } from '../mixins/index';
import {mapGetters} from 'vuex';
import '@/assets/js/iconfont.js';
import {songOfSingerId,updateSong,delSong} from '../api/index';

export default {
    mixins: [mixin],
    data(){
        return{
            singerId: '',               //歌手id
            singerName: '',             //歌手名
            centerDialogVisible: false,
             centerDialogVisible2: false,//添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
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
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 5,    //分页每页大小
            currentPage: 1,  //当前页
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            toggle: false           //播放器的图标状态
        }
    },
    computed:{
        ...mapGetters([
            'isPlay'
        ]),
        //计算当前搜索结果表里的数据
        data(){
            return this.tableData.slice((this.currentPage - 1) * this.pageSize,this.currentPage * this.pageSize)
        }
    },
    watch:{
        //搜索框里面的内容发生变化的时候，搜索结果table列表的内容跟着它的内容发生变化
        select_word: function(){
            if(this.select_word == ''){
                this.tableData = this.tempData;
            }else{
                this.tableData = [];
                for(let item of this.tempData){
                    if(item.name.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.singerId = this.$route.query.id;
        this.singerName = this.$route.query.name;
        this.getData();
    },
    destroyed() {
        this.$store.commit('setIsPlay',false);
    },
    methods:{


        //获取当前页
        handleCurrentChange(val){
            this.currentPage = val;
        },
        //查询所有歌手
        getData(){
            this.tempData = [];
            this.tableData = [];
            songOfSingerId(this.singerId).then(res => {
                this.tempData = res;
                this.tableData = res;
                this.currentPage = 1;
            })
        },
        //添加歌手
        addSong(){
            let _this = this;
            var form = new FormData(document.getElementById('tf'));
            form.append('singerId',this.singerId);
            form.set('name',this.singerName+'-'+form.get('name'));
            if(!form.get('lyric')){
                form.set('lyric','[00:00:00]暂无歌词');
            }
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
            req.open('post',`${_this.$store.state.HOST}/song/add`,false);
            req.send(form);
            _this.centerDialogVisible = false;
        },
        addmSong(){
            let _this = this;
            var form = new FormData(document.getElementById('hh'));
            form.append('singerId',this.singerId);


            form.set('name',this.singerName);

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
            req.open('post',`${_this.$store.state.HOST}/song/addm`,false);
            req.send(form);
            _this.centerDialogVisible2 = false;
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                name: row.name,
                introduction: row.introduction,
                lyric: row.lyric
            }
        },
        //保存编辑页面修改的数据
        editSave(){
            let params = new URLSearchParams();
            params.append('id',this.form.id);
            params.append('name',this.form.name);
            params.append('introduction',this.form.introduction);
            params.append('lyric',this.form.lyric);

            updateSong(params)
            .then(res => {
                if(res.code == 1){
                    this.getData();
                    this.notify("修改成功","success");
                }else{
                    this.notify("修改失败","error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.editVisible = false;
        },
        //更新图片
        uploadUrl(id){
            return `${this.$store.state.HOST}/song/updateSongPic?id=${id}`
        },
        //删除一名歌手
        deleteRow(){
            delSong(this.idx)
            .then(res => {
                if(res){
                    this.getData();
                    this.notify("删除成功","success");
                }else{
                    this.notify("删除失败","error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.delVisible = false;
        },
        //解析歌词
        parseLyric(text){
            let lines = text.split("\n");
            let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g;
            let result = [];
            for(let item of lines){
                let value = item.replace(pattern,'');
                result.push(value);
            }
            return result;
        },
        //上传歌曲之前的校验
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
        //切换播放歌曲
        setSongUrl(url,name) {
            this.toggle = name;
            this.$store.commit('setUrl',this.$store.state.HOST + url);
            if(this.isPlay){
                this.$store.commit('setIsPlay',false);
            }else{
                this.$store.commit('setIsPlay',true);
            }
        }
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .song-img{
        width: 100%;
        height: 80px;
        border-radius: 5px;
        margin-bottom: 5px;
        overflow: hidden;
    }
    .handle-input{
        width: 300px;
        display: inline-block;
    }
    .pagination{
        display: flex;
        justify-content: center;
    }
    .play {
        position: absolute;
        z-index: 100;
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        top: 18px;
        left: 15px;
    }

    .icon {
        width: 2em;
        height: 2em;
        color: white;
        fill: currentColor;
        overflow: hidden;
    }

    >>> .el-input__inner{
  width: 250px;
height:40px;
  display: inline-block;

}
.button1{
  width:100px;
  height:40px;
  background-color: #253041;
  font-weight:bold;
  font-size:200;
  border:0px;
}
</style>
