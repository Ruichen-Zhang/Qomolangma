<template>
    <div class="table">
        <div class="topb">
            <h2>书籍管理</h2>
        </div>
        <div class="container">
            <div class="handle-box">

                <el-input v-model="select_word" size="mini" placeholder="筛选关键字" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" class="button1">添加书籍</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="data" @selection-change="handleSelectionChange">

            <el-table-column label="书单图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="songList-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatorUpload"
                        :on-success="handleAvatorSuccess">
                        <el-button size="mini">更新图片</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="title" label="标题" width="120" align="center"></el-table-column>
            <el-table-column label="简介">
                <template slot-scope="scope">
                    <p style="height:100px;overflow:scroll">{{scope.row.introduction}}</p>
                </template>
            </el-table-column>
            <el-table-column prop="style" label="风格" width="120" align="center"></el-table-column>
            <el-table-column label="书籍管理" width="110" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="songEdit(scope.row.id)">书籍管理</el-button>
                </template>
            </el-table-column>
            <el-table-column label="评论" width="80" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="getComment(data[scope.$index].id)">评论</el-button>
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

        <el-dialog title="添加书单" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="registerForm.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
                <el-form-item prop="style" label="风格" size="mini">
                    <el-input v-model="registerForm.style" placeholder="风格"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSongList">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="修改书单" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="form.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="form.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
                <el-form-item prop="style" label="风格" size="mini">
                    <el-input v-model="form.style" placeholder="风格"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="删除书单" :visible.sync="delVisible" width="400px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getAllSongList,setSongList,updateSongList,delSongList,getAllSongList2} from '../api/index';
import { mixin } from '../mixins/index';
import {mapGetters} from 'vuex';
export default {
    mixins: [mixin],
    data(){
        return{
            centerDialogVisible: false, //添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            registerForm:{      //添加框
                title: '',
                introduction: '',
                style: ''
            },
            form:{      //编辑框
                id: '',
                title: '',
                introduction: '',
                style: ''
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 5,    //分页每页大小
            currentPage: 1,  //当前页
            idx: -1,          //当前选择项
            multipleSelection: []   //哪些项已经打勾
        }
    },
    computed:{
        //计算当前搜索结果表里的数据
        data(){
            return this.tableData.slice((this.currentPage - 1) * this.pageSize,this.currentPage * this.pageSize)
        },
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'userId',           //当前登录用户id
        ])
    },
    watch:{
        //搜索框里面的内容发生变化的时候，搜索结果table列表的内容跟着它的内容发生变化
        select_word: function(){
            if(this.select_word == ''){
                this.tableData = this.tempData;
            }else{
                this.tableData = [];
                for(let item of this.tempData){
                    if(item.title.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.getData();
    },
    methods:{
        //获取当前页
        handleCurrentChange(val){
            this.currentPage = val;
        },
        //查询所有歌单

        getData(){
            this.tempData = [];
            this.tableData = [];
            getAllSongList2(this.userId).then(res => {
                this.tempData = res;
                this.tableData = res;
                this.currentPage = 1;
            })
        },
        //添加歌单
        addSongList(){
            let params = new URLSearchParams();
            params.append('title',this.registerForm.title);
            params.append('pic','/img/songListPic/123.jpg');
            params.append('introduction',this.registerForm.introduction);
            params.append('style',this.registerForm.style);
             params.append('userId',this.userId);

            setSongList(params)
            .then(res => {
                if(res.code == 1){
                    this.getData();
                    this.notify("添加成功","success");
                }else{
                    this.notify("添加失败","error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.centerDialogVisible = false;
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                title: row.title,
                introduction: row.introduction,
                style: row.style
            }
        },
        //保存编辑页面修改的数据
        editSave(){
            let params = new URLSearchParams();
            params.append('id',this.form.id);
            params.append('title',this.form.title);
            params.append('introduction',this.form.introduction);
            params.append('style',this.form.style);

            updateSongList(params)
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
            return `http://43.153.63.130:8888/songList/updateSongListPic?id=${id}`
        },
        //删除一个歌单
        deleteRow(){
            delSongList(this.idx)
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
        //转向歌曲管理页面
        songEdit(id,name){
            this.$router.push({path:`/ListSong`,query:{id}});
        },
        //转向该歌单的评论列表
        getComment(id){
            this.$router.push({path: '/comment',query:{id}})
        },
        delAll(){
            for(let item of this.multipleSelection){
                this.handleDelete(item);
                this.deleteRow();
            }
            this.multipleSelection = [];
        },
         getUrl(url){
            return `http://43.153.63.130:8888/${url}`
        },
        beforeAvatorUpload(file){
            const isJPG = (file.type === 'image/jpeg')||(file.type === 'image/png');
            if(!isJPG){
                this.$message.error('上传头像图片只能是jpg或png格式');
                return false;
            }
            const isLt2M = (file.size / 1024 /1024) < 2;
            if(!isLt2M){
                this.$message.error('上传头像图片大小不能超过2MB');
                return false;
            }
            return true;
        },
        //上传图片成功之后要做的工作
        handleAvatorSuccess(res){
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
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .songList-img{
        width: 100%;
        height: 80px;
        border-radius: 5px;
        margin-bottom: 5px;
        overflow: hidden;
    }
    .handle-input{
        width: 300px;
        display: inline-block;
        margin-left:100px;
    }
    .pagination{
        display: flex;
        justify-content: center;
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
    border:0px;
  font-weight:bold;
  font-size:200;
}
.table{
    margin-top:70px;
}

.topb{
  height:50px;
  width:95%;
  padding-left: 5%;
  padding-top: 18px;
  background-color: #ffffff;
  font-size: small;
}
</style>
