<template>
<div>

    <navbar title="购票列表" v-on:back = "onback"></navbar>
    <div class="content section">

        <text class="word bold">票型名称</text>
        <text class="word bold">票种</text>
        <text class="word bold">票价</text>
        <text class="word bold">购买数量</text>


    </div>

    <list class="list">
        <cell class="cell" v-for="item in items" @click="todetail">

            <div class="content">

                <text class="word">{{item.name}}</text>
                <text class="word">{{item.type}}</text>
                <text class="word">{{item.price}}</text>
                <numvue></numvue>

            </div>

        </cell>

    </list>

</div>



</template>

<style>


    .word{

        color: #000;
        font-size: 30px;
        flex:1;
        text-align: center;
        height: 45px;
    }
    .blod{

        font-weight: bold;
        margin-left: 30px;
    }

    .content{

        padding-left:20px;
        padding-right:20px;
        flex-direction: row;
        text-align: center;
        justify-content: center;
        align-items: center;
        border-bottom-color: #ccc;
        border-bottom-width: 1px;

    }


    .list{

        width: 750px;
        
    }
    .cell{

        width: 750px;
        height: 90px;
    }
    .section{

        height: 65px;
    }

</style>

<script>

import navbar from './navbar.vue'
import numvue from './changenum.vue'

 var navigator = weex.requireModule('navigator')
 var checkcard = weex.requireModule('checkcard')
 var storage = weex.requireModule('storage')

export default {

    data(){

        return {

            items:[
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
                {name:'测试票型01',type:'成人票',price:'0.01',num:'1'},
            ]
        }

    },

    components:{

        navbar,
        numvue

    },

    methods:{

        onback(){

            console.log("back..........")
            navigator.pop({

                animatied:'true'

            },function(){

        }) 
      },
      todetail(event){

          var self = this;
            checkcard.openScan('aaa',function(ret){

                console.log(ret)
                storage.setItem('result',ret.result,event => {

                console.log('保存数据成功:'+ event)
                    

                })
                self.scanresult(ret.result)
            })

      },
      scanresult(result){

        this.url = this.$getConfig().bundleUrl
        var nativeBase = this.url.substring(0, this.url.lastIndexOf('/') + 1)

            navigator.push({

            url:nativeBase+'sureinfo.js',
                    animated:'true',

                },function(e){

            })  
      }
    
  }
  
}
</script>


