<template>
  <div class="allgpt">
    <img src="../assets/img/gpt.png" class="gptimage"></img>
    <textarea class="soutput" type="text" placeholder="回复" readonly="readonly" v-model="value"></textarea>
    <div class="search">
      <input class="sinput" type="text" placeholder="提问" @keyup.enter="goSearch()" v-model="textMsg">
      <div class="search-btn" @click="sendMessge()" >
        <img src="../assets/img/tiwen.png" class="icon">
      </div>

    </div>




  </div>




</template>

<script>
import {getgpt} from '../api/index';


export default {
  name: 'gpt',
  data() {
    return {
      textMsg: '',
      value: '',

    }
  },



  methods: {

    sendMessge(){



      if(this.textMsg===''||this.textMsg===' '||this.textMsg.length===0){
        return;
      }

      // this.textMsg = this.textMsg.replaceAll('\n','');

      this.value="提问成功，请等待。";

      getgpt(this.textMsg).then(res =>{
          this.value= res;
          })
      },
    },
}
</script>

<style scoped>
page {
  height: 100%;
  background-color: rgba(244, 244, 244, 1);
}
.gptimage{
  margin-top: 10%;
  margin-left: 46%;
  height:100px;
}
.search{
  float:left;
  width:100%;
  height:50px;
  border-radius: 0px;
  margin-bottom:0.5%;
}
.soutput{
  margin-top: 50px;
  margin-bottom: 100px;
  width:44.5%;
  height:200px;
  margin-left: 27%;
  text-indent: 10px;
  border: 1%;
}
.sinput{
  float:left;
  width:40%;
 height:100%;
  margin-left: 27%;
  text-indent: 10px;
  border: 1%;

}
.search-btn{
  cursor: pointer;
  height:100%;

}
.icon {
  height:100%;
   background-color:#ffd900;
  color: #fff;
 }
</style>
